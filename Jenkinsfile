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
        stage('DEPLOY'){
            node {
                   sshagent (credentials: ['deploy-dev']) {
                   sh 'ssh -o StrictHostKeyChecking=no -l cloudbees 192.168.1.106 uname -a'
  }
}
          }
        }
      }
