# Generated by Django 3.0.4 on 2020-04-25 13:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0005_cdvordlogs_cdvorwlogs'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dscnwlogs',
            fields=[
                ('log_id', models.AutoField(primary_key=True, serialize=False)),
                ('remarks', models.CharField(max_length=100)),
                ('value', models.CharField(max_length=30)),
                ('date', models.DateField()),
                ('time', models.TimeField()),
            ],
            options={
                'db_table': 'dscnwlogs',
                'managed': False,
            },
        ),
    ]