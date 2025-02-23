from rest_framework import viewsets
from .models import Citizen, Vaccine, VaccinationAppointment, VaccinationRecord
from .serializers import CitizenSerializer, VaccineSerializer, VaccinationAppointmentSerializer, VaccinationRecordSerializer

class CitizenViewSet(viewsets.ModelViewSet):
    queryset = Citizen.objects.all()
    serializer_class = CitizenSerializer

class VaccineViewSet(viewsets.ModelViewSet):
    queryset = Vaccine.objects.all()
    serializer_class = VaccineSerializer

class VaccinationAppointmentViewSet(viewsets.ModelViewSet):
    queryset = VaccinationAppointment.objects.all()
    serializer_class = VaccinationAppointmentSerializer

class VaccinationRecordViewSet(viewsets.ModelViewSet):
    queryset = VaccinationRecord.objects.all()
    serializer_class = VaccinationRecordSerializer