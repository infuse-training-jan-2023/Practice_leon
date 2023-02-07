pipeline {
    agent jenkins-slave-Leon
    stages {
        stage('Compile') { 
            steps {
                 bat '''javac DuplicateInString.java'''
                    
            }
        }
        stage('Build') { 
            steps {
                 bat '''java DuplicateInString'''
            }
        }
    }
}
