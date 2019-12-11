from django.shortcuts import render
from django.http import HttpResponse
from passlib.hash import pbkdf2_sha256
from .models import users
from .models import Destination
from django.shortcuts import redirect
import re
# Create your views here.
def main(request):    
    dest = Destination.objects.all()
    print(dest)
    return render(request,'main.html',{'dest':dest})

def login(request):
      return render(request,"login.html")
def register(request):
    return render(request,"register.html")
def registerAPI(request):
    if request.method == "POST":
        name = request.POST['name']
        enc_password = pbkdf2_sha256.encrypt(request.POST["password"],salt_size=32)
        emailID = request.POST["emailID"]
        mobileNo = request.POST["mobileNo"]
        users.objects.create(
            name = name,
            password = enc_password,
            emailID = emailID,
            mobileNo = mobileNo
        )
        users.save()    
    response = redirect('login')
    return response
def loginAPI(request):
    if(request.method == "POST"):
        name = request.POST['name']
        if(check_email(name)):
            result = users.objects.filter(emailID = name)            
        elif(check_phno(name)):
            result = users.objects.filter(mobileNo = name)
        else:
            result = users.objects.filter(name = name)
        if result.count() > 0:
            res = users.verify_password(result[0].password,request.POST["password"])
            if(res):
                return render(request,'result.html',({"result":result[0].name}))
            else:
                res="emailID/phonenumber/password entered did not match"
                return render(request,'result.html',({"result":res}))
        else:
            res="emailID/phonenumber/password entered did not match"
            return render(request,'result.html',({"result":res}))
    
def check_email(name): 
    email = '^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$'
    if(re.search(email,name)):  
        return True            
    else:  
        return False

def check_phno(name):
    if re.match(r'[789]\d{9}$',name):   
        return True            
    else:  
        return False



