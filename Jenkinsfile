pipeline { 
  environment { 
    registry = 'ryjel01/project1' 
    registryCredential = 'MyDockerHubID' 
    dockerImage = '' 
  } 
  agent any 
  stages { 
    stage ("Clone Git Project") { 
      steps { 
        git url: 'https://github.com/ryjel01/project1.git' 
      } 
    } 
    stage ("Build and test code project") { 
     steps { 
        sh 'pwd' 
        sh 'ls -l'
        sh 'cat Readme.txt'
        sh 'java -version' 
        sh 'javac HelloJava.java' 
        sh 'java HelloJava' 
      } 
    } 
    stage ("Building image") { 
        steps{ 
            script { 
                dockerImage = docker.build registry + ":b$BUILD_NUMBER" 
            } 
        } 
    } 
    stage ("Deploy Image") { 
        steps { 
            script { 
                docker.withRegistry( '', registryCredential ) { 
                    dockerImage.push() 
                } 
            } 
        } 
    } 
  } 
}
