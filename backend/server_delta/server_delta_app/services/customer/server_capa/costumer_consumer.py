import threading, requests, json
from server_delta_app import models
from server_delta_project import settings
from dateutil import parser

class CustomerConsumerServerCapa():

    @staticmethod
    def consumer(cpf):
        print('Consumer Server Capa')
        
        response = requests.get(settings.SERVER_CAPA_URL + '/financial-transactions/{}'.format(cpf))
        financial_transactions_content = []
        if response.status_code == 200:
            financial_transactions_content = json.loads(response.content)
        else:
            print('Error when retrieve data...')
            return

        for financial_transaction_content in financial_transactions_content:
            customer_dossier = models.CustomerDossierModel.objects.filter(cpf=cpf)
            print(customer_dossier)
            if not customer_dossier.exists():
                print("Customer dossier not found by CPF.")
                return
            financial_transaction = models.FinancialTransactionModel()
            financial_transaction.customer_dossier = customer_dossier.get()
            financial_transaction.value = financial_transaction_content.get('value', None)
            financial_transaction.description = financial_transaction_content.get('description', None)
            financial_transaction.date = parser.parse(financial_transaction_content.get('date', None))
            financial_transaction.type_transaction = financial_transaction_content.get('type', None)
            financial_transaction.payment_type = financial_transaction_content.get('PaymentType', None)
            financial_transaction.save()

        print('End consumer Server Capa')