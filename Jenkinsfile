pipeline {
   agent any
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/jigyasumishra321/projectmain.git']]])
                
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t jigyasumishra321/new4 .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhub')]) {
                      sh 'docker login -u jigyasumishra321 -p ${dockerhub}'
    
}
                   {
                   sh 'docker push jigyasumishra321/new4'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
               dir ('/var/lib/jenkins/workspace/project1') {
  
                   sshagent(['kuberneteslogin']) {
                      sh " cd /var/lib/jenkins/workspace/project1 "
                      sh " ls -ltr "
                    sh "scp -o StrictHostKeyChecking=no deploymentservice.yml ubuntu@192.168.49.2:/home/ubuntu"
                    script{
                        try{
                            sh "ssh ubuntu@192.168.49.2 sudo kubectl apply -f ."
                        }catch(error){
                            sh "ssh ubuntu@192.168.49.2 sudo kubectl create -f ."
                        }
                        }
                    }
    
}
            }               
                    
                }
            }
            }
        }
  

 
