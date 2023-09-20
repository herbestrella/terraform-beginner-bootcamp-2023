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

[]

https://en.wikipedia.org/wiki/Shebang_(Unix)
https://en.wikipedia.org/wiki/Chmod
https://www.gitpod.io/docs/configure/workspaces/tasks