pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                echo  "stage name: $env.STAGE_NAME" 
            }
        }
        stage('Test') { 
            steps {
                  echo  "stage name: $env.STAGE_NAME" 

            }
        }
       
    }
}