# Project Structure

├── main.tf                # Root module where you call the module and configure inputs
├── variables.tf           #  Root module variables to define inputs for your resources
├── provider.tf           #  Root module provider (Azurerm)
├── azure_grafana_dashboard.tfvars       # Values for your variables, this is where you'll configure instances (grafana_instances)
├── modules/
│   └──
│       ├── main.tf        # The actual module with resources like azurerm_dashboard_grafana, azurerm_monitor_workspace, etc.
│       ├── variables.tf   # Module-specific variables
│       ├── outputs.tf     # Optional: outputs if you want to get any resource details after creation
└── terraform.tfstate      # Terraform state file that gets created during apply


# Important Commands : 

# Login to Azure 
* az login

# Register for Azure Dashboards
* az provider register --namespace Microsoft.Dashboard
* az provider show --namespace Microsoft.Dashboard --query "registrationState"

# Terraform Commands 
* terraform init
* terraform fmt
* terraform validate
* terraform plan -var-file="azure_grafana_dashboard.tfvars" 
* terraform apply -var-file="azure_grafana_dashboard.tfvars" --auto-approve