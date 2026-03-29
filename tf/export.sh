# adjust to your service account id
export YC_TOKEN=$(yc iam create-token --impersonate-service-account-id <service_account_id>)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)