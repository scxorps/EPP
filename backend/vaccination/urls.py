from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import CitizenViewSet, VaccineViewSet, VaccinationAppointmentViewSet, VaccinationRecordViewSet

router = DefaultRouter()
router.register(r'citizens', CitizenViewSet)
router.register(r'vaccines', VaccineViewSet)
router.register(r'appointments', VaccinationAppointmentViewSet)
router.register(r'records', VaccinationRecordViewSet)

urlpatterns = [
    path('', include(router.urls)),
]