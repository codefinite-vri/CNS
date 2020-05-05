from django.shortcuts import render
from django.shortcuts import HttpResponse
from login.models import Airport,Employee,Dgm,Supervisor,Head,Engineer
from .models import Mcdo
import datetime
from .models import McdoLogs

from django.shortcuts import redirect

from login.eng.homeviewEng import dhomeview as dhomeview
from login.eng.homeviewEng import dhomeviewn as dhomeviewn
from login.eng.homeviewEng import dhomeviews as dhomeviews

from login.sup.homeviewSup import run_sup as run_sup

from head.views import dispMap as dispMap
from login.dgm.homeviewDgm import pie_chart as pie_chart

# Create your views here.
def home(request):
    if 'uid' in request.session:
        is_active = request.session['uid']
        emp = Employee.objects.get(emp_id = is_active)
        try:
            mcdo = Mcdo.objects.get(emp__emp_id = is_active, doa = None)
            mcdo = True  
        except Mcdo.DoesNotExist:
            mcdo = False

        pending_approvals = Mcdo.objects.filter(doa = None, approval_from = is_active).count()

        return render(request, 'mcdo/home.html',{'employee':emp,'is_active':is_active,'is_executive': str(is_active)[0] != '4', 'mcdo':mcdo, 'pending_approvals':pending_approvals })
    else:
        return redirect('/')

def disp(request):
    if 'uid' in request.session:
        entries = Mcdo.objects.all().order_by('-doa')
        print(entries)
        return render(request, 'mcdo/entries.html',{'entry_names': entries})
    else:
        return redirect('/')   
 
from django.db.models import Q

def search(request, **kwargs):
    if 'search' in request.GET: 
        search_term = request.GET['search']
        q_object  = Q(topic__icontains = search_term) | Q(emp__name__icontains = search_term) | Q(a__name__icontains = search_term) | Q(content__icontains = search_term)
        entries = Mcdo.objects.filter(q_object).order_by('-doa')
        return render(request, 'mcdo/entries.html',{'entry_names':entries})
    else:
        return HttpResponse('Click on Search instead')

def enter(request , r_en=None):
    if 'uid' in request.session:
        try:
            emp = Employee.objects.get(emp_id = request.session['uid'])
            try:
                mcdo = Mcdo.objects.get(emp = emp, doa = None)
                if(mcdo and r_en):
                    return render(request, 'mcdo/enter.html',{'edit_entry':r_en,'mcdo':mcdo})
                elif(mcdo):
                    return HttpResponse('Last entry has not been approved yet...')
            except Mcdo.DoesNotExist:
                if r_en:
                    return HttpResponse('Last entry has been approved, cannot re-enter after approval')
                else:
                    return render(request, 'mcdo/enter.html',{'edit_entry':0})      
        except Employee.DoesNotExist:
            emp = None
            return redirect('/')   
    else:
        return redirect('/')    

def enter_verify(request , r_en = None):
    if ('topic' in request.POST) and ('content' in request.POST) and ('uid' in request.session):
        emp_id = request.session['uid']
        try:
            emp = Employee.objects.get(emp_id = emp_id)
        except Employee.DoesNotExist:
            emp = None

        topic = request.POST['topic']
        content = request.POST['content']

        pending_approvals = Mcdo.objects.filter(doa = None, approval_from = emp_id).count()        

        if r_en:
            try:
                mcdo = Mcdo.objects.get(emp = emp, doa = None)
                mcdo.topic = topic
                mcdo.content = content
                mcdo.dop = datetime.datetime.today()
                mcdo.save()
            except Mcdo.DoesNotExist:
                mcdo = None    
            return render(request,'mcdo/home.html',{'employee':emp, 'is_active':emp_id, 'mcdo':True, 'is_executive': str(emp_id)[0] != '4','pending_approvals':pending_approvals})    
        else:
            emp_id = str(emp_id)

            if emp_id[0] == '4':
                try:
                    er = Engineer.objects.get(emp_id = int(emp_id))
                    super_id = er.supervisor.supervisor_id
                    mcdo = Mcdo(emp = emp, a = emp.a, topic = topic, content = content, dop = datetime.datetime.today(), approval_from = super_id)
                    mcdo.save()
                
                except Engineer.DoesNotExist:
                    er = None
                    return HttpResponse('Engineer in Employee Do not match')
            
            elif emp_id[0] == '3':
                try:
                    spvsr = Supervisor.objects.get(supervisor_id = int(emp_id))
                    dgm_id = spvsr.dgm.dgm_id
                    mcdo = Mcdo(emp = emp, a = emp.a, topic = topic, content = content, dop = datetime.datetime.today(), approval_from = dgm_id)
                    mcdo.save()

                except Supervisor.DoesNotExist:
                    spvsr = None
                    return HttpResponse('Supervisor in Employee Do not match')

            elif emp_id[0] == '2':
                try:
                    dgm = Dgm.objects.get(dgm_id = int(emp_id))
                    head_id = dgm.head.head_id
                    mcdo = Mcdo(emp = emp, a = emp.a, topic = topic, content = content, dop = datetime.datetime.today(), approval_from = head_id)
                    mcdo.save()

                except Dgm.DoesNotExist:
                    dgm = None
                    return HttpResponse('Dgm in Employee Do not match')            


            return render(request,'mcdo/home.html',{'employee':emp, 'is_active':emp_id ,'mcdo':True, 'is_executive': str(emp_id)[0] != '4','pending_approvals':pending_approvals })
    else:
        return redirect('/')

