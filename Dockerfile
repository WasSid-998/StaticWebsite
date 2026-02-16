FROM hashicorp/terraform:1.6
WORKDIR /app
COPY terraform/ /app/terraform
COPY . /app/website
COPY run.sh /app/terraform/run.sh
RUN chmod +x /app/terraform/run.sh
WORKDIR /app/terraform

ENTRYPOINT ["/app/terraform/run.sh"]
