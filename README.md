# Cloud-Computing-DevOps-Engineering-project-2

## Project Description
Infrastructure as Code project using Docker, Terraform, Azure Container Instances, and GitHub Actions CI/CD to deploy a containerized web application with manual production approval.

## Docker Application

The web application is a simple dashboard that displays the project deployment status:

- Docker Image: Running
- Azure Container Instance: Deployed
- Terraform: Infrastructure Created
- GitHub Actions: CI/CD Enabled
- Environment: Production

## Docker Build

```bash
docker build -t mayar4784/cloudscale-project2:latest .

## Terraform Setup

Terraform is used to provision the Azure infrastructure for this project.

The Terraform files are:

- providers.tf: Configures the Azure provider
- main.tf: Creates the Resource Group and Azure Container Instance
- variables.tf: Stores reusable input variables
- outputs.tf: Displays the public IP, FQDN, and resource group name

## Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

## GitHub Actions Workflow Explanation

This project uses GitHub Actions to automate the Terraform deployment process. The workflow file is located in:

```text
.github/workflows/terraform.yml
```

The workflow is triggered in two cases:

1. **Pull Request to main**
   When a pull request is opened to the `main` branch, GitHub Actions runs `terraform plan`. This checks what infrastructure changes Terraform will make before applying them.

2. **Push to main**
   When changes are pushed to the `main` branch, GitHub Actions runs `terraform apply`. This applies the Terraform configuration and deploys the Azure infrastructure.

The workflow has two jobs:

### Terraform Plan

This job runs first. It performs the following steps:

```text
Checkout repository
Setup Terraform
Terraform Init
Terraform Format Check
Terraform Validate
Terraform Plan
```

The purpose of this job is to check that the Terraform code is correct and to preview the changes before deployment.

### Terraform Apply

This job runs after the Terraform Plan job. It only runs when changes are pushed to the `main` branch. This job applies the Terraform configuration and creates or updates the Azure resources.

The workflow helps automate the deployment process and reduces manual errors.

## Manual Approval Explanation

A manual approval gate is used before deploying to the production environment.

In GitHub, an environment called `production` was created. Required reviewers were added to this environment. Because the `terraform-apply` job uses:

```yaml
environment: production
```

GitHub Actions pauses the deployment before running `terraform apply`. A reviewer must approve the deployment before the apply job can continue.

This protects the production environment because infrastructure changes are not applied automatically without approval.

The approval process works like this:

```text
Push to main
Terraform Plan runs
Terraform Apply waits for approval
Reviewer approves deployment
Terraform Apply runs
Azure resources are deployed
```
## Azure Secrets Explanation

GitHub Secrets are used to store Azure authentication values securely. These secrets allow GitHub Actions to connect to Azure and run Terraform without writing sensitive information directly in the code.

The following secrets were added in GitHub:

```text
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_TENANT_ID
AZURE_SUBSCRIPTION_ID
```

These values come from an Azure Service Principal.

The secrets are used in the workflow file as environment variables:

```yaml
env:
  ARM_CLIENT_ID: ${{ secrets.AZURE_CLIENT_ID }}
  ARM_CLIENT_SECRET: ${{ secrets.AZURE_CLIENT_SECRET }}
  ARM_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
  ARM_SUBSCRIPTION_ID: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
```

Terraform uses these variables to authenticate with Azure and manage the Azure Container Instance resources.

Using GitHub Secrets is important because it keeps credentials private and prevents sensitive Azure information from being exposed in the repository.

 ## Repository Link 
 https://github.com/malak4693-88/Cloud-Computing-DevOps-Engineering-project-2.git
