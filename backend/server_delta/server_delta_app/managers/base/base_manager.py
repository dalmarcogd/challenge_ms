from django.db import models, transaction
from rest_framework.serializers import raise_errors_on_nested_writes
from rest_framework.utils import model_meta


class BaseManager(models.Manager):
    """
        Base Manager responsible for keep a base implementation for Managers
    """
    def get_by_pk(self, pk):
        try:
            return self.get(pk=pk)
        except self.model.DoesNotExist:
            return None

    def get(self, *args, **kwargs):
        try:
            return super(BaseManager, self).get(*args, **kwargs)
        except self.model.DoesNotExist:
            return None

    def _before_create(self, model, **kwargs):
        return kwargs

    @transaction.atomic()
    def create(self, **kwargs):
        obj = self.model(**kwargs)
        self._validate_create(obj)
        kwargs = self._before_create(obj, **kwargs)
        obj = super(BaseManager, self).create(**kwargs)
        self._after_create(obj)
        return obj

    def _after_create(self, model):
        pass

    def _before_update(self, model, **kwargs):
        return kwargs

    @transaction.atomic()
    def update(self, **kwargs):
        obj = self.model(**kwargs)
        self._validate_update(obj)
        kwargs = self._before_update(obj, **kwargs)
        obj = super(BaseManager, self).update(**kwargs)
        self._after_update(obj)
        return obj

    @transaction.atomic()
    def update(self, instance,  data):
        info = model_meta.get_field_info(instance)

        # Simply set each attribute on the instance, and then save it.
        # Note that unlike `.create()` we don't need to treat many-to-many
        # relationships as being a special case. During updates we already
        # have an instance pk for the relationships to be associated with.
        for attr, value in data.items():
            if attr in info.relations and info.relations[attr].to_many:
                field = getattr(instance, attr)
                field.set(value)
            else:
                setattr(instance, attr, value)

        self._validate_update(instance)
        self._before_update(instance)
        instance.save()
        self._after_update(instance)
        return instance

    def _after_update(self, model):
        pass

    @transaction.atomic()
    def delete(self):
        self._validate_delete(self.get_object())
        return super(BaseManager, self).delete()

    def _validate_create(self, model):
        pass

    def _validate_update(self, model):
        pass

    def _validate_delete(self, model):
        pass