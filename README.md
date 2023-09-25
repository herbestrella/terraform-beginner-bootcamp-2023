# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)


The general format: 

**MAJOR.MINOR.PATCH**, eg. `1.01`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI Changes.
The Terraform CLI Installation instructions have changed due to gpg keyring changes. So we needed to refere latest documentation

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Refactoring into Bash Scripts

While fixingin the terraform CLI gpg depreciation issues we noticed the installation steps, bash scripts steps were considerable amount more code. Created bash script.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the terraform via Gitpod Task ([.gitpod.yml](.gitpod.yml)) File tidy
- This will allow us an easier debug
- Better portability

### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting started install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following CLI command
```sh
aws sts get-caller-identity
```

If it is successful you should see a json payload return that looks like this

```json
{
    "UserId": "AIDAUQMDDFPYTAAMFN3RH",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::310049450993:user/terraform-beginner-bootcamp"
}
```
=======

env | grep AWS_

### REFERENCES
https://en.wikipedia.org/wiki/Shebang_(Unix)
https://en.wikipedia.org/wiki/Chmod
https://www.gitpod.io/docs/configure/workspaces/tasks

## Terraform Basics

### Terraform Registry

Terraform sources their providers and modules from the Terraform registry which located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow to create resources in Terraform
- **Modules** are a way to make large amounts of terraform code modular, portable, shareable.
- **Providers** make terraform modular

### Terraform Console

We can see a list of all the Terraform commands by simply typing `terraform`

#### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project.


#### Terraform Plan

`terraform plan`

This will generate out changeset, about the state of our infra and what will be changed

We can output this change set ie. "Plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Apply

`terraform apply`

This will run a plan and pass the changeset to be executed by terraform. Apply should prompt yes or no, if you want to automatically approve use auto approve flag ie. `terraform apply --auto-approve`

### Terrafrom Lock Files

`.terraform.locl.hcl` contains the locked versioning for the providers or modules that should be used with this project

The terraform Lock File should be committed to you Version Control System (VSC) eg. Github

### Terraform State Files
`.terraform.tfstate` contains infomrmation about the current state of your infrastructure.

This file **should not be committed** to your VCS.

This file can contain sensitive data.

If you lose this file, you lose knowning the state of your infrastrucutre.

`.terraform.tfstate.backup` is the pervious state file state

### Terraform Directory

`.terraform` director contains binaries of terraform providers