def approval(request):
    if 'uid' in request.session:    
        entries = Mcdo.objects.filter(approval_from = request.session['uid'], doa = None)
        if(entries):
            return render(request, 'mcdo/approve.html', { 'pending':1 , 'entries':entries })
        else:
            return render(request, 'mcdo/approve.html', { 'pending':0 })    
    else:
        return redirect('/')

def approve_action(request , r_en:None, emp_id = None):
    if 'uid' in request.session:
        if (r_en == 1 and emp_id):   # Editing for approval
            try:
                mcdo = Mcdo.objects.get(emp__emp_id = emp_id, doa = None, approval_from = request.session['uid'])
                request.session['approval-for'] = emp_id
                return render(request, 'mcdo/approval-edit.html', {'edit_entry':r_en,'mcdo':mcdo})
            except Mcdo.DoesNotExist:
                return HttpResponse('Employee_id Not supplied or any other action must have been taken earlier.')
        elif(emp_id):
            try:
                mcdo = Mcdo.objects.get(emp__emp_id = emp_id, doa = None, approval_from = request.session['uid'])
                if(r_en == 2):
                    mcdo.delete()
                try:
                    approval_by = Employee.objects.get(emp_id = request.session['uid'])
                    if(r_en == 3):
                        mcdo.doa = datetime.datetime.today()
                        mcdo.approved_by = approval_by
                        mcdo.save()
                except Employee.DoesNotExist:
                    return HttpResponse('You dont exist in Employee table')
                
                # mcdo = To find if any existing submitted entry is present which can re-edited if it hasn't be approved yet.
                try:
                    mcdo = Mcdo.objects.get(emp__emp_id = request.session['uid'], doa = None)
                    mcdo = True  
                except Mcdo.DoesNotExist:
                    mcdo = False

                # pending_approvals = To find out how many entries are pending to be approved from the user. 
                pending_approvals = Mcdo.objects.filter(doa = None, approval_from = request.session['uid']).count()
            

                return render(request, 'mcdo/home.html',{'is_active':request.session['uid'], 'employee':approval_by, 'mcdo':mcdo, 'pending_approvals':pending_approvals, 'is_executive': str(request.session['uid'])[0] != '4' })    
            except Mcdo.DoesNotExist:
                return HttpResponse('Employee_id Not supplied or any other action must have been taken earlier')                  
        else:
            return redirect('/')     
    else:
        return redirect('/')   

def entry_verify(request):
    if ('uid' in request.session) and ('topic' in request.POST) and ('content' in request.POST):
        if(request.session['approval-for']):
            try:
                mcdo = Mcdo.objects.get(emp__emp_id = request.session['approval-for'] , doa = None , approval_from = request.session['uid'])
                topic = request.POST['topic']
                content = request.POST['content']
                mcdo.topic = topic
                mcdo.content = content
                mcdo.save()
                try:
                    approval_by = Employee.objects.get(emp_id = request.session['uid'])
                except Employee.DoesNotExist:
                    return HttpResponse('You dont exist in the employee table')

                try:
                    del request.session['approval_for']
                except KeyError:
                    pass

                try:
                    mcdo = Mcdo.objects.get(emp__emp_id = request.session['uid'], doa = None)
                    mcdo = True  
                except Mcdo.DoesNotExist:
                    mcdo = False

                pending_approvals = Mcdo.objects.filter(doa = None, approval_from = request.session['uid']).count()

                return render(request, 'mcdo/home.html',{'is_active':request.session['uid'], 'employee':approval_by, 'is_executive':str(request.session['uid'])[0] != '4', 'mcdo':mcdo, 'pending_approvals':pending_approvals }) 
            except Mcdo.DoesNotExist:
                return HttpResponse(' Looks like it has been already approved,or emp_id, approval_from is Wrong')
        else:
            return HttpResponse('Entry verification failed since the modified entry cannot be matched to a particular employee, since employee details are not set.')
    else:
        return redirect('/')

def takemehome(request):
    if 'uid' in request.session:
        if str(request.session['uid'])[0] == '4':
            try:
                emp = Engineer.objects.get(emp_id = request.session['uid'])
                request.session['type'] = 'e'       #not necessary though, since it will be set inside /validate/
                if emp.dept == 'C':
                    return dhomeview(request, request.session['uid'])
                elif emp.dept == 'N':
                    return dhomeviewn(request, request.session['uid'])
                elif emp.dept == 'S':
                    return dhomeviews(request, request.session['uid'])    
            except Engineer.DoesNotExist:
                return redirect('/')    
        elif str(request.session['uid'])[0] == '3':
            return run_sup(request,request.session['uid'])
        elif str(request.session['uid'])[0] == '2':
            return pie_chart(request)
        elif str(request.session['uid'])[0] == '1':
            return dispMap(request, Airport.objects.all())     
        else:
            return redirect('/')    
