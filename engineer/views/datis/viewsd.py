from django.shortcuts import render
from django.db import connection
from datetime import date,datetime,timedelta
from login import models as models
from django.core.mail import send_mail
from django.contrib import messages
from login import views 
from operator import itemgetter

# Create your views here.
def sent(request):
    if request.session.has_key('uid'):
        id = request.session['uid']
        mail = request.POST['feedback'] 
        send_mail('urgent',mail,'aai.urgent@gmail.com',['kelkarkulbhushan@gmail.com'],fail_silently=False)
        return routebackdatisd(request, id )

def logoutd(request,id):
   try:
      del request.session['uid']
      request.session.flush()
   except:
      pass
   return render(request,'login/login.html')

def routebackdatisd(request, id) :
  if request.session.has_key('uid'):
    cursor = connection.cursor() 
    s0 = models.Engineer.objects.all()
    s0 = s0.values('a_id')
    s0 = s0.filter(emp_id=id)

    _q = models.Airport.objects
    _q = _q.filter(a_id__in=s0)
    name1 = _q.all()
                
    q = models.Engineer.objects
    q = q.values('name','designation','a_id')
    q = q.filter(emp_id=id)
    empdetails = q.all()
    supdetails = models.Supervisor.objects.all()
    supdetails = supdetails.values('name','contact','email').filter(dept='C')
    
    ddr =0            
    statusd = ""
    datisd_deadline = ""
        #!!!!!!!!!!!!!!!!!datis daily!!!!!!!!!!!!!!!!!!!!!!!!
    currdate = date.today()
    currtime = datetime.now().strftime("%H:%M:%S")            
    datisdsub_on = cursor.execute("select date from datisdaily where date = %s",[date.today()])    
    if datisdsub_on :
        statusd = models.Datisdaily.objects.all()
        statusd = statusd.values('date','status')
        statusd = statusd.order_by('-date')
        statusd = statusd.values('status')
        statusd = statusd.values('status').filter(a_id=1)[0]['status']
        if statusd == "PENDING" :
            datisdsub_on = currdate
            datisd_deadline = currdate
            ddr=0
        elif statusd == "COMPLETED" :
            datisd_deadline = currdate + timedelta(days=1)
            datisdsub_on = currdate
            ddr =1 
        elif statusd == "COMPLETED WITH ERRORS" :
            datisd_deadline = date.today() + timedelta(days=1)
            datisdsub_on = currdate
            ddr = 1
   
    else :
        datisd_deadline = models.Datisdaily.objects.all()
        datisd_deadline = datisd_deadline.values('date')
        datisd_deadline = datisd_deadline.order_by('-date')
        datisd_deadline = datisd_deadline.values('date').filter(a_id=1)[0]['date']
        datisdsub_on = datisd_deadline
        datisd_deadline = datisd_deadline + timedelta(days=2)
        tempdate = datisdsub_on + timedelta(days=1)
        i = 1 
        while i == 1 and tempdate != date.today() : 
         if (datisd_deadline <= date.today()) :    
            #remarks = "---Report not submitted---"
            #statusd = "COMPLETED"
            #val = (tempdate,currtime,'1',id,statusd,'2',remarks)
            #sql = "INSERT INTO datisdaily (date,time,a_id,emp_id,status,f_id,remarks) values (%s ,%s,%s,%s,%s, %s,%s)"
            #cursor.execute(sql,val)  
            datisdsub_on = date.today()-timedelta(days=1)    
            tempdate = tempdate + timedelta(days=1)
         else : 
            break
        datisd_deadline = date.today()
       
    #!!!!!!!!!!!!!!!!!!!!!!!datis weekly!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    p_id = models.Datisweekly.objects.all()
    p_id = p_id.values('p_id')
    p_id = p_id.order_by('-p_id')
    p_id = p_id.values('p_id').filter(a_id=1)[0]['p_id']
    currdate = date.today()
    wdate = models.Datisweekly.objects.all()
    wdate = wdate.values('date')
    wdate = wdate.order_by('-date')
    wdate1 = wdate
    wdate = wdate.values('date').filter(a_id=1)[0]['date']
    wdate1 = wdate1.values('date').filter(a_id=1)[1]['date']
    wdate = str(wdate)
    wdate = datetime.strptime(wdate, "%Y-%m-%d").date()
    temp = wdate
    temp1 = wdate1 + timedelta(days=7)
    wdate = wdate + timedelta(days=7) 
    dwr = 0
    datiswsub_on = temp
    datiswsub_deadline =  wdate 
    status = ""
    status = models.Datisweekly.objects.all()
    status = status.values('date','status','unit_incharge_approval')
    status = status.order_by('-date')
    uia = status
    uia = uia.values('unit_incharge_approval')
    uia = uia.values('unit_incharge_approval').filter(a_id=1)[0]['unit_incharge_approval']
    status = status.values('status')
    status = status.values('status').filter(a_id=1)[0]['status']
    flag = cursor.execute("select date from datisweekly where date = %s",[date.today()])    
        
    if currdate > wdate :  #if it goes beyond 7 days
        dwr = 0
    print(flag)     
    if flag :    
        if  temp1 < temp : #report submitted after deadline
            datiswsub_deadline = temp1    
            if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                dwr=1
                print(temp1)  
            elif status == "PENDING" :
                dwr=0
            
        elif temp == temp1 and temp == currdate : # report submitted on same day as deadline
            datiswsub_deadline = temp    
            if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                dwr=1  
            elif status == "PENDING" :
                dwr=0
            
        elif temp1 < wdate and temp1 > temp : #report submitted before the deadline 
            datiswsub_deadline = temp1   
            if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                dwr=1  
            elif status == "PENDING" :
                dwr=0
        print(dwr)   
    print(datiswsub_on) 
    datisdaily=[entry for entry in models.Datisdaily.objects.filter(emp_id=id).values().order_by('-date')]
    for item in datisdaily:
        item.update( {"type":"Datisdaily"})
                
    datisweekly=[entry for entry in models.Datisweekly.objects.filter(emp_id=id).values().order_by('-date')]
    for item in datisweekly:
        item.update( {"type":"Datisweekly"})
    com=datisdaily+[i for i in datisweekly]
    com=sorted(com,key=itemgetter('date'),reverse=True)
    for i in com:
        i.update({'token':i['p_id']})
     
    '''
    #!!!!!!!!!!!!!!!!!!!!!vhfdaily!!!!!!!!!!!!!!!!!!!!!!!!
    vdr = 0
    statusvd = ""
    currdate = date.today()            
    vhfdsub_on = cursor.execute("select date from vhfdaily where date = %s",[date.today()])    
    if vhfdsub_on :
        statusvd = models.Vhfdaily.objects.all()
        statusvd = statusvd.values('date','status')
        statusvd = statusvd.order_by('-date')
        statusvd = statusvd.values('status')
        statusvd = statusvd.values('status').filter(a_id=1)[0]['status']
        if statusvd == "PENDING" :
            vhfdsub_on = currdate
            vhfd_deadline = currdate
            vdr=0
        elif statusvd == "COMPLETED" :
            vhfd_deadline = currdate + timedelta(days=1)
            vhfdsub_on = currdate
            vdr = 1 
        elif statusvd == "COMPLETED WITH ERRORS" :
            vhfd_deadline = currdate + timedelta(days=1)
            vhfdsub_on = currdate
            vdr = 1
    else :
        vhfd_deadline = models.Vhfdaily.objects.all()
        vhfd_deadline = vhfd_deadline.values('date')
        vhfd_deadline = vhfd_deadline.order_by('-date')
        vhfd_deadline = vhfd_deadline.values('date').filter(a_id=1)[0]['date']
        vhfdsub_on = vhfd_deadline
        vhfd_deadline = vhfd_deadline + timedelta(days=2)
        if (vhfd_deadline <= date.today()) :    
         #   remarks = "---Report not submitted---"
          #  statusvd = "COMPLETED"
          #  val = ((date.today()-timedelta(days=1)),id,status,'1',remarks)
          #  sql = "INSERT INTO vhfdaily (date,emp_id,status,f_id,remarks) values (%s ,%s,%s, %s,%s)"
          #  cursor.execute(sql,val)  
            vhfdsub_on = date.today()-timedelta(days=1)    
        else : 
            vhfd_deadline = date.today()
        
    
    
    #!!!!!!!!!!!!!!!!!!!!!!!vhfmonthly!!!!!!!!!!!!!!!!!!!!!!!!!!!!        
    
    vmr = 0
    currdate = date.today()
    wdate = models.Vhfmonthly.objects.all()
    wdate = wdate.values('date')
    wdate = wdate.order_by('-date')
    wdate = wdate.values('date').filter(a_id=1)[0]['date']
    wdate = str(wdate)
    wdate = datetime.strptime(wdate, "%Y-%m-%d").date()
    temp = wdate
    wdate = wdate + timedelta(days=30) 
    vhfmsub_on = temp
    if currdate > wdate :
        vhfmsub_deadline =  currdate 
    else :
        vhfmsub_deadline =  wdate
        vmr = 1
    #!!!!!!!!!!!!!!!!!!!!!!!!vhfyearly!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    vyr = 0
    currdate = date.today()
    wdate = models.Vhfyearly.objects.all()
    wdate = wdate.values('date')
    wdate = wdate.order_by('-date')
    wdate = wdate.values('date').filter(a_id=1)[0]['date']
    wdate = str(wdate)
    wdate = datetime.strptime(wdate, "%Y-%m-%d").date()
    temp = wdate
    wdate = wdate + timedelta(days=365) 
    vhfysub_on = temp
    if currdate > wdate :
        vhfysub_deadline =  currdate 
    else :
        vhfysub_deadline =  wdate
        vyr = 1
     #!!!!!!!!!!!!!!!!!!!!!!!!!!dscndaily!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    
    dsdr = 0
    currdate = date.today()            
    dscndsub_on = cursor.execute("select date from dscndaily where date = %s",[date.today()])    
    if dscndsub_on :
        dscnd_deadline = currdate + timedelta(days=1)
        dscndsub_on = currdate
        dsdr =1 
        
    else :
        dscnd_deadline = models.Dscndaily.objects.all()
        dscnd_deadline = dscnd_deadline.values('date')
        dscnd_deadline = dscnd_deadline.order_by('-date')
        dscnd_deadline = dscnd_deadline.values('date').filter(a_id=1)[0]['date']
        dscndsub_on = dscnd_deadline
        dscnd_deadline = dscnd_deadline + timedelta(days=2)
        if (dscnd_deadline <= date.today()) :    
            remarks = "---Report not submitted---"
            val = ((date.today()-timedelta(days=1)),id,'2',remarks)
            sql = "INSERT INTO dscndaily (date,emp_id,f_id,remarks) values (%s ,%s, %s,%s)"
            cursor.execute(sql,val)  
            dscndsub_on = date.today()-timedelta(days=1)    
        else : 
            dscnd_deadline = date.today()
   
    #!!!!!!!!!!!!!!!!!!!!!!!!dscnweekly!!!!!!!!!!!!!!!!!!!!!!!!!!
    currdate = date.today()
    wdate = models.Dscnweekly.objects.all()
    wdate = wdate.values('date')
    wdate = wdate.order_by('-date')
    wdate = wdate.values('date').filter(a_id=1)[0]['date']
    wdate = str(wdate)
    wdate = datetime.strptime(wdate, "%Y-%m-%d").date()
    temp = wdate
    wdate = wdate + timedelta(days=7) 
    dswr = 0
    dscnwsub_on = temp
    if currdate > wdate :
        dscnwsub_deadline =  currdate 
    else :
        dscnwsub_deadline =  wdate
        dswr =1 
    
    #!!!!!!!!!!!!!!!!!!!!!!!!dscnmonthly!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    dsmr = 0
    currdate = date.today()
    wdate = models.Dscnmonthly.objects.all()
    wdate = wdate.values('date')
    wdate = wdate.order_by('-date')
    wdate = wdate.values('date').filter(a_id=1)[0]['date']
    wdate = str(wdate)
    wdate = datetime.strptime(wdate, "%Y-%m-%d").date()
    temp = wdate
    wdate = wdate + timedelta(days=30) 
    dscnmsub_on = temp
    if currdate > wdate :
        dscnmsub_deadline =  currdate 
    else :
        dscnmsub_deadline =  wdate
        dsmr = 1
    
    return render(request,'./engineer/home.html',{'status':status,'dscnmsub_deadline':dscnmsub_deadline,'dscnmsub_on':dscnmsub_on,'dsmr':dsmr,'dswr':dswr,'dscnwsub_on':dscnwsub_on,'dscnwsub_deadline':dscnwsub_deadline,'dscnd_deadline':dscnd_deadline,'dscndsub_on':dscndsub_on,'dsdr':dsdr,'ddr':ddr,'dwr':dwr,'vdr':vdr,'vmr':vmr,'vyr':vyr,'currdate':currdate,'name':name1,'id':id,'empdet':empdetails,'datisdsub_on':datisdsub_on,'datisd_deadline':datisd_deadline,'datiswsub_on':datiswsub_on,'datiswsub_deadline':datiswsub_deadline,'vhfdsub_on':vhfdsub_on,'vhfd_deadline':vhfd_deadline,'vhfmsub_on':vhfmsub_on,'vhfmsub_deadline':vhfmsub_deadline,'vhfysub_on':vhfysub_on,'vhfysub_deadline':vhfysub_deadline})'''
    return render(request,'./engineer/home.html',{'com':com,'wdate':wdate,'supdetails':supdetails,'statusd':statusd,'status':status,'ddr':ddr,'dwr':dwr,'currdate':currdate,'name':name1,'id':id,'empdet':empdetails,'datisdsub_on':datisdsub_on,'datisd_deadline':datisd_deadline,'datiswsub_on':datiswsub_on,'datiswsub_deadline':datiswsub_deadline})
  else :
    return render(request,'login/login.html')  

