
stage("Executing On Online Node"){
    if(Jenkins.instance.getNode('Win10Master').toComputer().isOnline()){
        node('Win10Master'){
			stage("Custom WorkSpace"){
				ws('H:\\For Kousik') {
					// some block
					println "Hi node Win10Master is online"      
					stage("Batch Execution"){
						bat 'echo "This is a Batch script" '
						bat 'echo %WORKSPACE%'
					}
					
					stage("Read Properties"){
						def props = readProperties file:"H:\\GTAF_Framework\\GTAF_SELENIUM_V6.3\\Libraries\\CICD\\report_path.properties"
						reportFolder =  props['REPORT_FOLDER']
						htmlReport =  props['HTML_REPORT']
						println "REPORT_FOLDER:: ${reportFolder}"
						println "HTML Report:: ${htmlReport}"
					}
					
					stage("Publish TestNGReport"){
						step([$class: 'Publisher', reportFilenamePattern: '**/H:/GTAF_Framework/GTAF_SELENIUM_V6.3/Libraries/CICD/TestNGReport.xml'])
					}
					
					stage("Publish HTML_REPORT"){
						publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: "${reportFolder}", reportFiles: "${htmlReport}", reportName: 'HTML Report', reportTitles: ''])
					}

				}
			}
		}
    }
}