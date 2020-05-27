pipeline{

    agent any

    stages{
        stage("test"){
            steps{
                echo "test"
            }
        }
        stage("test2"){
            steps{
                bat 'cd C:\\Users\\aykabz\\Desktop\\test\\tests'
                bat 'robot  -d C:\\Users\\aykabz\\Desktop\\test\\tests\\output .'
                
            }
        }
    }
}
