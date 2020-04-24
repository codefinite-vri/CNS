from django.shortcuts import render

from datetime import date,datetime,timedelta
from django.db import connection
from cryptography.fernet import Fernet as frt
from supervisor.views import main
from operator import itemgetter

# Create your views here.

from django.http import HttpResponse
from .. import models
from django.db import connection
def logEng(request,id):
        
        uid = id
        s0 = models.Engineer.objects.all()
        s0 = s0.values('a_id')
        s0 = s0.filter(emp_id=id)
        cursor = connection.cursor() 

        _q = models.Airport.objects
        _q = _q.filter(a_id__in=s0)
        name1 = _q.all()
                    
        q = models.Engineer.objects
                    
        q = q.values('name','designation','a_id')
        q = q.filter(emp_id=id)
                    
        empdetails = q.all()
        supdetails = models.Supervisor.objects.all()
        supdetails = supdetails.values('name','contact','email').filter(dept='C')
        statusd = "" 
        datisd_deadline= ""
        #!!!!!!!!!!!!!!!!!datis daily!!!!!!!!!!!!!!!!!!!!!!!!
        ddr = 0
        currdate = date.today()
        currtime = datetime.now().strftime("%H:%M:%S")            
        datisdsub_on = cursor.execute("select date from datisdaily where date = %s",[date.today()])    
        if datisdsub_on :
            statusd = models.Datisdaily.objects.all()
            statusd = statusd.values('date','status','unit_incharge_approval')
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
                #remarks = "---Report not submitted---"
                #statusd = "COMPLETED"
                #val = (tempdate,currtime,'1',id,statusd,'2',remarks)
                #sql = "INSERT INTO datisdaily (date,time,a_id,emp_id,status,f_id,remarks) values (%s ,%s,%s,%s,%s, %s,%s)"
                #cursor.execute(sql,val)  
                #datisdsub_on = date.today()-timedelta(days=1)    
                tempdate = tempdate + timedelta(days=1)
              else : 
                break
            datisd_deadline = date.today()
    
                
        print(ddr)
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
        
        if flag :    
            if  temp1 < temp : #report submitted after deadline
                datiswsub_deadline = temp1    
                if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                    dwr=1  
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

            #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Dscn Daily!!!!!!!!!!!!!!!!!!!!!!!!               
        dsdr = 0 
        statusdsd = ""
        uia = None
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
            elif statusd == "COMPLETED" :
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
        
        datisdaily=[entry for entry in models.Datisdaily.objects.filter(emp_id=id).values().order_by('-date')]
        for item in datisdaily:
            item.update( {"type":"Datisdaily"})
                    
        datisweekly=[entry for entry in models.Datisweekly.objects.filter(emp_id=id).values().order_by('-date')]
        for item in datisweekly:
            item.update( {"type":"Datisweekly"})
        
        dscndaily=[entry for entry in models.Dscndaily.objects.filter(emp_id=id).values().order_by('-date')]
        for item in dscndaily:
            item.update( {"type":"Dscndaily"})
        
        
        com=datisdaily+[i for i in datisweekly]+[i for i in dscndaily]
        com=sorted(com,key=itemgetter('date'),reverse=True)
        for i in com:
            i.update({'token':i['p_id']})
    
            # return render(request,'./engineer/F.html',{'status':status,'dscnmsub_deadline':dscnmsub_deadline,'dscnmsub_on':dscnmsub_on,'dsmr':dsmr,'dswr':dswr,'dscnwsub_on':dscnwsub_on,'dscnwsub_deadline':dscnwsub_deadline,'dscnd_deadline':dscnd_deadline,'dscndsub_on':dscndsub_on,'dsdr':dsdr,'ddr':ddr,'dwr':dwr,'vdr':vdr,'vmr':vmr,'vyr':vyr,'currdate':currdate,'name':name1,'id':id,'empdet':empdetails,'datisdsub_on':datisdsub_on,'datisd_deadline':datisd_deadline,'datiswsub_on':datiswsub_on,'datiswsub_deadline':datiswsub_deadline,'vhfdsub_on':vhfdsub_on,'vhfd_deadline':vhfd_deadline,'vhfmsub_on':vhfmsub_on,'vhfmsub_deadline':vhfmsub_deadline,'vhfysub_on':vhfysub_on,'vhfysub_deadline':vhfysub_deadline})'''
        return render(request,'./engineer/home.html',{'dsdr':dsdr,'dscndsub_on':dscndsub_on,'dscnd_deadline':dscnd_deadline,'statusdsd':statusdsd,'com':com,'wdate':wdate,'supdetails':supdetails,'statusd':statusd,'status':status,'ddr':ddr,'dwr':dwr,'currdate':currdate,'name':name1,'id':id,'empdet':empdetails,'datisdsub_on':datisdsub_on,'datisd_deadline':datisd_deadline,'datiswsub_on':datiswsub_on,'datiswsub_deadline':datiswsub_deadline})

