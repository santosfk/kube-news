pipeline { 
    agent any
    stages {
        stage('build docker image'){
            steps{
                script{
                    dockerapp = docker.build("usantos802/kube-news:${env.BUILD_ID}",'-f ./src/dockerfile ./src')
                }
            }
        }
    }
}