def datisd(request, id) :
 if request.session.has_key('uid'):
   uid=request.session['uid'] 
   if int(uid) == int(id):
     cursor = connection.cursor() 
     currdate = date.today()
     datis_d = models.Datisdaily.objects.all()
     datis_d = datis_d.values('p_id','date','status','time','room_temp','status_of_ac','status_of_ups','status_of_servera','status_of_serverb','remarks')
     datis_d = datis_d.filter(emp_id=id)
     datisd = datis_d.order_by('-p_id')
     datis_d = datis_d.filter(date=currdate)     
      #'datetime_of_servers_wrt_gps_clk','status_of_disk_array','vhftx_atis_status','vhfrx_atis_status','datis_update','audio_quality','remarks','unit_incharge_approval')
     if datis_d :
        datisdlogs = models.Datisdlogs.objects.all()
        datisdlogs = datisdlogs.filter(date=date.today()).order_by('-log_id')
        supdetails = models.Supervisor.objects.all()
        supdetails = supdetails.values('name','contact','email').filter(dept='C')
        return render(request,'engineer/datis/datisdailyrep.html',{'supdetails':supdetails,'datis_d':datis_d,'id':id,'datisd':datisd,'datisdlogs':datisdlogs}) 
     else :
        messages.add_message(request,30, 'You cannot make changes to pending report!')
        return routebackdatisd(request, id)
   else :
       return routebackdatisd(request, uid)
 else : 
   return render(request,'login/login.html')

