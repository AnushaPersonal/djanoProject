from django.db import models
from passlib.hash import pbkdf2_sha256
# Create your models here.

class users(models.Model):
    id = models.BigAutoField(primary_key = True,auto_created=True)
    name = models.CharField(max_length=100,blank=False)
    password = models.CharField(max_length=256,blank=False)
    emailID = models.EmailField(max_length=128,unique=True,blank=False)
    mobileNo = models.CharField(max_length=128,blank=False)
    status = models.BooleanField(default=True)

    def verify_password(existing,raw_password):
        return pbkdf2_sha256.verify(raw_password,existing)


class Destination(models.Model):
    id = models.BigAutoField(primary_key = True,auto_created=True)
    city = models.CharField(max_length=1000,blank=False)
    country = models.CharField(max_length=1000)
    desc =  models.CharField(max_length=1000)
    img_url = models.CharField(max_length=10000,blank=False)
    img = models.ImageField()
    price = models.FloatField(blank=False,default=0.0)
    specialofferpercentage = models.FloatField()
    specialprice =  models.FloatField()
    offer = models.BooleanField(default=False)
    status = models.BooleanField(default=True)
    
 
         
