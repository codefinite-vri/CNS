from django.shortcuts import render
from datetime import date,datetime,timedelta
from django.db import connection
from cryptography.fernet import Fernet as frt
from supervisor.views import main
from operator import itemgetter
from django.http import HttpResponse
from .. import models
from django.db import connection
def dhomeview(request,id) :   #communication dept
    request.session['uid']= id
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
    ddr =0           
    supdetails = models.Supervisor.objects.all()
    supdetails = supdetails.values('name','contact','email').filter(dept='C')
    statusd = "" 
        #!!!!!!!!!!!!!!!!!datis daily!!!!!!!!!!!!!!!!!!!!!!!!
    uia = None
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
            ddr = 1 
        elif statusd == "COMPLETED WITH ERRORS" :
            datisd_deadline = currdate + timedelta(days=1)
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
            remarks = "---Report not submitted---"
            statusd = "PENDING"
            val = (tempdate,currtime,'1',id,statusd,'2',remarks)
            sql = "INSERT INTO datisdaily (date,time,a_id,emp_id,status,f_id,remarks) values (%s ,%s,%s,%s,%s, %s,%s)"
            cursor.execute(sql,val)  
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
    if currdate > wdate and flag == 0 :  #if it goes beyond 7 days
        pending = wdate 
        while pending <= (currdate - timedelta(days=1)) :
            f = cursor.execute("select date from datiswlogs where date = %s",[pending])    
            if f == 0 : 
                remarks = "Report not submitted"
                value = "No Entry" 
                val = (id,p_id,remarks,value,pending,currtime)
                sql = "INSERT INTO datiswlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s ,%s, %s,%s)"
                cursor.execute(sql,val)
            pending = pending + timedelta(days=1)    
        dwr = 0
         
    if flag :    
        if  temp1 < temp : #report submitted after deadline
            datiswsub_deadline = temp1    
            if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                dwr=1  
            elif status == "PENDING" :
                dwr=0
            
        elif temp == temp1 and temp == currdate : # report submitted on a day same as deadline
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
    
     #!!!!!!!!!!!!!!!!!!!!dscn daily!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
    dsdr = 0 
    statusdsd = ""
    uia = None
    dscnd_deadline = ""
    currdate = date.today()
    currtime = datetime.now().strftime("%H:%M:%S")
    dscndsub_on = cursor.execute("select date from dscndaily where date = %s",[date.today()])    
    if dscndsub_on :
        statusdsd = models.Dscndaily.objects.all()
        statusdsd =  statusdsd.values('date','status')
        statusdsd = statusdsd.order_by('-date')
        statusdsd = statusdsd.values('status')
        statusdsd = statusdsd.values('status').filter(a_id=1)[0]['status']
        if statusdsd == "PENDING" :
            dscndsub_on = currdate
            dscnd_deadline = currdate
            dsdr=0
        elif statusdsd == "COMPLETED" :
            dscnd_deadline = currdate + timedelta(days=1)
            dscndsub_on = currdate
            dsdr = 1 
        elif statusdsd == "COMPLETED WITH ERRORS" :
            dscnd_deadline = currdate + timedelta(days=1)
            dscndsub_on = currdate
            dsdr = 1
    else :
        dscnd_deadline = models.Dscndaily.objects.all()
        dscnd_deadline = dscnd_deadline.values('date')
        dscnd_deadline = dscnd_deadline.order_by('-date')
        dscnd_deadline = dscnd_deadline.values('date').filter(a_id=1)[0]['date']
        dscndsub_on = dscnd_deadline
        dscnd_deadline = dscnd_deadline + timedelta(days=2)
        tempdate = dscndsub_on + timedelta(days=1)
        i = 1 
        while i == 1 and tempdate != date.today() : 
         if (dscnd_deadline <= date.today()) : 
            remarks = "---Report not submitted---"
            statusd = "PENDING"
            val = (tempdate,currtime,'1',id,statusd,'3',remarks)
            sql = "INSERT INTO dscndaily (date,time,a_id,emp_id,status,f_id,remarks) values (%s ,%s,%s,%s,%s, %s,%s)"
            cursor.execute(sql,val)  
            dscndsub_on = date.today()-timedelta(days=1)    
            tempdate = tempdate + timedelta(days=1)
         else : 
            break
        dscnd_deadline = date.today()
   
    #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!dscn monthly!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    p_id = models.Datisweekly.objects.all()
    p_id = p_id.values('p_id')
    p_id = p_id.order_by('-p_id')
    p_id = p_id.values('p_id').filter(a_id=1)[0]['p_id']
    currdate = date.today()
    wdatedm = models.Dscnmonthly.objects.all()
    wdatedm = wdatedm.values('date')
    wdatedm = wdatedm.order_by('-date')
    wdate1 = wdatedm
    wdatedm = wdatedm.values('date').filter(a_id=1)[0]['date']
    wdate1 = wdate1.values('date').filter(a_id=1)[1]['date']
    wdatedm = str(wdatedm)
    wdatedm = datetime.strptime(wdatedm, "%Y-%m-%d").date()
    temp = wdatedm
    temp1 = wdate1 + timedelta(days=30)
    wdatedm = wdatedm + timedelta(days=30) 
    dsmr = 0
    dscnmsub_on = temp
    dscnmsub_deadline =  wdatedm 
    statusdm = ""
    statusdm = models.Dscnmonthly.objects.all()
    statusdm = statusdm.values('date','status','unit_incharge_approval')
    statusdm = statusdm.order_by('-date')
    uia = statusdm
    uia = uia.values('unit_incharge_approval')
    uia = uia.values('unit_incharge_approval').filter(a_id=1)[0]['unit_incharge_approval']
    statusdm = statusdm.values('status')
    statusdm = statusdm.values('status').filter(a_id=1)[0]['status']
    flag = cursor.execute("select date from dscnmonthly where date = %s",[date.today()])    
    if currdate > wdatedm and flag == 0 :  #if it goes beyond 7 days
        pending = wdatedm 
        while pending <= (currdate - timedelta(days=1)) :
            f = cursor.execute("select date from dscnwlogs where date = %s",[pending])    
            if f == 0 : 
                remarks = "Report not submitted"
                value = "No Entry" 
                val = (id,p_id,remarks,value,pending,currtime)
                sql = "INSERT INTO dscnmlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s ,%s, %s,%s)"
                cursor.execute(sql,val)
            pending = pending + timedelta(days=1)    
        dsmr = 0
         
    if flag :    
        if  temp1 < temp : #report submitted after deadline
            dscnm_deadline = temp1    
            if statusdm == "COMPLETED" or statusdm == "COMPLETED WITH ERRORS" :
                dsmr=1  
            elif statusdm == "PENDING" :
                dsmr=0
            
        elif temp == temp1 and temp == currdate : # report submitted on a day same as deadline
            dscnmsub_deadline = temp    
            if statusdm == "COMPLETED" or statusdm == "COMPLETED WITH ERRORS" :
                dsmr=1  
            elif statusdm == "PENDING" :
                dsmr=0
            
        elif temp1 < wdatedm and temp1 > temp : #report submitted before the deadline 
            dscnmsub_deadline = temp1   
            if statusdm == "COMPLETED" or statusdm == "COMPLETED WITH ERRORS" :
                dsmr=1  
            elif statusdm == "PENDING" :
                dsmr=0
               
    datisdaily=[entry for entry in models.Datisdaily.objects.filter(emp_id=id).values().order_by('-date')]
    for item in datisdaily:
        item.update( {"type":"Datisdaily"})
                
    datisweekly=[entry for entry in models.Datisweekly.objects.filter(emp_id=id).values().order_by('-date')]
    for item in datisweekly:
        item.update( {"type":"Datisweekly"})
    
    dscndaily=[entry for entry in models.Dscndaily.objects.filter(emp_id=id).values().order_by('-date')]
    for item in dscndaily:
        item.update( {"type":"Dscndaily"})
    
    dscnmonthly=[entry for entry in models.Dscnmonthly.objects.filter(emp_id=id).values().order_by('-date')]
    for item in dscnmonthly:
        item.update( {"type":"Dscnmonthly"})
       
    com=datisdaily+[i for i in datisweekly]+[i for i in dscndaily]+[i for i in dscnmonthly]
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
            remarks = "---Report not submitted---"
            statusvd = "COMPLETED"
            val = ((date.today()-timedelta(days=1)),currtime,id,'1',status,'1',remarks)
            sql = "INSERT INTO vhfdaily (date,time,emp_id,a_id,status,f_id,remarks) values (%s,%s,%s ,%s,%s, %s,%s)"
            cursor.execute(sql,val)  
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
    #vhfmsub_on = cursor.execute("select date from vhfmonthly where date = %s",[temp])    
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
    #vhfysub_on = cursor.execute("select date from vhfyearly where date = %s",[temp])    
    vhfysub_on = temp
    if currdate > wdate :
        vhfysub_deadline =  currdate 
    else :
        vhfysub_deadline =  wdate
        vyr = 1'''
    #return render(request,'./engineer/home.html',{'status':status,'dscnmsub_deadline':dscnmsub_deadline,'dscnmsub_on':dscnmsub_on,'dsmr':dsmr,'dswr':dswr,'dscnwsub_on':dscnwsub_on,'dscnwsub_deadline':dscnwsub_deadline,'dscnd_deadline':dscnd_deadline,'dscndsub_on':dscndsub_on,'dsdr':dsdr,'ddr':ddr,'dwr':dwr,'vdr':vdr,'vmr':vmr,'vyr':vyr,'currdate':currdate,'name':name1,'id':id,'empdet':empdetails,'datisdsub_on':datisdsub_on,'datisd_deadline':datisd_deadline,'datiswsub_on':datiswsub_on,'datiswsub_deadline':datiswsub_deadline,'vhfdsub_on':vhfdsub_on,'vhfd_deadline':vhfd_deadline,'vhfmsub_on':vhfmsub_on,'vhfmsub_deadline':vhfmsub_deadline,'vhfysub_on':vhfysub_on,'vhfysub_deadline':vhfysub_deadline})
    return render(request,'./engineer/home.html',{'dscnd_deadline':dscnd_deadline,'dscndsub_on':dscndsub_on,'dsdr':dsdr,'statusdsd':statusdsd,'wdatedm':wdatedm,'statusdm':statusdm,'dscnmsub_on':dscnmsub_on,'dscnmsub_deadline':dscnmsub_deadline,'dsmr':dsmr,'com':com,'wdate':wdate,'supdetails':supdetails,'statusd':statusd,'status':status,'ddr':ddr,'dwr':dwr,'currdate':currdate,'name':name1,'id':id,'empdet':empdetails,'datisdsub_on':datisdsub_on,'datisd_deadline':datisd_deadline,'datiswsub_on':datiswsub_on,'datiswsub_deadline':datiswsub_deadline})


def dhomeviewn(request,id) :
    request.session['uid']= id
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
    cdr =0           
    supdetails = models.Supervisor.objects.all()
    supdetails = supdetails.values('name','contact','email').filter(dept='N')
    statusd = "" # same
        #!!!!!!!!!!!!!!!!!cdvor daily!!!!!!!!!!!!!!!!!!!!!!!!
    uia = None# same
    currdate = date.today()
    currtime = datetime.now().strftime("%H:%M:%S")
    cdvordsub_on = cursor.execute("select date from cdvordaily where date = %s",[date.today()])    
    if cdvordsub_on :
        statusd = models.Cdvordaily.objects.all()
        statusd = statusd.values('date','status')
        statusd = statusd.order_by('-date')
        statusd = statusd.values('status')
        statusd = statusd.values('status').filter(a_id=1)[0]['status']
        if statusd == "PENDING" :
            cdvordsub_on = currdate
            cdvord_deadline = currdate #cdvor
            cdr=0 #cdr   
        elif statusd == "COMPLETED" :
            cdvord_deadline = currdate + timedelta(days=1)
            cdvordsub_on = currdate
            cdr = 1 
        elif statusd == "COMPLETED WITH ERRORS" :
            cdvord_deadline = currdate + timedelta(days=1)
            cdvordsub_on = currdate
            cdr = 1
    else :
        cdvord_deadline = models.Cdvordaily.objects.all()
        cdvord_deadline = cdvord_deadline.values('date')
        cdvord_deadline = cdvord_deadline.order_by('-date')
        cdvord_deadline = cdvord_deadline.values('date').filter(a_id=1)[0]['date']
        cdvordsub_on = cdvord_deadline
        cdvord_deadline = cdvord_deadline + timedelta(days=2)
        tempdate = cdvordsub_on + timedelta(days=1)
        i = 1 
        while i == 1 and tempdate != date.today() : 
         if (cdvord_deadline <= date.today()) :    
            remarks = "---Report not submitted---"
            statusd = "PENDING"
            val = (tempdate,currtime,'1',id,statusd,'2',remarks)
            sql = "INSERT INTO cdvordaily (date,time,a_id,emp_id,status,f_id,remarks) values (%s ,%s,%s,%s,%s, %s,%s)"
            cursor.execute(sql,val)  
            cdvordsub_on = date.today()-timedelta(days=1)    
            tempdate = tempdate + timedelta(days=1)
         else : 
            break
        cdvord_deadline = date.today()
          
    #!!!!!!!!!!!!!!!!!!!!!!!cdvor weekly!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    p_id = models.Cdvorweekly.objects.all()
    p_id = p_id.values('p_id')
    p_id = p_id.order_by('-p_id')
    p_id = p_id.values('p_id').filter(a_id=1)[0]['p_id']
    currdate = date.today()
    wdate = models.Cdvorweekly.objects.all()
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
    cwr = 0
    cdvorwsub_on = temp
    cdvorwsub_deadline =  wdate 
    status = ""  # status
    status = models.Cdvorweekly.objects.all()
    status = status.values('date','status','unit_incharge_approval')
    status = status.order_by('-date')
    uia = status
    uia = uia.values('unit_incharge_approval')
    uia = uia.values('unit_incharge_approval').filter(a_id=1)[0]['unit_incharge_approval']
    status = status.values('status')
    status = status.values('status').filter(a_id=1)[0]['status']
    flag = cursor.execute("select date from cdvorweekly where date = %s",[date.today()])    
    if currdate > wdate and flag == 0 :  #if it goes beyond 7 days
        pending = wdate 
        while pending <= (currdate - timedelta(days=1)) :
            f = cursor.execute("select date from cdvorwlogs where date = %s",[pending])    
            if f == 0 : 
                remarks = "Report not submitted"
                value = "No Entry" 
                val = (id,p_id,remarks,value,pending,currtime)
                sql = "INSERT INTO cdvorwlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s ,%s, %s,%s)"
                cursor.execute(sql,val)
            pending = pending + timedelta(days=1)    
        cwr = 0
         
    if flag :    
        if  temp1 < temp : #report submitted after deadline
            cdvorwsub_deadline = temp1    
            if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                cwr=1  
            elif status == "PENDING" :
                cwr=0
            
        elif temp == temp1 and temp == currdate : # report submitted on a day same as deadline
            cdvorwsub_deadline = temp    
            if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                cwr=1  
            elif status == "PENDING" :
                cwr=0
            
        elif temp1 < wdate and temp1 > temp : #report submitted before the deadline 
            cdvorwsub_deadline = temp1   
            if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                cwr=1  
            elif status == "PENDING" :
                cwr=0



    #!!!!!!!!!!!!!!!!!!!!!!!!!!!cdvor monthly!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    p_id = models.Cdvormonthly.objects.all()
    p_id = p_id.values('p_id')
    p_id = p_id.order_by('-p_id')
    p_id = p_id.values('p_id').filter(a_id=1)[0]['p_id']
    currdate = date.today()
    wdatem = models.Cdvormonthly.objects.all()
    wdatem = wdatem.values('date')
    wdatem = wdatem.order_by('-date')
    wdate1 = wdatem
    wdatem = wdatem.values('date').filter(a_id=1)[0]['date']
    wdate1 = wdate1.values('date').filter(a_id=1)[1]['date']
    wdatem = str(wdatem)
    wdatem = datetime.strptime(wdatem, "%Y-%m-%d").date()
    temp = wdatem
    temp1 = wdate1 + timedelta(days=30)
    wdatem = wdatem + timedelta(days=30) 
    cmr = 0
    cdvormsub_on = temp
    cdvormsub_deadline =  wdatem 
    statusm = ""  # status
    statusm = models.Cdvormonthly.objects.all()
    statusm = statusm.values('date','status','unit_incharge_approval')
    statusm = statusm.order_by('-date')
    uia = statusm
    uia = uia.values('unit_incharge_approval')
    uia = uia.values('unit_incharge_approval').filter(a_id=1)[0]['unit_incharge_approval']
    statusm = statusm.values('status')
    statusm = statusm.values('status').filter(a_id=1)[0]['status']
    flag = cursor.execute("select date from cdvormonthly where date = %s",[date.today()])    
    if currdate > wdatem and flag == 0 :  #if it goes beyond 30 days
        pending = wdatem 
        while pending <= (currdate - timedelta(days=1)) :
            f = cursor.execute("select date from cdvormlogs where date = %s",[pending])    
            if f == 0 : 
                remarks = "Report not submitted"
                value = "No Entry" 
                val = (id,p_id,remarks,value,pending,currtime)
                sql = "INSERT INTO cdvormlogs (emp_id,p_id,remarks,value,date,time) values (%s ,%s,%s ,%s, %s,%s)"
                cursor.execute(sql,val)
            pending = pending + timedelta(days=1)    
        cmr = 0
         
    if flag :    
        if  temp1 < temp : #report submitted after deadline
            cdvormsub_deadline = temp1    
            if statusm == "COMPLETED" or statusm == "COMPLETED WITH ERRORS" :
                cmr=1  
            elif statusm == "PENDING" :
                cmr=0
            
        elif temp == temp1 and temp == currdate : # report submitted on a day same as deadline
            cdvormsub_deadline = temp    
            if statusm == "COMPLETED" or statusm == "COMPLETED WITH ERRORS" :
                cmr=1  
            elif statusm == "PENDING" :
                cmr=0
            
        elif temp1 < wdate and temp1 > temp : #report submitted before the deadline 
            cdvormsub_deadline = temp1   
            if statusm == "COMPLETED" or statusm == "COMPLETED WITH ERRORS" :
                cmr=1  
            elif statusm == "PENDING" :
                cmr=0
    

    cdvordaily=[entry for entry in models.Cdvordaily.objects.filter(emp_id=id).values().order_by('-date')]
    for item in cdvordaily:
        item.update( {"type":"Cdvordaily"})
                
    cdvorweekly=[entry for entry in models.Cdvorweekly.objects.filter(emp_id=id).values().order_by('-date')]
    for item in cdvorweekly:
        item.update( {"type":"Cdvorweekly"})

    cdvormonthly=[entry for entry in models.Cdvormonthly.objects.filter(emp_id=id).values().order_by('-date')]
    for item in cdvormonthly:
        item.update( {"type":"Cdvormonthly"})

    com=cdvordaily+[i for i in cdvorweekly] + [i for i in cdvormonthly]
    com=sorted(com,key=itemgetter('date'),reverse=True)
    for i in com:
        i.update({'token':i['p_id']})
    return render(request,'./engineer/homen.html',{'com':com,'wdate':wdate,'supdetails':supdetails,'statusd':statusd,'status':status,'cdr':cdr,'cwr':cwr,'currdate':currdate,'name':name1,'id':id,'empdet':empdetails,'cdvordsub_on':cdvordsub_on,'cdvord_deadline':cdvord_deadline,'cdvorwsub_on':cdvorwsub_on,'cdvorwsub_deadline':cdvorwsub_deadline,'statusm':statusm,'cmr':cmr,'wdatem':wdatem,'cdvormsub_on':cdvormsub_on,'cdvormsub_deadline':cdvormsub_deadline})
    
