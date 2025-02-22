
from rest_framework import generics, permissions
from .models import User, Vaccine, Appointment
from .serializers import UserSerializer, VaccineSerializer, AppointmentSerializer

# Vue pour lister et créer des utilisateurs
class UserListCreateView(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

# Vue pour lister et créer des vaccins
class VaccineListCreateView(generics.ListCreateAPIView):
    queryset = Vaccine.objects.all()
    serializer_class = VaccineSerializer

# Vue pour lister et créer des rendez-vous
class AppointmentListCreateView(generics.ListCreateAPIView):
    queryset = Appointment.objects.all()
    serializer_class = AppointmentSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(patient=self.request.user)

# Vue pour récupérer, mettre à jour ou supprimer un rendez-vous
class AppointmentDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Appointment.objects.all()
    serializer_class = AppointmentSerializer
    permission_classes = [permissions.IsAuthenticated]