from server_alpha_app import models, serializers


class CustomerSerializer(serializers.BaseSerializer):
    """
        Serializer responsible by parse customer
    """
    debts = serializers.DebtSerializer(required=False, many=True)
    
    class Meta:
        model = models.CustomerModel
        fields = '__all__'

    def create(self, validated_data):
        debts_data = validated_data.pop('debts')

        customer = super(CustomerSerializer, self).create(validated_data)

        for debt_data in debts_data:
            debt_data['customer'] = customer
            serializers.DebtSerializer().create(debt_data)

        return customer

    def update(self, instance, validated_data):
        debts_data = validated_data.pop('debts')

        customer = super(CustomerSerializer, self).update(instance, validated_data)

        for debt_data in debts_data:
            debt_data['customer'] = instance
            if debt_data.get('id', None) is not None:
                serializers.DebtSerializer().update(models.DebtModel.objects.get_by_pk(debt_data['id']), debt_data)
            else: 
                serializers.DebtSerializer().create(debt_data)

        return customer
