# challenge_ms
Projeto de teste arquitetura alta disponibilidade.

# Arquitetura
![alt text](https://github.com/dalmarcogd/challenge_ms/blob/master/diagram.png)

A arquitetura conta com quatro servidores de backend e um de frontend.
Backend:
- Server Alpha - A
  + Desenvolvido em python utilizando os frameworks [Django REST Framework](http://www.django-rest-framework.org/), [Django OAuth Toolkit](http://django-oauth-toolkit.readthedocs.io/en/latest/index.html) e banco de dados [PostgreSQL](https://www.postgresql.org/).
- Server Beta - B
  + Desenvolvido em python utilizando os frameworks [Django REST Framework](http://www.django-rest-framework.org/), [Django OAuth Toolkit](http://django-oauth-toolkit.readthedocs.io/en/latest/index.html), [Django Rest Framework Mongoengine](https://github.com/umutbozkurt/django-rest-framework-mongoengine) e banco de dados [PostgreSQL](https://www.postgresql.org/) e [mongoDB](https://www.mongodb.com/).
- Server Capa - C
  + Desenvolvido em golang e banco de dados [mongoDB](https://www.mongodb.com/).
  
- Server Delta - D
  + Desenvolvido em python utilizando os frameworks [Django REST Framework](http://www.django-rest-framework.org/), [Django OAuth Toolkit](http://django-oauth-toolkit.readthedocs.io/en/latest/index.html) e banco de dados [PostgreSQL](https://www.postgresql.org/).

- Web Delta
  + Desenvolvido em typescript utilizando os frameworks [Angular](https://angular.io/) e [Angular Material](https://material.angular.io/).
  
 # Funcionamento
Servidores Alpha, Beta e Capa, disponibilizam informações das respectivas base de dados que são alimentadas por outros sistemas.
O servidor Delta consome os servidores acima formando um dossiê dos dados de clientes.
- O servidor Alpha prove informações de dividas no seguinte formato:
[
    {
        "id": 1,
        "debts": [
            {
                "id": 3,
                "value": "1000.00",
                "date": "2018-07-07",
                "customer": 3
            }
        ],
        "cpf": "06134332991",
        "name": "Teste",
        "address": "Rua Joaquina"
    }
]

- O servidor Beta prove informações patrimonios e fontes de receita no seguinte formato:
[
    {
        "id": "5b44a7f588c87a08fc450d98",
        "cpf": "06934332991",
        "date_birth": "2018-07-09T22:11:33.800000Z",
        "name": "Teste",
        "address": "Rua blaba",
        "patrimonies": [
            {
                "value": "1000.00",
                "description": "Carro",
                "_cls": "PatrimonyDocument"
            }
        ],
        "sources_income": [
            {
                "value": "1000.00",
                "description": "Salário",
                "_cls": "SourceIncomeDocument"
            }
        ],
        "_cls": "CustomerDocument"
    }
]
- O servidor Capa prove informações de transações bancárias no seguinte formato:
[
    {
        "id": "5b3e4175c43bfd2b780afeba",
        "description": "debito bancário",
        "value": 0,
        "date": "2011-10-05T11:48:00-03:00",
        "cpf": "06934332997",
        "type": "",
        "PaymentType": ""
    },
]

