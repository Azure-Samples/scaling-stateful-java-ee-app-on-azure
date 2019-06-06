#!/usr/bin/env bash

# Supply - Azure Environment
export SUBSCRIPTION_ID=<your-subscription-id>
export RESOURCEGROUP_NAME=<your-resource-group-name>
export REGION_1=westus
export REGION_2=eastus
export REGION=westus2

# Supply - App Service App Name
export WEBAPP_NAME=<your-webapp-name>

# Composed from Supplied - App Service Plan Name
export WEBAPP_PLAN_NAME=${WEBAPP_NAME}-appservice-plan

# Supply these secrets for SQLServer
export SQL_SERVER_NAME=<your server name>
export SQL_SERVER_ADMIN_LOGIN_NAME=<your sql server login name>
export SQL_SERVER_ADMIN_PASSWORD=<your sql server admin password>
export SQL_DATABASE_NAME=<your sql server database>

# Secrets composed from supplied secrets for PostgreSQL
export SQL_SERVER_FULL_NAME=${SQL_SERVER_NAME}.database.windows.net
export SQL_SERVER_ADMIN_FULL_NAME=${SQL_SERVER_ADMIN_LOGIN_NAME}@${SQL_SERVER_NAME}
export SQL_CONNECTION_URL="jdbc:sqlserver://${SQL_SERVER_FULL_NAME}:1433;user=${SQL_SERVER_ADMIN_FULL_NAME};password=${SQL_SERVER_ADMIN_PASSWORD};database=${SQL_DATABASE_NAME};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"

# Supply - Traffic Manager Info
export TRAFFIC_MANAGER_PROFILE_NAME=<your-traffic-manager-profile-name>
export TRAFFIC_MANAGER_DNS_NAME=<your-traffic-manager-dns-name>

# Composed from Supplied - Traffic Manager Endpoints
export TARGET_RESOURCE_ID_1="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCEGROUP_NAME}/providers/Microsoft.Web/sites/${WEBAPP_NAME}-${REGION_1}"
export TARGET_RESOURCE_ID_2="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCEGROUP_NAME}/providers/Microsoft.Web/sites/${WEBAPP_NAME}-${REGION_2}"

#==================================

# FTP Secrets
# az webapp deployment list-publishing-profiles -g ${RESOURCEGROUP_NAME} -n ${WEBAPP_NAME}-${REGION_1}

export FTP_HOST_1=<your first app FTP host name>
export FTP_USERNAME_1=<your first app FTP user name>
export FTP_PASSWORD_1=<your first app FTP password>

# az webapp deployment list-publishing-profiles -g ${RESOURCEGROUP_NAME} -n ${WEBAPP_NAME}-${REGION_2}

export FTP_HOST_2=<your second app FTP host name>
export FTP_USERNAME_2=<your second app FTP user name>
export FTP_PASSWORD_2=<your second app FTP password>
