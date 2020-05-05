from django.db import models

from login.models import Employee,Airport
# Create your models here.
class Mcdo(models.Model):
    sr_no = models.AutoField(primary_key=True)
    emp = models.ForeignKey(Employee, models.DO_NOTHING)
    a = models.ForeignKey(Airport, models.DO_NOTHING)
    topic = models.CharField(max_length=50)
    dop = models.DateTimeField(db_column='DOP')  # Field name made lowercase.
    content = models.TextField()
    doa = models.DateTimeField(db_column='DOA', blank=True, null=True)  # Field name made lowercase.
    approved_by = models.ForeignKey(Employee, models.DO_NOTHING, db_column='approved_by', blank=True, null=True, related_name = '+')
    approval_from = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'mcdo'


class McdoLogs(models.Model):
    sr_no = models.AutoField(primary_key=True)
    emp_id = models.IntegerField()
    approval_from = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'mcdo_logs'