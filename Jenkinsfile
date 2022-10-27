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
            steps {nexusArtifactUploader artifacts: [[artifactId: 'ssvkart5devops', classifier: '', file: 'target/ssvkart5devops-0.0.4-SNAPSHOT.war', type: 'war']], credentialsId: 'ba2eba7f-17c9-48ca-8c96-60769372b217', groupId: 'com.ssvkart5lab', nexusUrl: '172.20.10.199:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'ssvkart5devops-SNAPSHOT', version: '0.0.4-SNAPSHOT'
            }
        }   

        // Stage4 : Deploying
        stage ('Deploy'){
            steps {
                echo 'deploying....'
                sshPublisher(publishers:
                [sshPublisherDesc(
                    configName: 'ansible-controlplane', 
                    transfers: [
                        sshTransfer(
                            cleanRemote: false, 
                            excludes: '', 
                            execCommand: 'ansible-playbook /opt/playbooks/downloaddeploy.yaml -i /opt/plabooks/hosts', 
                            execTimeout: 120000, 
                            flatten: false, 
                            makeEmptyDirs: false, 
                            noDefaultExcludes: false, 
                            patternSeparator: '[, ]+', 
                            remoteDirectory: '', 
                            remoteDirectorySDF: false, 
                            removePrefix: '', sourceFiles: '')], 
                            usePromotionTimestamp: false, 
                            useWorkspaceInPromotion: false, 
                            verbose: false)]
                            )
                }

            }
        }



    }
