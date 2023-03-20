# multi-tier-aws-Infrastructure
## This is an overview of the multi-tier cloud infrastructure I created. I utilized modular deployment to keep my code clean and readable. I also deployed instances with a load balancer to distribute traffic evenly. To ensure high security, I restricted access to the database-tier, and deployed NGINX and K3(kebernetes) on the my public-tier server for web access.


![This is an image](https://github.com/Calebio/terraform-aws/blob/master/Screenshot_20221205-205353_Udemy.jpg)

## Steps to run
- Initialize the project with `terraform init`
- Use the plan command to see you're about to deploy `terraform plan`
- Apply the planned infrastructure to deploy `terraform apply -auto-approve`
 In a case where you have deployed two Ec2 instances, One becomes the master node while the other supports. When your deployment is up and running use the following steps to deploy the nginx technology within K3.
- ssh into the created instance `ssh -i ~/.<ssh_key_path> <instance_userName>@<instance_public_ip>` <br/>
In my case : `ssh -i ~/.ssh/keyfv ubuntu@54.201.221.70`
- Check for the nodes and pods with the command `kubectl get pods` and `kubectl get nodes` 
- First run the `vim deployment.yml`, use the `:set paste` below to allow you paste your yaml config and then paste the deployment script in the deplyment yml file and then save and exit. 
- Second, apply the configurations in the yml file you just added `kubectl apply -f deployment.yml` and the check the nodes and pods again to be sure of your deployments
- Third, Test your nginx servers. Go to your browser, Use the public ip address from any of the instances just created and try to access the nginx serve on port 8000 eg `35.89.90.146:8000`
- After deploying the nginx on the master node, we can use the load balancer output displayed after terraform apply to access both instances. because we have the load balancer listening on the port 80 and on the port which the K3 is running on.