def homed(request, id, p_id) :
 if request.session.has_key('uid'):
   uid=request.session['uid'] 
   if int(uid) == int(id):
     cursor = connection.cursor() 
     currdate = date.today()
     datis_d = models.Datisdaily.objects.all().filter(emp_id=id)
     datisd = datis_d.order_by('-p_id')
     datis_d = datis_d.filter(p_id=p_id)     
     status = datis_d.values('status')[0]['status']
     f=0 
     if status == "COMPLETED WITH ERRORS" or status == "PENDING" :
         f = 1 
     if datis_d :
        datisdlogs = models.Datisdlogs.objects.all().filter(date=date.today()).order_by('-log_id')
        supdetails = models.Supervisor.objects.all()
        supdetails = supdetails.values('name','contact','email').filter(dept='C')
        return render(request,'engineer/datis/datisdailyrep.html',{'supdetails':supdetails,'datis_d':datis_d,'id':id,'datisd':datisd,'datisdlogs':datisdlogs,'f':f}) 
     else :
        messages.add_message(request,30, 'You cannot make changes to pending report!')
        return routebackdatisd(request, id)
   else :
       return routebackdatisd(request, uid)
 else : 
   return render(request,'login/login.html')
   
def datisdailyrec(request, id) :
 if request.session.has_key('uid'):
  uid=request.session['uid'] 
  if int(uid) == int(id):
     cursor = connection.cursor() 
     datis_d = models.Datisdaily.objects.all()
     datis_d = datis_d.values('p_id','date','time','status','room_temp','status_of_ac','status_of_ups','status_of_servera','status_of_serverb','unit_incharge_approval','approval_date','approval_time')
     datis_d = datis_d.filter(emp_id=id).order_by('-p_id')     
     #'datetime_of_servers_wrt_gps_clk','status_of_disk_array','vhftx_atis_status','vhfrx_atis_status','datis_update','audio_quality','remarks','unit_incharge_approval')
     return render(request,'engineer/datis/datisdrecords.html',{'datis_d':datis_d,'id':id}) 
  else :
     messages.add_message(request,30, 'Unauthorized Access')
     return routebackdatisd(request, uid)
 else : 
   return render(request,'login/login.html')

