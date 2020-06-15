node{
  def app
  
  stage('Clone repository'){
       
       checkout scm
  
  }
  
  stage('Build image'){
  
     app = docker.build("74744556/sample-rails-app")

  }

  stage('Test image'){
   
     app.inside{

         echo "Tests Passed"
     }

  }

  stage('Push image'){


      docker.withRegistry('https://registry.hub.docker.com','docker-hub'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            }
            echo "Trying to push docker build to docker hub"
   }

}
            
