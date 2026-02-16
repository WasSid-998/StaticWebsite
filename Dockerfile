FROM hashicorp/terraform:1.6
WORKDIR /app
COPY terraform/ /app/terraform
COPY . /app/website
WORKDIR /app/terraform

# Override the Entrypoint so it does not use /bin/terraform
ENTRYPOINT []

# Run Terraform commands via shell
CMD ["sh", "-c", "terraform init && terraform apply -auto-approve && terraform output -raw website_url"]
