# Generated by Django 3.0.4 on 2020-04-26 20:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0007_dscnmlogs'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cdvormlogs',
            fields=[
                ('log_id', models.AutoField(primary_key=True, serialize=False)),
                ('value', models.CharField(max_length=30)),
                ('remarks', models.CharField(db_column='Remarks', max_length=100)),
                ('date', models.DateField(db_column='Date')),
                ('time', models.TimeField()),
            ],
            options={
                'db_table': 'cdvormlogs',
                'managed': False,
            },
        ),
    ]
