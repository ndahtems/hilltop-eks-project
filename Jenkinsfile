pipeline{

	agent any

	environment {
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "eu-central-1"
	}
	
	stages {
		stage('Git checkout') {
            		steps {
                		echo 'Cloning project codebase...'
                		git branch: 'main', url: 'https://github.com/ndahtems/hilltop-eks-project.git'
            		}
        	}
	
        stage('Build-Image') {
            steps {
                script {
                    def imageRepoName = 'ndahtems/nodeapp'
                    def imageTag = 'latest'
                    sh "docker build -t ${imageRepoName}:${imageTag} ."
                    sh 'docker images'
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'DOCKER', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    def imageRepoName = 'ndahtems/nodeapp'
                    def imageTag = 'latest'
                    sh "docker push ${imageRepoName}:${imageTag}"
                }
            }
        }
	/*
        stage("Create an EKS Cluster") {
            steps {
                script {
                    // Check if the EKS cluster already exists
                    def eksClusterExists = sh(
                        script: "aws eks describe-cluster --name eks-hilltop --query 'cluster.status' --output text || echo 'NOT_FOUND'",
                        returnStdout: true
                    ).trim()
                    
                    if (eksClusterExists == "NOT_FOUND") {
                        dir('eks') {
                            sh "terraform init -migrate-state"
                            sh "terraform plan"
                        }

                        // Manual approval step before proceeding with the apply
                        input message: 'Do you want to proceed with the EKS cluster creation?', ok: 'Yes, proceed'

                        // Apply Terraform to create the EKS cluster
                        dir('eks') {
                            sh "terraform apply -auto-approve"
                        }
                    } else {
                        echo "EKS cluster already exists. Skipping Terraform apply."
                    }
                }
            }
        }
	
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('deployment') {
                        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY_ID'),
                                         string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                            sh "aws eks update-kubeconfig --name eks-hilltop"
                            sh "kubectl apply -f deploy.yaml"
                            sh "kubectl apply -f service.yaml"
                        }
                    }
                }
            }
        }

        stage("Destroy to EKS Cluster") {
            steps {
                script {
                    dir('eks') {
                            sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
	*/	
    }
}
