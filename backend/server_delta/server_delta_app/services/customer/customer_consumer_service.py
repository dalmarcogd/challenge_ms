from .customer_consumer_thread import CustomerConsumerThread

class CustomerConsumerService():

    def proccess_in_background(self, cpf):
        CustomerConsumerThread(cpf).start()

    def proccess(self, cpf):
        CustomerConsumerThread(cpf).consumer_services(cpf)
    