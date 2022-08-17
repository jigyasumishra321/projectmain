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
                    sh 'docker build -t jigyasumishra321/new6 .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerlogin')]) {
                      sh 'docker login -u jigyasumishra321 -p ${dockerlogin}'
    
}
                   sh 'docker push jigyasumishra321/new6'
                }
            }
        }
        
        }
      }
