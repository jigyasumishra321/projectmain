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
        stage("DEPLOY"){
            steps {
               dir ('/var/lib/jenkins/project2') {
                  script {
                    sh """
                    #!/bin/bash
                    scp -i new.pem deploymentservice.yml ubuntu@54.242.234.124:/home/ubuntu
                    """
                }
              }
            }
          }
        }
      }