def logEngN(request, id):
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
    supdetails = supdetails.values('name','contact','email').filter(dept='N')
    
    cdr =0            
    statusd = ""
    cdvord_deadline = ""
        #!!!!!!!!!!!!!!!!!cdvor daily!!!!!!!!!!!!!!!!!!!!!!!!
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
            cdvord_deadline = currdate
            cdr=0
        elif statusd == "COMPLETED" :
            cdvord_deadline = currdate + timedelta(days=1)
            cdvordsub_on = currdate
            cdr =1 
        elif statusd == "COMPLETED WITH ERRORS" :
            cdvord_deadline = date.today() + timedelta(days=1)
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
            #remarks = "---Report not submitted---"
            #statusd = "COMPLETED"
            #val = (tempdate,currtime,'1',id,statusd,'2',remarks)
            #sql = "INSERT INTO datisdaily (date,time,a_id,emp_id,status,f_id,remarks) values (%s ,%s,%s,%s,%s, %s,%s)"
            #cursor.execute(sql,val)  
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
    status = ""
    status = models.Cdvorweekly.objects.all()
    status = status.values('date','status','unit_incharge_approval')
    status = status.order_by('-date')
    uia = status
    uia = uia.values('unit_incharge_approval')
    uia = uia.values('unit_incharge_approval').filter(a_id=1)[0]['unit_incharge_approval']
    status = status.values('status')
    status = status.values('status').filter(a_id=1)[0]['status']
    flag = cursor.execute("select date from cdvorweekly where date = %s",[date.today()])    
        
    if currdate > wdate :  #if it goes beyond 7 days
        cwr = 0
    print(flag)     
    if flag :    
        if  temp1 < temp : #report submitted after deadline
            cdvorwsub_deadline = temp1    
            if status == "COMPLETED" or status == "COMPLETED WITH ERRORS" :
                cwr=1
                print(temp1)  
            elif status == "PENDING" :
                cwr=0
            
        elif temp == temp1 and temp == currdate : # report submitted on same day as deadline
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
        print(cwr)   
    print(cdvorwsub_on) 
    cdvordaily=[entry for entry in models.Cdvordaily.objects.filter(emp_id=id).values().order_by('-date')]
    for item in cdvordaily:
        item.update( {"type":"Cdvordaily"})
                
    cdvorweekly=[entry for entry in models.Cdvorweekly.objects.filter(emp_id=id).values().order_by('-date')]
    for item in cdvorweekly:
        item.update( {"type":"Cdvorweekly"})
    com=cdvordaily+[i for i in cdvorweekly]
    com=sorted(com,key=itemgetter('date'),reverse=True)
    for i in com:
        i.update({'token':i['p_id']})
    return render(request,'./engineer/homen.html',{'com':com,'wdate':wdate,'supdetails':supdetails,'statusd':statusd,'status':status,'cdr':cdr,'cwr':cwr,'currdate':currdate,'name':name1,'id':id,'empdet':empdetails,'cdvordsub_on':cdvordsub_on,'cdvord_deadline':cdvord_deadline,'cdvorwsub_on':cdvorwsub_on,'cdvorwsub_deadline':cdvorwsub_deadline})