#!/bin/sh
set -e  # Exit immediately if any command fails

echo "Starting Terraform..."
terraform init
terraform apply -auto-approve
echo "Terraform applied successfully!"

# Output the website URL (if needed)
terraform output -raw website_url
