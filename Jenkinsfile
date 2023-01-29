pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                 bat '''javac DuplicateInString.java
                    java DuplicateInString'''
            }
        }
    }
}