def datisdrep(request, id) :
 cursor = connection.cursor() 
 if request.session.has_key('uid') : 
   temp = cursor.execute("select date from datisdaily where date = %s",[date.today()])    
   uid=request.session['uid'] 
   if int(uid) == int(id) and temp == 0:
     supdetails = models.Supervisor.objects.all()
     supdetails = supdetails.values('name','contact','email').filter(dept='C')
     datis_d = models.Datisdaily.objects.all()
     datis_d = datis_d.values('p_id','date','time','room_temp','status_of_ac','status_of_ups','status_of_servera','status_of_serverb','remarks')
     datis_d = datis_d.filter(emp_id=id).order_by('-p_id') 
     return render(request,'engineer/datis/datisrepsub.html',{'id':id,'datis_d':datis_d,'supdetails':supdetails}) 
   else :
      messages.add_message(request,30, 'Unauthorized Access')
      return routebackdatisd(request, uid)  
 else : 
     return render(request,'login/login.html')
 
def editdatisdaily(request, p_id) :
 if request.session.has_key('uid'):
   temp = models.Datisdaily.objects.all().values('status').order_by('-date').filter(date=date.today())[0]['status']
   emp_id = models.Datisdaily.objects.all().values('emp_id').filter(p_id=p_id)[0]['emp_id']
   uid=request.session['uid'] 
   if int(uid) == int(emp_id) and temp == "PENDING" :
     emp_id = models.Datisdaily.objects.all()
     emp_id = emp_id.values('emp_id').filter(p_id=p_id)[0]['emp_id']
     datisd = models.Datisdaily.objects.all()
     datisd = datisd.values('p_id','emp_id','date','time','status','room_temp','status_of_ac','status_of_ups','status_of_servera','status_of_serverb','remarks')
     datis_d = datisd.filter(emp_id=emp_id).order_by('-p_id')     
     datisd = datisd.filter(p_id=p_id)
     datis_id = datisd.values('p_id').filter(p_id=p_id)[0]['p_id']
     datisdlogs = models.Datisdlogs.objects.all()
     datisdlogs = datisdlogs.filter(date=date.today()).order_by('-log_id')    
     supdetails = models.Supervisor.objects.all()
     supdetails = supdetails.values('name','contact','email').filter(dept='C')
     return render(request,'engineer/datis/editdatisrepsub.html',{'supdetails':supdetails,'datisd':datisd,'id':datis_id,'datis_d':datis_d,'datisdlogs':datisdlogs}) 
   else :
     return routebackdatisd(request, uid)  
 else : 
     return render(request,'login/login.html')
 
