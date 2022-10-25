pipeline{
    //Directives
    agent any
    tools {
        maven 'maven'
    }

    stages {
        // Specify various stage with in stages

        // stage 1. Build
        stage ('Build'){
            steps {
                sh 'mvn clean install package'
            }
        }

        // Stage2 : Testing
        stage ('Test'){
            steps {
                echo ' testing......'

            }
        }

        //Stage3 : Publsih the artifacts to nexus
        stage ('Pubish to nexus repository'){
            steps {nexusArtifactUploader artifacts: [[artifactId: 'ssvkart5devops', classifier: '', file: 'target/ssvkart5devops-0.0.4-SNAPSHOT.war', type: 'war']], credentialsId: '4076b3ca-f09e-47a1-a82d-32a125623be8', groupId: 'com.ssvkart5lab', nexusUrl: '54.83.151.162:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'ssvkart5devops-SNAPSHOT', version: '0.0.4-SNAPSHOT'
            }
        }   

        // Stage4 : Deploying
        stage ('Deploy'){
            steps {
                echo 'deploying....'
                }

            }
        }



    }
