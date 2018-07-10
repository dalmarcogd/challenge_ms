import threading, requests, json
from server_delta_app import models
from server_delta_project import settings

class CustomerConsumerServerAlpha():

    @staticmethod
    def consumer(cpf):
        print('Consumer Server Alpha')
        
        # Authenticate the user        
        params = 'grant_type={}&client_id={}&client_secret={}&username={}&password={}'.format('password', settings.SERVER_ALPHA_RESOURCE_OWNER_ID, settings.SERVER_ALPHA_RESOURCE_OWNER_SECRET, settings.SERVER_ALPHA_USERNAME, settings.SERVER_ALPHA_PASSWORD)
        response = requests.post(settings.SERVER_ALPHA_URL + '/api/oauth/token/?{}'.format(params))
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
        response = requests.get(settings.SERVER_ALPHA_URL + '/api/customers/?{}'.format(params), headers=headers)
        customer_content = []
        if response.status_code == 200:
            customer_content = json.loads(response.content)
        else:
            print('Error when retrieve data...')
            return
        if len(customer_content) == 0:
            print("Customer dossier not found by CPF.")
            return
        for customer in customer_content:
            customer_dossier = models.CustomerDossierModel()
            customer_dossier.cpf = customer.get('cpf', None)
            customer_dossier.name = customer.get('name', None)
            customer_dossier.address = customer.get('address', None)
            customer_dossier.save()
            for debt in customer.get('debts', []):
                models.DebtModel(value=debt.get('value', None), date=debt.get('date', None), customer_dossier= customer_dossier).save()        

        print('End consumer Server Alpha')