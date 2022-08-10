pipeline {
   agent any
    stages{
        stage('Build'){
            steps{
               script{
                sh 'git clone https://github.com/jigyasumishra321/projectmain.git'
                }
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t jigyasumishra321/new3 .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhub1')]) {
                      sh 'docker login -u jigyasumishra321 -p ${dockerhub1}'
    
}
                   sh 'docker push jigyasumishra321/new3'
                   echo 'Hello'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
               dir ('/var/lib/jenkins/workspace/project1') {
                   script{
                      {
                    sh "scp -i jenkins.pem deploymentservice.yml ubuntu@54.91.43.23:/home/ubuntu"
                     sh "ssh ubuntu@54.91.43.23 sudo kubectl delete -f ."
                      }
                    script{
                        try{
                            sh "ssh ubuntu@54.91.43.23 sudo kubectl apply -f ."
                        }catch(error){
                            sh "ssh ubuntu@54.91.43.23 sudo kubectl create -f ."
                        }
                        }
                    }
               }

                   
                    
                }
            }
            }
        }
  

    
    
