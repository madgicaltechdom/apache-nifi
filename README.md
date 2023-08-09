# Create a Ubuntu 20.04 machine using Terraform Script

This repository contains the necessary files and instructions for deploying an EC2 machine using Terraform Script.

## Prerequisite:

- Install terraform [video](https://www.youtube.com/watch?v=Cn6xYf0QJME&t=8s)
- Setup your AWS account [video](https://www.youtube.com/watch?v=XhW17g73fvY&t=357s)
- Create IAM user with programmatic access  [video](https://www.youtube.com/watch?v=Xx_-IA9qnuI)


## Steps to run this code

Step-by-step user guide [video]().

1. Clone this repository to your local machine:

```
git clone https://github.com/madgicaltechdom/nowigence.git
```

2. Navigate to the nowigence directory.

```
cd nowigence
```

3. Firstly you have to provide your access key value in the variable.tf file.
    
```
variable "access_key" {
  description = "value"
  default     = ""
}
```

4. Secondly, you have to provide your secret key value in the variable.tf file.

```
variable "secret_key" {
  description = "value"
  default     = ""
}
```

5. Make changes in the rest of the variables according to your need in the variable.tf file.

6. Also, have a look at the main.tf file and make changes in the "aws_security_group" resource according to your need.

7. Run `terraform init` to initialize the Terraform project.

6. Run `terraform plan` to see the changes that Terraform will make.

7. Run `terraform apply` to create the Ubuntu machine.

## Clean up

To delete the machine that Terraform created, run `terraform destroy`.
