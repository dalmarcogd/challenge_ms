from server_beta_app.models import documents, managers
from mongoengine import Document, EmbeddedDocument, fields


class CustomerDocument(documents.BaseDocument):
    """
        Model that represent the customer registered in app
    """
    class Meta:
        object_name = 'Customer'

    cpf = fields.StringField(required=True, max_length=11, min_length=11, unique=True)
    date_birth = fields.DateTimeField(required=True, )
    name = fields.StringField(required=True, max_length=100)
    address = fields.StringField(required=True, max_length=150)
    patrimonies = fields.EmbeddedDocumentListField(documents.PatrimonyDocument)
    sources_income = fields.EmbeddedDocumentListField(documents.SourceIncomeDocument)
