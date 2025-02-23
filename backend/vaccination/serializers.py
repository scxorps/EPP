from rest_framework import serializers
from .models import Citizen, Vaccine, VaccinationAppointment, VaccinationRecord

class CitizenSerializer(serializers.ModelSerializer):
    class Meta:
        model = Citizen
        fields = '__all__'

class VaccineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vaccine
        fields = '__all__'

class VaccinationAppointmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = VaccinationAppointment
        fields = '__all__'

class VaccinationRecordSerializer(serializers.ModelSerializer):
    class Meta:
        model = VaccinationRecord
        fields = '__all__'