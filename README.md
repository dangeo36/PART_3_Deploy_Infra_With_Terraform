# Deploy Infra With Terraform

The goal of this project is to build a secure 3-tier application and deploy to AWS with resusable code (Terraform and Packer). First, we create a custom, golden ami using Packer. The image will be provisioned with all necessary dependencies. This image will be used later once we containerize our application. We'll take a Java Springboot application called PetClinic and containerize it with a Dockerfile. The image will be pushed to Dockerhub and referenced in the final stage. Finally, we use Terrform to provision all our infrastructure; custom VPC, instances, load balancers, SSL certificates, RDS, etc and run our image in it. The application should be secure in a 3-tier architecture.

## Part 3 

For this part of the project, we will be using Terraform to provision all our key infrastructure. We have use a modular structure to create child modules (iam role, internet gateway, nat gateway, application load balancer, private/public subnets, rds, security groups and ACM certificates). These will be referenced in the 'main.tf' file. Key parts of the infrastructure include:

- Public Subnets: for our load balancer
- Private Subnets: these include our private instances (they contain our application)
- Secure Subnets: these are more private subnets that include our database (built off of an RDS instance)
- 2 Availability Zones

We'll also be using Amazon Route 53 for DNS management and ACM for SSL certificates. Our Jenkinsfile will use Terraform to build up all of our resources. 

## Tools / Dependencies 
For this project, I have an Amazon EC2 instance (Ubuntu 20.04, t2.medium) that has Java 17, Jenkins, Terraform, awcli (configured with proper credentials), Maven, and Packer. 

