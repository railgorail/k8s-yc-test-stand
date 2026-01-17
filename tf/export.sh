export YC_TOKEN=$(yc iam create-token --impersonate-service-account-id ajeic7ote9k0is6frmoe)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)