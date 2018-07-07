from server_beta_app.models import documents
from mongoengine import fields

class PatrimonyDocument(documents.BaseEmbeddedDocument):
    """
        Document that represent the customer's patrimonies registered in app
    """

    value = fields.DecimalField(required=True)
    description = fields.StringField(max_length=1000, required=True)
