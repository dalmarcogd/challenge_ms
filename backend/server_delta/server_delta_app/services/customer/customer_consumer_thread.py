import threading, requests, json
from server_delta_app import models
from server_delta_project import settings
from .server_alpha import CustomerConsumerServerAlpha
from .server_beta import CustomerConsumerServerBeta
from .server_capa import CustomerConsumerServerCapa

class CustomerConsumerThread(threading.Thread):
    
    def __init__(self, cpf):
        self.cpf = cpf
        threading.Thread.__init__(self)
    
    def run(self):
        if self.cpf:
            self.consumer_services(self.cpf)  
        else :
            print('CPF cannot be null')

    def consumer_services(self, cpf):
        # Exclude customer dossier
        for customer in models.CustomerDossierModel.objects.filter(cpf=self.cpf).all():
            customer.delete()
        
        CustomerConsumerServerAlpha.consumer(cpf)
        CustomerConsumerServerBeta.consumer(cpf)
        CustomerConsumerServerCapa.consumer(cpf)
