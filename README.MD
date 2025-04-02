# Project Structure

📂 terraform-grafana-monitor
│── 📁 modules/                  # Reusable Terraform modules
│    ├── 📄 main.tf               # Defines Azure resources (Grafana, Monitor, etc.)
│    ├── 📄 variables.tf          # Module input variables
│    ├── 📄 outputs.tf            # Module outputs
│── 📄 main.tf                   # Calls the Grafana module
│── 📄 variables.tf              # Defines project-wide variables
│── 📄 provider.tf              # Define azure provider
│── 📄 azure_grafana_dashboard.tfvars          # Stores user-defined values (Grafana instances, RGs, etc.)
│── 📄 outputs.tf                # Outputs resource details
│── 📄 .gitignore                # Prevents committing sensitive & temporary files
│── 📄 README.md                 # Project documentation



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