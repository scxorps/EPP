from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    phone_number = models.CharField(max_length=15, blank=True, null=True)
    is_patient = models.BooleanField(default=True)

    # Ajoutez des related_name uniques pour éviter les conflits
    groups = models.ManyToManyField(
        'auth.Group',
        related_name='vaccination_users',  # Nom unique pour la relation inverse
        blank=True,
        help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.',
        verbose_name='groups',
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission',
        related_name='vaccination_users',  # Nom unique pour la relation inverse
        blank=True,
        help_text='Specific permissions for this user.',
        verbose_name='user permissions',
    )

    def __str__(self):
        return self.username

class Vaccine(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    doses_required = models.IntegerField(default=1)
    interval_between_doses = models.IntegerField(default=28)  # En jours

    def __str__(self):
        return self.name

class Appointment(models.Model):
    patient = models.ForeignKey(User, on_delete=models.CASCADE, related_name='appointments')
    vaccine = models.ForeignKey(Vaccine, on_delete=models.CASCADE)
    date = models.DateTimeField()
    status = models.CharField(max_length=20, choices=[
        ('scheduled', 'Scheduled'),
        ('completed', 'Completed'),
        ('cancelled', 'Cancelled'),
    ], default='scheduled')

    def __str__(self):
        return f"{self.patient.username} - {self.vaccine.name} - {self.date}"