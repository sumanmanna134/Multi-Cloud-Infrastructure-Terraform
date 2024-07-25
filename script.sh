#!/bin/bash

# Function to display the menu
display_menu() {
    echo "Terraform Menu:"
    echo "1. Initialize Terraform"
    echo "2. Plan Terraform"
    echo "3. Apply Terraform"
    echo "4. Refresh Terraform"
    echo "5. Destroy Terraform"
    echo "6. Exit"
}
# Function to initialize Terraform
terraform_init() {
    echo "Initializing Terraform..."
    terraform init
    echo "Terraform initialized."
}

terraform_plan() {
    echo "Planning Terraform..."
    terraform plan --var-file="./tfvars/terraform.tfvars" -out azinfra.tfplan
    echo "Terraform Plan created."
}

# Function to apply Terraform
terraform_apply() {
    echo "Applying Terraform..."
    terraform apply azinfra.tfplan
    echo "Terraform applied."
}

# Function to destroy Terraform
terraform_destroy() {
    echo "Destroying Terraform..."
    terraform destroy --var-file="./tfvars/terraform.tfvars"
    echo "Terraform destroyed."
}

terraform_refresh() {
    echo "Refreshing Terraform..."
    terraform refresh --var-file="./tfvars/terraform.tfvars"
    echo "Terraform refreshed."
}

# Main script
while true; do
    display_menu
    read -p "Enter your choice [1-6]: " choice

    case $choice in
        1)
            terraform_init
            ;;
        2)
            terraform_plan
            ;;
        3)
            terraform_apply
            ;;
        4)
            terraform_apply
            ;;
        5)
            terraform_destroy
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done
