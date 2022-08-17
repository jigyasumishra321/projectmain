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
                    sh 'docker build -t jigyasumishra321/nginx .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerlogin')]) {
                      sh 'docker login -u jigyasumishra321 -p ${dockerlogin}'
    
}
                   sh 'docker push jigyasumishra321/nginx'
                }
            }
        }
       stage('Deploy to k8s'){
            steps{
               dir ('/var/lib/jenkins/workspace/project1') {
  
                   sshagent(['kuberneteslogin']) {
                      sh " cd /var/lib/jenkins/workspace/project1 "
                      sh " ls -ltr "
                    sh "scp -o StrictHostKeyChecking=no deploymentservice.yml ubuntu@54.91.173.1:"
                    script{
                        try{
                            sh "ssh ubuntu@54.91.173.1 sudo kubectl apply -f ."
                        }catch(error){
                            sh "ssh ubuntu@54.91.173.1 sudo kubectl create -f ."
                        }
                        }
                    }
    
}
                   
                    
                }
            }
        
        }
      }
