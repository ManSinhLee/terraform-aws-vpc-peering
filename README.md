This project create peering connection between 2 vpc on 2 regions: virginia and oregon

1. config.tf: setup alias for region us-east-1 an us-west-2

2. data.tf: get default data from terraform's aws registry

3. ec2_instances.tf: create create 1 public and 1 private instances on each VPC to test peering connection (PING)

4. elastic_ips.tf: create elastic IPs for nat gateway 

5. igw.tf: create 2 internet gateways and attach to 2 VPCs

6. key_pairs.tf: create key pair on 2 regions with existing public_key

7. network_acl.tf: create network access control list for subnets

8. outputs.tf: show values of resources

9. peer.tf: create peering connection between VPCs

10. route_tables.tf: create tables and add route to peering connection

11. rtb_association.tf: attach route table to subnets

12. security_groups.tf: create security groups

13. variables.tf: create some variable to avoid repeat 

14. vpc.tf: create 2 vpc


Commands to use terraform:
1.  Initialize a new or existing Terraform working directory:
terraform init

2. Generates a speculative execution plan
terraform plan

3. Creates or updates infrastructure according to Terraform configuration files in the current directory
terraform apply

4. show resources:
terraform show

5. delete resources:
terraform destroy

