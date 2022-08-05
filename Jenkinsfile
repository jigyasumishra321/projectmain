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
                    sh 'docker build -t jigyasumishra321/new .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhub')]) {
                   sh 'docker login -u jigyasumishra321 -p ${dockerhub}'

}
                   sh 'docker push jigyasumishra321/new'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
               dir ('/var/lib/jenkins/workspace/project1') {
  
                   sshagent(['kuberneteslogin']) {
                      sh " cd /var/lib/jenkins/workspace/project1 "
                    sh "scp -o StrictHostKeyChecking=no deploymentservice.yaml ubuntu@172.31.13.174:/home/ubuntu"
                    script{
                        try{
                            sh "ssh ubuntu@172.31.13.174 sudo kubectl apply -f ."
                        }catch(error){
                            sh "ssh ubuntu@172.31.13.174 sudo kubectl create -f ."
                        }
                        }
                    }
    
}
                   
                    
                }
            }
            }
        }
  

    
    
