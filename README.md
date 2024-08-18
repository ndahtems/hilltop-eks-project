# Steps TO DEPLOY THE APPLICATION

1. Clone the Repository to your local
```sh
git clone <RepoURL>
```
2. Initialize terrraform to create instance and deploy jenkins
```sh
cd jenkins
```
```sh
terraform init
terraform apply --auto-approve
```
+ The terraform script will deploy and EC2 instance and the jenkins.sh script will run as userdata to bootstrap the server
3. Copy the instance Public IP  and access jenkins on the browser
```sh
http://<public>:8080
```
4. Copy the jenkins token and login to the jenkins server
5. Go to manage jenkins and create project and either use a jenkins file of a pipeline syntax
6. The pipeline will clone the repo
7. In the current directory, run a docker build in the pipeline
8. Docker login into the repo and push the image to the DockerHub
9. cd into the eks, use terraform to create the cluster
10. in the directory, run kubectl apply -f deployment/
11. copy the url of the loadbalancer created on aws and access the aplication.