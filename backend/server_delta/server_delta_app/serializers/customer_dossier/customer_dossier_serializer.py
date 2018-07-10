from server_delta_app import models, serializers


class CustomerDossierSerializer(serializers.BaseSerializer):
    """
        Serializer responsible by parse customer dossier
    """
    debts = serializers.DebtSerializer(required=False, many=True)
    patrimonies = serializers.PatrimonySerializer(required=False, many=True)
    financial_transactions = serializers.FinancialTransactionSerializer(required=False, many=True)
    sources_income = serializers.SourceIncomeSerializer(required=False, many=True)
    
    class Meta:
        model = models.CustomerDossierModel
        fields = '__all__'
