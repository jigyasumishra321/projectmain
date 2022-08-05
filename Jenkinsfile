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
                script{
                   kubernetesDeploy configs: '/home/ubuntu/.kube/config', kubeConfig: [path: ''], kubeconfigId: 'ad242d5b-33f9-4b48-a83e-fa1412d9b8c2', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            
            }
        }
    }
}
    
    
