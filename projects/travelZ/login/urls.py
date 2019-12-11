from django.urls import path
from . import views
urlpatterns=[
    path('',views.main, name='main'),
    path('login/',views.login, name='login'),
    path('register/',views.register,name='register'),
    path('register/registerAPI',views.registerAPI,name='registerAPI'),
    path('login/loginAPI',views.loginAPI,name='loginAPI'),
    
]