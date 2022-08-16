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
                    sh 'docker build -t jigyasumishra321/new5 .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerlog', variable: 'dockerhub')]) {
                      sh 'docker login -u jigyasumishra321 -p ${dockerhub}'
    
}
                   sh 'docker push jigyasumishra321/new5'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
               dir ('/var/lib/jenkins/projectmain') {
  
                   sshagent(['kuberneteslogin']) {
                      sh " /var/lib/jenkins/projectmain "
                      sh " ls -ltr "
                    sh "scp -i new.pem deploymentservice.yml ubuntu@172.31.25.161:/home/ubuntu"
                    script{
                        try{
                            sh "ssh ubuntu@172.31.25.161 sudo kubectl apply -f ."
                        }catch(error){
                            sh "ssh ubuntu@172.31.25.161 sudo kubectl create -f ."
                        }
                     }
                  }
               }    
             }
           }
        }
      }
