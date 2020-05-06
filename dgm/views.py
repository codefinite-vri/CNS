from django.shortcuts import render
import collections
from datetime import date,datetime,timedelta
from django.db import connection
from cryptography.fernet import Fernet as frt
from supervisor.views import main
from operator import itemgetter
from django.db.models import Q
from itertools import groupby
# Create your views here.
from django.core.exceptions import ObjectDoesNotExist
from django.http import HttpResponse
from login import models
from django.db import connection

def homev(request,uid):
    labels = []
    data = []
    
    request.session['type']='d'
    request.session['uid']=uid
    emp_id = models.Dgm.objects.all().filter(a_id=1).values('dgm_id')[0]['dgm_id']
    # comlist = models.DgmReports.objects.filter(Q(r_id=1) | Q(r_id=2) | Q(r_id=3) | Q(r_id=4) | Q(r_id=5) | Q(r_id=6) | Q(r_id=15) |Q(r_id=16) | Q(r_id=17) | Q(r_id=30) |Q(r_id=31) |Q(r_id=32))
    
    # for datisd in comlist:
    #     com_labels.append(datisd.r_status)
    #     com_data.append(datisd.r_count)


    Cdvordaily=[entry for entry in models.Cdvordaily.objects.values().order_by('-date')]
    for item in Cdvordaily:
            item.update( {"type":"Cdvordaily"})
    Cdvorweekly=[entry for entry in models.Cdvorweekly.objects.values().order_by('-date')]
    for item in Cdvorweekly:
            item.update( {"type":"Cdvorweekly"})
    
    
    
    Cdvormonthly=[entry for entry in models.Cdvormonthly.objects.values().order_by('-date')]
    for item in Cdvormonthly:
            item.update( {"type":"Cdvormonthly"})        
    
    
    com=Cdvordaily+[i for i in Cdvorweekly]+[i for i in Cdvormonthly]
    com=sorted(com,key=itemgetter('date'))
    pending=[]
    completed=[]
    error=[]
    for i in com:
        if i['status'] == 'PENDING':
            pending.append(i)
        elif i['status'] == 'COMPLETED':    
            completed.append(i)
        elif i['status'] == 'COMPLETED WITH ERRORS':
            error.append(i)

    pcount=collections.Counter([d['date'] for d in pending])
    pend=compute(request,pcount)
    ccount=collections.Counter([d['date'] for d in completed])
    comp=compute(request,ccount)
    ecount=collections.Counter([d['date'] for d in error])
    err=compute(request,ecount)


   

    

    # surlist = models.DgmReports.objects.filter(Q(r_id=10) | Q(r_id=11) | Q(r_id=14) | Q(r_id=21) | Q(r_id=22) | Q(r_id=23) | Q(r_id=27) |Q(r_id=28) | Q(r_id=) | Q(r_id=30) |Q(r_id=31) |Q(r_id=32))
    
    # for datisd in comlist:
    #     com_labels.append(datisd.r_status)
    #     com_data.append(datisd.r_count)
    
    print(pend[0][0])
    
    return render(request, 'dgm/dgm.html', {
        'p_labels':pend[0][2],
        'p_data': pend[1][2],
        'c_labels':comp[0][2],
        'c_data': comp[1][2],
        'e_labels':err[0][2],
        'e_data': err[1][2],
        'id':uid,
        # 'nav_labels':nav_labels,
        # 'nav_data': nav_data,
     })

def compute(request,count):
    i=datetime.strptime('2020413', '%Y%m%d')
    # print(str(i.date()))
    j=0
    obj=[]
    temp_label=[]
    temp_obj=[]
    label=[]
    temp_status=[]
    status=[]
    c=1
    today=datetime.now()
    threshold=today-timedelta(days=8)
    today=today.strftime('%Y-%m-%d')
    # today=datetime.strptime('2020505', '%Y%m%d')
    # print(today)
    # if str(i.date()) == str(today):
    #     print("yes")
    # else:
    #     print("no")

    # print(i)
    # print(type(i.date()))
    # print(today)
    # print(str(i.date()))
    flag=0
    days=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    # print(type(i.date()))
    # print(type(threshold.date()))
    # p=i.date()<threshold.date()
    # print(p)
    while str(i.date()) != today:
        
        
            temp_obj.append(count[i.date()])
            if count[i] == None:
                temp_obj.append(0)
            temp_label.append(days[i.date().weekday()])
            
            # print(label[j],"   ",obj[j])
 
            c=c+1
            i=i+timedelta(days=1)
            
            if c % 8 == 0 and i.date() <= threshold.date():
                obj.append(temp_obj)
                label.append(temp_label)
                # status.append(temp_status)
                temp_obj=[]
                temp_label=[]
                # temp_status=[]
                c=1
                
                continue
            
            elif i.date() > threshold.date() and temp_label != None:
                # print("here")
                flag=1
                if c % 8 == 0 :
                    obj.append(temp_obj)
                    label.append(temp_label)
                    # status.append(temp_status)
                    temp_obj=[]
                    temp_label=[]
                    # temp_status=[]
                    c=1
                continue
    if flag==1:
        # print("here23")
        obj.append(temp_obj)
        label.append(temp_label)
        # status.append(temp_status)
        temp_obj=[]
        temp_label=[]
                
                # temp_status=[]
                
       
    print('labels:',label)
    print('data:',obj)
    # print('status:',status)    
    return [label,obj]

