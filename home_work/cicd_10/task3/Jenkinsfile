pipeline {
    agent any

    stages {
        stage('Checkout role from github') {
            steps {
                checkout scmGit(branches: [[name: '1.2.1']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bova/vector-role/']])
            }
        }
        stage('Run molecule test') {
            steps {
                sh '''molecule test'''
            }
        }
    }
}
