pipeline {
   agent any
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'gitlog', url: 'https://github.com/jigyasumishra321/projectmain.git']]])
                
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t jigyasumishra321/new2 .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'jigyasumishra321', variable: 'dockerhub')]) {
                      sh 'docker login -u jigyasumishra321 -p ${dockerhub}'
    
}
                   sh 'docker push jigyasumishra321/new2'
                   echo 'Hello'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
               dir ('/var/lib/jenkins/workspace/project1') {
                  sshagent(['eec812d7-eeea-4bbf-89f8-276dec0a62d9']) {
                    sh "scp -o StrictHostKeyChecking=no deploymentservice.yml ubuntu@172.31.25.238:/home/ubuntu"
                     sh "ssh ubuntu@172.31.25.238 sudo kubectl delete -f ."
                    script{
                        try{
                            sh "ssh ubuntu@172.31.25.238 sudo kubectl apply -f ."
                        }catch(error){
                            sh "ssh ubuntu@172.31.25.238 sudo kubectl create -f ."
                        }
                        }
                    }
               }

                   
                    
                }
            }
            }
        }
  

    
    
