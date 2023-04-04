pipeline {
   agent any
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '7cd2b139-bf4d-4d6b-94a0-1e0ba41d2ac6', url: 'https://github.com/jigyasumishra321/projectmain.git']])
                
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
                   withCredentials([usernamePassword(credentialsId: 'dockerlogin', passwordVariable: '', usernameVariable: '')]){
                      sh 'docker login -u jigyasumishra321 -p ${dockerlogin}'
    
}
                   sh 'docker push jigyasumishra321/nginx'
                }
            }
        }
       stage('Deploy to k8s'){
            steps{
               dir ('/var/lib/jenkins/workspace/project1') {
  
                   sshagent(['kuberneteslogin']){
                      sh " cd /var/lib/jenkins/workspace/project1 "
                      sh " ls -ltr "
                    sh "scp -o StrictHostKeyChecking=no deploymentservice.yml ubuntu@52.23.230.110:"
                    script{
                        try{
                            sh "ssh ubuntu@52.23.230.110 kubectl apply -f deploymentservice.yml"
                        }catch(error){
                            sh "ssh ubuntu@52.23.230.110 kubectl create -f deploymentservice.yml"
                        }
                        }
                    }
    
}
                   
                    
                }
            }
        
        }
      }
