FROM hashicorp/terraform:1.6
WORKDIR /app
COPY terraform/ /app/terraform
COPY website/ /app/website
COPY terraform/run-terraform.sh /app/terraform/run-terraform.sh
RUN chmod +x /app/terraform/run-terraform.sh
WORKDIR /app/terraform

ENTRYPOINT ["/app/terraform/run-terraform.sh"]
