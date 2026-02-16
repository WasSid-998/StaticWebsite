#!/bin/sh
set -e  # Exit immediately if any command fails

echo "Starting Terraform..."
terraform init
terraform apply -auto-approve
echo "Terraform applied successfully!"

# Output the website URL (if needed)
WEBSITE_URL=$(terraform output -raw website_url)
echo "=============================="
echo "Website is live at: $WEBSITE_URL"
echo "=============================="

