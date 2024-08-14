#!/bin/bash


# Function to display the menu
display_menu() {
    local provider=$1
    echo "----------------------------------------------------------------"
    echo "Terraform Menu: ($provider)"
    echo "1. Initialize Terraform"
    echo "2. Plan Terraform"
    echo "3. Validate Terraform"
    echo "4. Apply Terraform"
    echo "5. Refresh Terraform"
    echo "6. Destroy Terraform"
    echo "7. Exit"
    echo "----------------------------------------------------------------"
    echo ""

}
# Function to initialize Terraform
terraform_init() {
    # local directory=$1
    echo "Initializing Terraform..."
    terraform init
    echo "Terraform initialized."
    echo ""
}

terraform_validate(){
    # local directory=$1
    echo "Validating Terraform Infra"
    terraform validate
    echo ""
}

terraform_plan() {
    # local directory=$1
    echo "Planning Terraform..."
    terraform plan --var-file="./tfvars/terraform.tfvars" -out infra.tfplan
    echo "Terraform Plan created.\n"
}

# Function to apply Terraform
terraform_apply() {
    # local directory=$1
    echo "Applying Terraform..."
    terraform apply infra.tfplan
    echo "Terraform applied.\n"
}

# Function to destroy Terraform
terraform_destroy() {
    # local directory=$1
    echo "Destroying Terraform..."
    terraform destroy --var-file="./tfvars/terraform.tfvars"
    echo "Terraform destroyed.\n"
}

terraform_refresh() {
    # local directory=$1
    echo "Refreshing Terraform..."
    terraform refresh --var-file="./tfvars/terraform.tfvars"
    echo "Terraform refreshed.\n"
}

select_cloud_menu(){
    echo "----------------------------------------------------------------"
    echo "Select cloud provider:"
    echo "1. AWS"
    echo "2. Azure"
    echo "3. GCP"
    echo "----------------------------------------------------------------"
    echo ""
}

# Main script
terraform_operation(){
    # local directory=$1
    while true; do
    display_menu "$provider"
    read -p "Enter your choice [1-6]: " choice

    case $choice in
        1)
            terraform_init
            ;;
        2)
            terraform_plan
            ;;

        3)
            terraform_validate
            ;;
        
        4)
            terraform_apply
            ;;
        5)
            terraform_refresh
            ;;
        6)
            terraform_destroy
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done
}

get_cloud_provider(){
    select_cloud_menu
    read -p "Enter Cloud Choice: " cloud_choice
    case $cloud_choice in
        1)
            provider="aws"
            directory="aws"
            export TF_VAR_HOME=$HOME
            export TF_VAR_token=$vault_token
            ;;
        2)
            provider="azure"
            directory="azure"
            ;;
        *) 
            echo "Invalid Cloud provider"
            exit 1
            ;;
    esac
    echo "Selected provider: $provider"
    echo ""
}

select_action_on_cloud_provider(){
    local directory=$1
    local provider_name=$2

    cd "$directory" || { echo "Failed to change directory to $provider_name"; exit 1; }
    echo "Changed directory to $provider_name: $(pwd)"
    terraform_operation "$provider_name"
}

get_cloud_provider
select_action_on_cloud_provider "$directory" "$provider"





