FROM hashicorp/terraform:1.6
WORKDIR /app
COPY terraform/ /app/terraform
COPY . / /app/website
WORKDIR /app/terraform
CMD ["sh", "-c", "terraform init && terraform apply -auto-approve && terraform output -raw website_url"]

