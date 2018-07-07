from server_beta_app.models import documents
from mongoengine import fields

class SourceIncomeDocument(documents.BaseEmbeddedDocument):
    """
        Document that represent the customer's source of income registered in app
    """

    value = fields.DecimalField(required=True)
    description = fields.StringField(max_length=1000, required=True)
