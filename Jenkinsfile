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
                script {

                def NexusRepo = Version.endsWith("SNAPSHOT") ? "ssvkart5devops-SNAPSHOT" : "ssvkart5devops-RELEASE"
                    
                nexusArtifactUploader artifacts: 
                [[artifactId: "${ArtifactId}", 
                classifier: '', 
                file: "target/${ArtifactId}-${Version}.war", 
                type: 'war']], 
                credentialsId: '6c54bb93-7408-4960-bebb-ced01939b34a', 
                groupId: "${GroupId}", 
                nexusUrl: '172.20.10.199:8081/', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: "${NexusRepo}", 
                version: "${Version}"
                }
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
