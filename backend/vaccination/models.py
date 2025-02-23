from django.db import models
from django.contrib.auth.models import User


class Citizen(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='citizen')
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField()
    phone_number = models.CharField(max_length=15)
    email = models.EmailField(unique=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

class Vaccine(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

class VaccinationAppointment(models.Model):
    citizen = models.ForeignKey(Citizen, on_delete=models.CASCADE, related_name='appointments')
    vaccine = models.ForeignKey(Vaccine, on_delete=models.CASCADE)
    appointment_date = models.DateTimeField()
    status = models.CharField(max_length=20, choices=[
        ('Scheduled', 'Scheduled'),
        ('Completed', 'Completed'),
        ('Cancelled', 'Cancelled')
        ],
        default='Scheduled')

    def __str__(self):
        return f"{self.citizen} - {self.vaccine} on {self.appointment_date}"

class VaccinationRecord(models.Model):
    citizen = models.ForeignKey(Citizen, on_delete=models.CASCADE, related_name='records')
    vaccine = models.ForeignKey(Vaccine, on_delete=models.CASCADE)
    date_administered = models.DateField()
    administered_by = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.citizen} - {self.vaccine} on {self.date_administered}"