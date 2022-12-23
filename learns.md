## Here I write about things that caught my interest or things I should remember

The resource block below will be explained

``` 
resource "aws_lb_target_group" "fv_tg" {
  name     = "fv-lb-tg${substr(uuid(), 0, 3)}" 
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
  lifecycle {
    ignore_changes = [name] 
  }
  health_check {
    healthy_threshold   = var.lb_healthy_threshold
    unhealthy_threshold = var.lb_unhealthy_threshold
    timeout             = var.lb_timeout
    interval            = var.lb_interval
  }
}
```
For the name line, substr and uuid adds random strings to the name but the downside that everytime you run a terraform apply to the name is changed automatically and that can affect every instance in this target group so the solution here is to add the l`ifecycle` block and use the `ignore_changes` to specify what change should be ignored.

- Create an ssh key with `ssh-keygen -t rsa` the key type is rsa

- cause of error?
- Possible solutions
  - `terraform plan -lock=false`
  - `terraform force-unlock -force <Lock ID from the error message>`


- ssh into an instance in the cloud syntax : <br/>
`ssh -i ~/<ssh_key_path> <instance_userName>@<instance_public_ip>` <br/>
In my case : `ssh -i ~/.ssh/keyfv ubuntu@54.201.221.70`

## Nginx deploy and test
Afer deploying the k3 and ssh into the instance, below are the steps to set up the Nginx.
Check for the nodes and pods with the command `kubectl get pods` and `kubectl get nodes`
- First run the `vim deployment.yml` and paste the deployment script in the deplyment yml file and then save and exit. 
- Second, apply the configurations in the yml file you just added `kubectl apply -f deployment.yml` and the check the nodes and pods again to be sure of your deployments

- Third, Test your nginx servers. Go to your browser, Use the public ip address from any of the instances just created and try to access the nginx serve on port 8000 eg `35.89.90.146:8000`

## Add EC2 instances to a target group

after adding the ec2 instances to a target group and deployment is successful, we try to test by using the load balancer dns name to and the port of with the target group is listening on e.g my listener is listening on port 80 so the web address looks like this. `fv-loadbalancer-636613368.us-west-2.elb.amazonaws.com:80` 