def updatisdaily(request, id) :
 if request.session.has_key('uid'): 
   uid=request.session['uid'] 
   emp_id = models.Datisdaily.objects.all()
   emp_id = emp_id.values('emp_id').filter(p_id=id)[0]['emp_id']
   if int(uid) == int(emp_id) :
    currtime = datetime.now().strftime("%H:%M:%S")
    currdate= date.today()
    cursor = connection.cursor() 
    p_id = models.Datisdaily.objects.all()
    p_id = p_id.values('p_id')
    p_id = p_id.order_by('-p_id')
    p_id = p_id.values('p_id').filter(a_id=1)[0]['p_id']
    roomtemp=''
    statusofac=''
    statusofservera=''
    statusofups=''
    statusofserverb=''
    remarks=request.POST['remarks']
    roomtemp=request.POST['Room Temperature']
    rint = int(roomtemp)
    
    if('roomtemp') and (rint > 24) :
         cursor.execute("update datisdaily set room_temp = %s where p_id = %s",[roomtemp,id])
         remarks1 = "Temperature not normal(update)"
         val = (emp_id,p_id,remarks1,roomtemp,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
         cursor.execute(sql,val)  
    else :
         cursor.execute("update datisdaily set room_temp = %s where p_id = %s",[roomtemp,id])
                
    statusofac=request.POST['Status of AC']
    if statusofac != 'SVCBL' :
         cursor.execute("update datisdaily set status_of_AC = %s where p_id = %s",[statusofac,id])
         remarks1 = "Status of ac not correct(update)"
         val = (emp_id,p_id,remarks1,statusofac,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
         cursor.execute(sql,val)
    else :
         cursor.execute("update datisdaily set status_of_AC = %s where p_id = %s",[statusofac,id])
         
    statusofups=request.POST['Status of UPS']
    if statusofups != 'NORMAL' :
         cursor.execute("update datisdaily set status_of_UPS = %s where p_id = %s",[statusofups,id])
         remarks1 = "Status of ups not NORMAL(update)"
         val = (emp_id,p_id,remarks1,statusofups,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
         cursor.execute(sql,val)
    else :
         cursor.execute("update datisdaily set status_of_UPS = %s where p_id = %s",[statusofups,id])
       
    statusofservera=request.POST['Status of Server A']
    if statusofservera != 'MAINS' and statusofservera != 'STANDBY' :
         cursor.execute("update datisdaily set status_of_serverA = %s where p_id = %s",[statusofservera,id])
         remarks1 = "Status of ServerA is not MAINS/STANDBY(update)"
         val = (emp_id,p_id,remarks1,statusofservera,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
         cursor.execute(sql,val)
    else :
         cursor.execute("update datisdaily set status_of_serverA = %s where p_id = %s",[statusofservera,id])
         
    statusofserverb=request.POST['Status of Server B']
    if statusofserverb != 'MAINS' and statusofserverb != 'STANDBY' :
         cursor.execute("update datisdaily set status_of_serverB = %s where p_id = %s",[statusofserverb,id])
         remarks1 = "Status of ServerB is not MAINS/STANDBY(update)"
         val = (emp_id,p_id,remarks1,statusofserverb,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
         cursor.execute(sql,val) 
    else :
         cursor.execute("update datisdaily set status_of_serverB = %s where p_id = %s",[statusofserverb,id])
    
    if statusofservera == "MAINS" and statusofserverb == "MAINS" :
         remarks1 = "Status of ServerA and serverB is on MAINS(update)"
         val = (emp_id,p_id,remarks1,statusofserverb,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
    
    if statusofservera == "STANDBY" and statusofserverb == "STANDBY" :
         remarks1 = "Status of ServerA and ServerB is on STANDBY(update)"
         val = (emp_id,p_id,remarks1,statusofserverb,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
        
    if (rint <= 24 and statusofservera == 'STANDBY' and statusofserverb == 'MAINS' and statusofups == 'NORMAL' and statusofac == 'SVCBL')  or (rint <= 24 and statusofservera == 'MAINS' and statusofserverb == 'STANDBY' and statusofups == 'NORMAL' and statusofac == 'SVCBL'):
          value = "All parameters NORMAL"
          val = (emp_id,p_id,value,remarks,currdate,currtime)
          sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
          cursor.execute(sql,val)
          cursor.execute("update datisdaily set status_of_serverB = %s where p_id = %s",[statusofserverb,id])
          cursor.execute("update datisdaily set status_of_serverA = %s where p_id = %s",[statusofservera,id])
          cursor.execute("update datisdaily set status_of_UPS = %s where p_id = %s",[statusofups,id])
          cursor.execute("update datisdaily set status_of_AC = %s where p_id = %s",[statusofac,id])
          cursor.execute("update datisdaily set room_temp = %s where p_id = %s",[roomtemp,id])
          cursor.execute("update datisdaily set status = %s where p_id = %s",["COMPLETED",id])
          cursor.execute("update datisdaily set unit_incharge_approval = %s where p_id = %s",[None,id])
   
    else :
          val = (emp_id,p_id,"Procedure Followed",remarks,currdate,currtime)
          sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
          cursor.execute(sql,val)  
          
    #cursor.execute("update datisdaily set remarks = %s where p_id = %s",[remarks1,id])
    datis_d = models.Datisdaily.objects.all()    
    datis_d = datis_d.values('p_id','date','status','time','room_temp','status_of_ac','status_of_ups','status_of_servera','status_of_serverb','remarks')
    datisd = datis_d
    datisd = datisd.filter(emp_id=emp_id).order_by('-p_id')
    datis_d = datis_d.filter(date=currdate)
    datisdlogs = models.Datisdlogs.objects.all()
    datisdlogs = datisdlogs.filter(date=date.today()).order_by('-log_id')    
    supdetails = models.Supervisor.objects.all()
    supdetails = supdetails.values('name','contact','email').filter(dept='C')
    return render(request,'engineer/datis/datisdailyrep.html',{'datisdlogs':datisdlogs,'supdetails':supdetails,'datis_d':datis_d,'id':emp_id,'datisd':datisd}) 
   else :
     return routebackdatisd(request, uid)  
 else : 
     return render(request,'login/login.html')
       
def datisdrepsubm(request, id) :
 if request.session.has_key('uid'):  
    cursor = connection.cursor()
    currdate= date.today()
    currtime = datetime.now().strftime("%H:%M:%S")
    a_id = models.Engineer.objects.all()
    a_id = a_id.values('a_id').filter(emp_id=id)[0]['a_id']
    roomtemp=''
    statusofac=''
    statusofservera=''
    statusofups=''
    statusofserverb=''
    roomtemp=request.POST['Room Temperature']
    statusofac = request.POST['Status of AC']
    statusofups = request.POST['Status of UPS']
    statusofservera=request.POST['Status of Server A']
    statusofserverb=request.POST['Status of Server B']
    rint = int(roomtemp)
    status = ""
    sql = "INSERT INTO datisdaily (a_id,emp_id,status,f_id,date,time,room_temp,status_of_AC,status_of_UPS,status_of_serverA,status_of_serverB) VALUES (%s, %s,%s,%s,%s,%s,%s, %s, %s, %s, %s)"
    val = (a_id,id,status,'2',date.today(),datetime.now().strftime("%H:%M:%S"),roomtemp,statusofac,statusofups,statusofservera,statusofserverb)
    cursor.execute(sql, val)
   
    p_id = models.Datisdaily.objects.all()
    p_id = p_id.values('p_id')
    p_id = p_id.order_by('-p_id')
    p_id = p_id.values('p_id').filter(a_id=1)[0]['p_id']
    
    if rint <= 24 and statusofac == 'SVCBL' and statusofups == 'NORMAL' and statusofservera == 'MAINS' and statusofserverb == 'STANDBY' :
          f=1
          status = "COMPLETED"
          remarks = "Parameters normal at the first submit!"
          value = "All parameters NORMAL"
          val = (id,p_id,remarks,value,currdate,currtime)
          sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
          cursor.execute(sql,val)
          cursor.execute("update datisdaily set unit_incharge_approval = %s where p_id = %s",[None,p_id])
   
    elif rint <= 24 and statusofac == 'SVCBL' and statusofups == 'NORMAL' and statusofservera == 'STANDBY' and statusofserverb == 'MAINS' :
          f=1
          status = "COMPLETED"
          remarks = "Parameters normal at the first submit!"
          value = "All parameters NORMAL"
          val = (id,p_id,remarks,value,currdate,currtime)
          sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
          cursor.execute(sql,val)
          cursor.execute("update datisdaily set unit_incharge_approval = %s where p_id = %s",[None,p_id])
   
    else :
          f=2   
          status = "PENDING"
    cursor.execute("update datisdaily set status = %s where p_id = %s",[status,p_id])
    f=0
    if roomtemp > '24' :
         remarks = "Temperature exceeds 24 degrees"
         val = (id,p_id,remarks,roomtemp,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
    if statusofac != 'SVCBL' :
         remarks = "Status of ac not correct"
         val = (id,p_id,remarks,statusofac,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
         print(statusofac)
    if statusofups != 'NORMAL' :
         remarks = "Status of ups not NORMAL"
         val = (id,p_id,remarks,statusofups,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
    if statusofservera != 'MAINS' and statusofservera != 'STANDBY' :
         remarks = "Status of ServerA is not MAINS/STANDBY"
         val = (id,p_id,remarks,statusofservera,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
    if statusofserverb != 'MAINS' and statusofserverb != 'STANDBY':
         remarks = "Status of ServerB is not MAINS/STANDBY"
         val = (id,p_id,remarks,statusofserverb,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
    if statusofservera == "MAINS" and statusofserverb == "MAINS" :
         remarks = "Status of ServerA and serverB is on MAINS"
         val = (id,p_id,remarks,statusofserverb,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
    
    if statusofservera == "STANDBY" and statusofserverb == "STANDBY" :
         remarks = "Status of ServerA and ServerB is on STANDBY"
         val = (id,p_id,remarks,statusofserverb,currdate,currtime)
         sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s,%s,%s,%s,%s,%s)"
         cursor.execute(sql,val)
    
    datis_d = models.Datisdaily.objects.all()
    datis_d = datis_d.values('p_id','date','time','status','room_temp','status_of_ac','status_of_ups','status_of_servera','status_of_serverb','remarks')
    datis_d = datis_d.filter(emp_id=id)  
    datisd = datis_d.order_by('-p_id')   
    datis_d = datis_d.filter(date=currdate)     
    datisdlogs = models.Datisdlogs.objects.all()
    datisdlogs = datisdlogs.filter(date=date.today()).order_by('-log_id')    
    supdetails = models.Supervisor.objects.all()
    supdetails = supdetails.values('name','contact','email').filter(dept='C')
     
     #'datetime_of_servers_wrt_gps_clk','status_of_disk_array','vhftx_atis_status','vhfrx_atis_status','datis_update','audio_quality','remarks','unit_incharge_approval')
    return render(request,'engineer/datis/datisdailyrep.html',{'supdetails':supdetails,'datis_d':datis_d,'id':id,'datisd':datisd,'datisdlogs':datisdlogs})
 else : 
     return render(request,'login/login.html')
 
def repsuberrors(request,p_id, id):
 if request.session.has_key('uid'): 
   uid=request.session['uid'] 
   if int(uid) == int(id) :
    cursor = connection.cursor() 
    datisd = models.Datisdaily.objects.all()
    datisd = datisd.values('p_id','emp_id','date','time','room_temp','status','status_of_ac','status_of_ups','status_of_servera','status_of_serverb','remarks')
    datisd = datisd.filter(p_id=p_id)
    return render(request,'engineer/datis/datisfinalrep.html',{'datisd':datisd,'p_id':p_id,'id':id}) 
   else :
    return routebackdatisd(request, uid)  
 else : 
    return render(request,'login/login.html')
 
def finalrepsub(request,p_id, id): 
    f=1
    cursor = connection.cursor()
    currdate= date.today()
    currtime = datetime.now().strftime("%H:%M:%S")
    value = request.POST['remarks']
    remarks = "Final submit with errors"
    val = (id,p_id,remarks,value,currdate,currtime)
    sql = "INSERT INTO datisdlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s, %s , %s,%s)"
    cursor.execute(sql,val)
    cursor.execute("update datisdaily set status = %s where p_id = %s",["COMPLETED WITH ERRORS",p_id])
    cursor.execute("update datisdaily set unit_incharge_approval = %s where p_id = %s",[None,p_id])
    
    if request.session.has_key('uid'):
        cursor = connection.cursor() 
        currdate = date.today()
        datis_d = models.Datisdaily.objects.all()
        datis_d = datis_d.values('p_id','date','time','status','room_temp','status_of_ac','status_of_ups','status_of_servera','status_of_serverb','remarks')
        datis_d = datis_d.filter(emp_id=id)
        datisd = datis_d.order_by('-p_id')
        datis_d = datis_d.filter(date=currdate)     
        datisdlogs = models.Datisdlogs.objects.all()
        datisdlogs = datisdlogs.filter(date=date.today()).order_by('-log_id')    
        supdetails = models.Supervisor.objects.all()
        supdetails = supdetails.values('name','contact','email').filter(dept='C')
        return render(request,'engineer/datis/datisdailyrep.html',{'supdetails':supdetails,'datis_d':datis_d,'id':id,'f':f,'datisd':datisd,'datisdlogs':datisdlogs}) 
    else : 
        return render(request,'login/login.html')
