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
                bat """cd C:\\Users\\aykabz\\Desktop\\test\\tests
                robot  -d C:\\Users\\aykabz\\Desktop\\test\\tests\\output .
                """.stripIndent().trim()
            }
            post {
        	always {
		        script {
		          step(
			            [
			              $class              : 'RobotPublisher',
			              outputPath          : 'C:\\Users\\aykabz\\Desktop\\test\\tests\\output',
			              outputFileName      : '**/output.xml',
			              reportFileName      : '**/report.html',
			              logFileName         : '**/log.html',
			              disableArchiveOutput: false,
			              passThreshold       : 50,
			              unstableThreshold   : 40,
			              otherFiles          : "**/*.png,**/*.jpg",
			            ]
		          	)
		        }
	  		}		
	    }
        }
    }
}
