# Notes and diagrams of Day01 Video

## What is Infra as a Code
- Provisioning your infra through code

![image](https://github.com/user-attachments/assets/79596c6d-2723-405e-bb12-dad162354987)

## Why do we use Infra as a code?

- When you can do that from the Azure console, login to the portal and create, drag, and drop.
- Why take the pain of writing code for drag and drop?

<img width="727" alt="image" src="https://github.com/user-attachments/assets/fcc61fb6-5327-478a-a08b-b7b633f9d3d2" />


- Let's assume you have to provision the infra to deploy a three-tier application
Time taken: 2 hours

<img width="697" alt="image" src="https://github.com/user-attachments/assets/dcc34d89-8441-4337-8c72-dc73b3c9a3da" />

**it's good for a personal project or when you are learning something**

- What if you are working somewhere in a company and let's say you have 4 environments? Time taken: 8 hours
no big deal? right

<img width="743" alt="image" src="https://github.com/user-attachments/assets/82ce50a2-76e1-4853-92f2-81134cd0ec50" />

- How about 100s of servers to be deployed? Tricky?
That's not it
- To save the cost , decommission every day(not possible) keep running and keep accumulating the cost
- Identical environment, works on my machine
- Automate the provisioning, manage and destroy the infra
- Reliability, efficiency, and security?

<img width="682" alt="image" src="https://github.com/user-attachments/assets/4092b8ea-6a88-4e8e-9fda-cd35425b626e" />


## Benefits of IaaC:
- Consistent environment
- Easy to track cost
- Write once, deploy many (single code base)
- Time saving
- Human error
- Cost saving
- Version control, changes are tracked in git
- Automated cleanup/scheduled destruction
- Easy to set and destroy
- The developer can focus on app development
- Easy to create an identical production environment for troubleshooting


## What is Terraform
IaaC tool that helps do all these tasks

<img width="658" alt="image" src="https://github.com/user-attachments/assets/5f090225-fb4b-4022-bf7e-248343d7d5cb" />


## How it works
Write your terraform files --> Run terraform commands --> Call the target cloud provider API to provision the infra using Terraform Provider

<img width="775" alt="image" src="https://github.com/user-attachments/assets/d75208b8-5a1f-4f18-8743-7fc8930c6106" />

Phases: init --> validate --> plan --> apply --> destroy

## Task for Day02 

### Install Terraform

```bash
https://developer.hashicorp.com/terraform/install
```
### Common Error

```
brew install hashicorp/tap/terraform
Error: No developer tools installed.
Install the Command Line Tools:
  xcode-select --install
```
- Install the code tool for mac --> popup will appear, install using that

### Use below commands

```bash
terraform -install-autocomplete
alias tf=terraform
terraform -version
```