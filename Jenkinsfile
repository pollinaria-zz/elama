
node{
    try{
        timestamps {
            cleanWs deleteDirs: true 
          
              dir('src') {
                  dir('github.com') {
                      dir('pollinaria') {
                          dir('elama') {
                            stage('Pull configuration Data from repository') {
                              
                              git branch: 'master', credentialsId: '985a1ca5-987a-4613-b9ae-94137c77f08f', url: 'https://github.com/pollinaria/elama'
                            }

                            stage('Build image') {
                                
                              def appImage = docker.build("pollinaria/elama-test")
                              appImage.push()

                            }

                            stage('Run image on app') {

                             sh 'ssh -i /tmp/elama-test.pem ubuntu@13.58.18.235 "sudo docker stop app"'
                             sh 'ssh -i /tmp/elama-test.pem ubuntu@13.58.18.235 "sudo docker rm app"'
                             sh 'ssh -i /tmp/elama-test.pem ubuntu@13.58.18.235 "sudo docker run -d --name app -p 80:80 pollinaria/elama-test tail -f /dev/null"'

                            }

                        }
                    }
                }
            }
        }

      }
    catch (error) {
        archiveArtifacts '**'
        error "Failed"
    }
    cleanWs deleteDirs: true
}
