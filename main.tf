name: Terraform + Docker Auto

on:
  push:
    branches:
      - main
    paths:
      - 'main.tf'
      - 'Dockerfile'
      - 'index.html'
  workflow_dispatch:

jobs:
  terraform-validate:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: "1.6.6"
          terraform_wrapper: false

      - name: Terraform Format Check
        run: terraform fmt -check
        continue-on-error: true

      - name: Terraform Init
        run: |
          terraform init
        env:
          TF_CLI_ARGS_init: "-upgrade"

      - name: Terraform Validate
        run: terraform validate

      - name: Terraform Plan
        run: terraform plan -out=tfplan
        continue-on-error: true

      - name: ✅ Validation réussie
        run: echo "✅ Terraform configuration validée avec succès!"