from rest_framework import serializers
from .models import User, Vaccine, Appointment

# Sérialiseur pour l'utilisateur
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'phone_number', 'is_patient']

# Sérialiseur pour les vaccins
class VaccineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vaccine
        fields = ['id', 'name', 'description', 'doses_required', 'interval_between_doses']

# Sérialiseur pour les rendez-vous
class AppointmentSerializer(serializers.ModelSerializer):
    patient = UserSerializer(read_only=True)
    vaccine = VaccineSerializer(read_only=True)

    class Meta:
        model = Appointment
        fields = ['id', 'patient', 'vaccine', 'date', 'status']