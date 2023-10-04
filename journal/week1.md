# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT/
│
├── main.tf                # everything else
├── variables.tf           # stores the structure of input variables
├── terraform.tfvars       # the data of variables we want to load into our terraform project
├── providers.tf           # defines required providers and their configuration
├── outputs.tf             # stores our outputs
└── README.md              # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform Input Variables
## Terraform Cloud Variables

In terraform we can set two kinds of variables:
- Environment Variables - those that you would set in your bash terminal eg. AWS creds
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not show visbiliy in the UI

### Loading Terraform Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my-user-uuid"`

### var-file flag

- TODO: research this flag

### terraform.tfvars

This is the defrault file to load in terraform variables in bulk

- TODO: document this functionality for terraform cloud

### order of terraform variables

- TODO: document which terraform variables take precedence

## Terraform Import

### Dealing with Configuration Drift

## What happens if we lose our state file

If you lose your statefile you most likely will have to tear down all your cloud infrastructure manually

You can use terraform port but it won't for all cloud resources. You need to check terraform providers documentation for which resources support
### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/language/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration 

If someone goes and delete or modifies cloud resources manually through "ClickOps"

If we run terraform plan again it will attempt to put our infrastructure back into the expected state fixing configuarion drift