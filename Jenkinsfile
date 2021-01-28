node{
    stage('GIT Checkout'){
        git credentialsId: 'GIT-Creds', url: 'https://github.com/pradeeshgs01/maven-web-application.git'
    }
    stage('maven package'){
        def mvnHOME = tool name: 'Maven', type: 'maven'
        def mvnCMD = "${mvnHOME}/bin/mvn"
        sh "${mvnCMD} clean package"
    }
    stage ('Docker image creation'){
        sh 'sudo -S docker build -t pradeesh9312/mynewimage:1 -f Dockerfile .'
    }
    stage ('Pushing to DockerHub'){
        withCredentials([string(credentialsId: 'dockerhubpw', variable: 'DockerhubPwd')]) {
      sh "sudo docker login -u pradeesh9312 -p ${DockerhubPwd}"
     }
     sh 'sudo docker push pradeesh9312/mynewimage:1 '
    }
    stage ('Run container on Deploy server'){
        def dockerRun = 'sudo docker run -d -p 8090:80 --name apache2container pradeesh9312/mynewimage:1'
        sshagent(['Deploy-Server']) {
         sh "ssh -o StrictHostKeyChecking=no ubuntu@35.154.133.59 ${dockerRun}"
}
    }
}
