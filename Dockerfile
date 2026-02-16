FROM hashicorp/terraform:1.6

# Set working directory
WORKDIR /app

# Copy Terraform configuration and wrapper script
COPY terraform/ /app/terraform
COPY run-terraform.sh /app/terraform/run-terraform.sh
RUN chmod +x /app/terraform/run-terraform.sh

# Optional: copy website files if needed
COPY . /app/website

WORKDIR /app/terraform

# Use the wrapper script as CMD
CMD ["/app/terraform/run-terraform.sh"]
