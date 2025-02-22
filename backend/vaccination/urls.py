from django.urls import path
from . import views

urlpatterns = [
    path('users/', views.UserListCreateView.as_view(), name='user-list-create'),
    path('vaccines/', views.VaccineListCreateView.as_view(), name='vaccine-list-create'),
    path('appointments/', views.AppointmentListCreateView.as_view(), name='appointment-list-create'),
    path('appointments/<int:pk>/', views.AppointmentDetailView.as_view(), name='appointment-detail'),
]