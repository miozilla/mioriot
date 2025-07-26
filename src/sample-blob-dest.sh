# Replace the storage account name with your own unique value
SA=yourstorageaccount$RANDOM
CN=exportdata
RG=centralexportresources
LOCATION=eastus

az group create -n $RG --location $LOCATION
az storage account create --name $SA --resource-group $RG --location $LOCATION --sku Standard_LRS
az storage container create --account-name $SA --resource-group $RG --name $CN

CS=$(az storage account show-connection-string --resource-group $RG --name $SA --query "connectionString" --output tsv)

echo "Storage connection string: $CS"