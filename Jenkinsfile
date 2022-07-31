pipeline {
    agent any
    tools{
        maven 'Maven'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/prkFinsol/devopsproject']]])
                bat 'mvn clean install'
            }
        }
                stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t ramkijava/devopsproj .'
                }
            }
        }
        
             stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   bat 'docker login -u javatechie -p ${dockerhubpwd}'

					}
                   bat 'docker push ramkijava/devopsproj'
                }
            }
        }
    }
}