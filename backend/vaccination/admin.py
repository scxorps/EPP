from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Vaccine, Appointment

# Enregistrer le modèle User personnalisé
@admin.register(User)
class CustomUserAdmin(UserAdmin):
    list_display = ('username', 'email', 'phone_number', 'is_patient', 'is_staff')
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        ('Personal info', {'fields': ('email', 'phone_number')}),
        ('Permissions', {'fields': ('is_patient', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'phone_number', 'password1', 'password2', 'is_patient', 'is_staff'),
        }),
    )

# Enregistrer le modèle Vaccine
@admin.register(Vaccine)
class VaccineAdmin(admin.ModelAdmin):
    list_display = ('name', 'doses_required', 'interval_between_doses')
    search_fields = ('name',)

# Enregistrer le modèle Appointment
@admin.register(Appointment)
class AppointmentAdmin(admin.ModelAdmin):
    list_display = ('patient', 'vaccine', 'date', 'status')
    list_filter = ('status', 'date')
    search_fields = ('patient__username', 'vaccine__name')