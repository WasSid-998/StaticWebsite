# Use official Terraform image as base
FROM hashicorp/terraform:1.6

# Set working directory inside container
WORKDIR /app

# Copy Terraform configuration files
COPY terraform/ /app/terraform

# Copy the wrapper script to /app
COPY run-terraform.sh /app/run-terraform.sh

# Make sure wrapper script is executable
RUN chmod +x /app/run-terraform.sh

# Set the working directory for Terraform
WORKDIR /app/terraform

# Default command runs the wrapper script
CMD ["/app/run-terraform.sh"]
