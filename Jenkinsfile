pipeline{
    //Directives
    agent any
    tools {
        maven 'maven'
    }
    environment{
        ArtifactId = readMavenPom().getArtifactId()
        Version = readMavenPom().getVersion()
        Name = readMavenPom().getName()
        GroupId = readMavenPom().getGroupId()
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
            steps {
                nexusArtifactUploader artifacts: 
                [[artifactId: 'ssvkart5devops', 
                classifier: '', 
                file: 'target/ssvkart5devops-0.0.4-SNAPSHOT.war', 
                type: 'war']], 
                credentialsId: '6c54bb93-7408-4960-bebb-ced01939b34a', 
                groupId: 'com.ssvkart5lab', 
                nexusUrl: '54.210.226.174:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'ssvkart5devopslab-SNAPSHOT', 
                version: '0.0.4-SNAPSHOT'
            }
        }   

        // Stage4 : Print information about env variables
        stage ('Print environment variables to check artifacts'){
            steps {
                echo "Artifact ID is '${ArtifactId}'"
                echo "Version is '${Version}'"
                echo "Name is '${Name}'"
                echo "Group ID is '${GroupId}'"
            }
        }

        // Stage5 : Deploying
        stage ('Deploy'){
            steps {
                echo 'deploying....'
                }

            }
        }



    }
