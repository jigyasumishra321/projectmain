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
                    sh 'docker build -t jigyasumishra321/new1 .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhub')]) {
                      sh 'docker login -u jigyasumishra321 -p ${dockerhub}'
    
}
                   sh 'docker push jigyasumishra321/new1'
                   echo 'Hello'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
               dir ('/var/lib/jenkins/workspace/project1') {
  
                   sshagent(['kuberneteslogins']) {
                      sh " cd /var/lib/jenkins/workspace/project1 "
                      sh " ls -ltr "
                      sh "kubernetesDeploy configs: '', credentialsType: 'Text', enableConfigSubstitution: false, kubeConfig: [path: '/home/ubuntu/.kube'], kubeconfigId: '', secretName: '', ssh: [sshCredentialsId: 'kube123', sshServer: 'https://192.168.49.2:8443'], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']"
                    sh "scp -i deploymentservice.yml ubuntu@192.168.49.2:/home/ubuntu"
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
  

    
    