def dgmhome(request,id):
	today = datetime.now().strftime('%d/%m/%Y')
    #request.session['type']='d'
    #request.session['uid']=uid
	return render(request,'./dgm/dgm.html')



def navigation(request):

    a_id=models.Dgm.objects.all().filter(a_id=1).values('a_id')[0]['a_id']
    cdvordaily=[entry for entry in models.Cdvordaily.objects.filter(a_id=a_id).values().order_by('-date')]
    for i in cdvordaily:
        i.update({'type':'Cdvordaily'})
    cdvorweekly=[entry for entry in models.Cdvorweekly.objects.filter(a_id=a_id).values().order_by('-date')]
    for i in cdvorweekly:
        i.update({'type':'Cdvorweekly'})
    cdvormonthly=[entry for entry in models.Cdvormonthly.objects.filter(a_id=a_id).values().order_by('-date')]
    for i in cdvormonthly:
        i.update({'type':'Cdvormonthly'})
    
    com=cdvordaily+[i for i in cdvorweekly]+[i for i in cdvormonthly]

    com=sorted(com,key=itemgetter('date'),reverse=True)
    p_count=0
    comp_count=0
    compwe_count=0
    # print(type(com))
    # eng=[entry for entry in models.Engineer.objects.filter(dgm_id=uid).values()]
    for i in com:
        if i['status']=='com':
            p_count=p_count+1
        elif i['status']=='COMPLETED':
            comp_count=comp_count+1
        elif i['status']=='COMPLETED WITH ERRORS':
            compwe_count=compwe_count+1
    print(p_count)
    print(comp_count)
    print(compwe_count)
    for i in com:
            # i.update({'type':'communication'})
            i.update({'token':encode(request,str(i['p_id']))})
    return render(request,'dgm/list_details.html',{'context':com,'name':'Navigation'})


def details(request,id,name):
    id=decode(request,id)
    if request.session.get('type')=='d':
            
        # print(name)
        
        str1='temp=models.'
        str2='.objects.filter(p_id='
        str3=').values()'
        str4='.objects.all('
        que=str1+name+str2+str(id)+str3
        exec(que,globals())
        str1='mrec=models.'
        que=str1+name+str4+str3+".order_by('-date')"
        exec(que,globals())
        #  UNCOMMENT WHEN DONE WITH ALL LOG TABLES
        logname=name+'logs'
        logname=logname.replace('daily','d')
        logname=logname.replace('monthly','m')
        logname=logname.replace('weekly','w')
        logname=logname.replace('yearly','y')
        print(logname)
        name=name[0].lower()+name[1:]
        # # logname=name+'logs'
        str1='logs=models.'
        str2='.objects.filter(p_id='
        str3=').values()'
        request.session['pid']=id
        request.session['name']=name
        que=str1+logname+str2+str(id)+str3+".order_by('-log_id')"
        exec(que,globals())
        # print("logs:")
        # print(logs)
        i=temp[0]
        i['e_token']=encode(request,str(i['emp_id']))
        i['p_token']=encode(request,str(i['p_id']))
        eng=models.Engineer.objects.filter(emp_id=temp[0]['emp_id']).values()
        # print(i)
        # redir='dgm:'+name
        if name =='datisdaily':
            redir='dgm:'+"communication"
            return render(request,'dgm/imp_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})
        
        elif name == 'datisweekly':
            redir='dgm:'+"communication"
            return render(request,'dgm/impw_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})    
        
        elif name == 'dscndaily':
            redir='dgm:'+"communication"
            return render(request,'dgm/dscn_imp_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})    
        elif name == 'dscnmonthly':
            redir='dgm:'+"communication"
            return render(request,'dgm/dscn_impm_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})    
        
        elif name == 'cdvordaily':
            redir='dgm:'+"navigation"
            return render(request,'dgm/cdvor_imp_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})    
        elif name == 'cdvormonthly':
            redir='dgm:'+"navigation"
            return render(request,'dgm/cdvor_impm_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})        
        
        # return render(request,'dgm/imp_details.html',{'temp':i,'names':name})
        elif name == 'cdvorweekly':
            redir='dgm:'+"navigation"
            return render(request,'dgm/cdvor_impw_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})    
        elif name == 'scctvdaily':
            redir='dgm:'+"surveillance"
            return render(request,'dgm/scctv_imp_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})    
        elif name == 'scctvmonthly':
            redir='dgm:'+"surveillance"
            return render(request,'dgm/scctv_impm_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec})        
        
        # return render(request,'dgm/imp_details.html',{'temp':i,'names':name})
        elif name == 'scctvweekly':
            redir='dgm:'+"surveillance"
            return render(request,'dgm/scctv_impw_details.html',{'eng':eng[0],'temp':i,'names':name,'redir':redir,'logs':logs,'mrec':mrec}) 

def encode(request,s):

    f=frt(request.session['key'].encode('utf-8'))
    token = f.encrypt(s.encode('utf-8'))
    # print(token.decode('utf-8'))
    return token.decode('utf-8')

def decode(request,s):
    f=frt(request.session['key'].encode('utf-8'))
    token = f.decrypt(s.encode('utf-8'))
    # print(token.decode('utf-8'))
    return token.decode('utf-8')
