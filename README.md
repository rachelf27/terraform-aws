# Terraform basics using AWS provider

This simple project provisions EC2 instances using Terraform AWS provider.

## Requirements
1. AWS account   
    AWS ACCESS KEY  
    AWS SECRET ACCESS KEY  
    AWS EC2 REGION

2. Install Terraform for your OS

3. IDE   
   I use VS Code. I have the following terraform plugins (Hashicorp Terraform and Terraform autocomplete) installed.

4. Set up AWS CLI by entering the AWS CLI configs.  
   ```
    export AWS_ACCESS_KEY=$AWS_ACCESS_KEY_ID  
    export AWS_SECRET_KEY=$AWS_SECRET_ACCESS_KEY  
    export AWS_EC2_REGION=$AWS_DEFAULT_REGION
    ```

## Usage
- Type `terraform` in the terminal to view all Terraform commands.  
  - To initialize a terraform configuration file (.tf), type `terraform init`  
  - To validate the terraform configuration files and to check syntax, type `terraform validate`
  - To create an execution plan using the configuration files, type `terraform plan`

- To create an instance using a terraform configuration file, add the following to the .tf file.   
  - Create the **aws provider block**. Find help at - https://registry.terraform.io/providers/hashicorp/aws/latest/docs  
  - Create the **EC2 instance resource block**. Find help at - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance    
Copy the *ami* from AWS->Launch instance. 
Use t2.micro as instance_type to keep it ‘free tier’.   
Make sure the *ami* you choose is in the correct region in your code.
    ```
    provider "aws" {
        region = "us-east-1"
    }
 
    resource "aws_instance" "terraform-aws" {
        ami = "ami-0ac43988dfd31ab9a"
        instance_type = "t2.micro"
    }
    ```

- To run the plan you created, type `terraform apply`   
  You can execute terraform apply after initializing, it will create the plan before applying.  
- To view the resources created, type `terraform state list`  
- To make sure you do not get charged with free tier, type `terraform destroy`   
This will terminate/destroy all resources. 
- To terminate a single resource, type `terraform destroy -target=aws_instance.terraform-aws`
- Review in aws console the resource you created has been terminated.

Note: The *ami* must be in the region declared in the provider block. Once a resource has been terminated that *ami id* cannot be reused and *ami* cannot be restarted.
