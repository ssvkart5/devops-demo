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

        // Stage3 : Publish the artifacts to Nexus
        stage ('Publish to Nexus'){
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'ssvkart5devops', classifier: '', file: 'target/ssvkart5devopslab-0.0.4-SNAPSHOT.war', type: 'war']], credentialsId: '29bf5e32-04e3-476c-b9fc-4bbcdf202a86', groupId: 'com.ssvkart5lab', nexusUrl: '54.198.115.76:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'ssvkart5devopslab-SNAPSHOT', version: '0.0.4-SNAPSHOT'

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
