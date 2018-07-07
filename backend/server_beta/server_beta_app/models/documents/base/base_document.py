from mongoengine import Document, EmbeddedDocument


class BaseDocument(Document):
    """
        Document base for another documents in app
    """
    meta = {
        'allow_inheritance': True, 
        'abstract': True
    }

class BaseEmbeddedDocument(EmbeddedDocument):
    """
        EmbeddedDocument base for another documents in app
    """
    meta = {
        'allow_inheritance': True, 
        'abstract': True
    }



