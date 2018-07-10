import threading, requests, json
from server_delta_app import models
from server_delta_project import settings
from dateutil import parser

class CustomerConsumerServerBeta():

    @staticmethod
    def consumer(cpf):
        print('Consumer Server Beta')
        
        # Authenticate the user        
        params = 'grant_type={}&client_id={}&client_secret={}&username={}&password={}'.format('password', settings.SERVER_BETA_RESOURCE_OWNER_ID, settings.SERVER_BETA_RESOURCE_OWNER_SECRET, settings.SERVER_BETA_USERNAME, settings.SERVER_BETA_PASSWORD)
        response = requests.post(settings.SERVER_BETA_URL + '/api/oauth/token/?{}'.format(params))
        password_token = None
        if response.status_code == 200:
            password_token = json.loads(response.content)
        else:
            print('Error when try authenticate...')
            return

        if password_token is None or password_token.get('access_token', None) is None:
            print('Error access_token not received...')
            return

        params = 'cpf={}'.format(cpf)
        headers = {
            'Authorization': 'Bearer {}'.format(password_token.get('access_token'))
        }
        response = requests.get(settings.SERVER_BETA_URL + '/api/customers/?{}'.format(params), headers=headers)
        customer_content = []
        if response.status_code == 200:
            customer_content = json.loads(response.content)
        else:
            print('Error when retrieve data...')
            return
        customer_dossier = models.CustomerDossierModel.objects.get(cpf=cpf)
        if customer_dossier is None:
            print("Customer dossier not found by CPF.")
            return

        for customer in customer_content:
            customer_dossier.date_birth = parser.parse(customer.get('date_birth', None))
            customer_dossier.save()
            for patrimony in customer.get('patrimonies', []):
                models.PatrimonyModel(value=patrimony.get('value', None), description=patrimony.get('description', None), customer_dossier=customer_dossier).save()
            for patrimony in customer.get('sources_income', []):
                models.SourceIncomeModel(value=patrimony.get('value', None), description=patrimony.get('description', None), customer_dossier=customer_dossier).save()        

        print('End consumer Server Beta')