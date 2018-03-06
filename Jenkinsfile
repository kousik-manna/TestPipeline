
import java.nio.file.Files
import java.nio.file.Paths

stage("Executing On Online Node"){
    if(Jenkins.instance.getNode('Win10Master').toComputer().isOnline()){
        node('Win10Master'){
            
			stage("Custom WorkSpace"){
				ws('H:\\For Kousik') {
					// some block
					println "Hi node Win10Master is online"      
					
					stage('merge xml') {
                        def antVersion = 'Ant1.10.1'
                        withEnv( ["ANT_HOME=${tool antVersion}"] ) {
                            bat '%ANT_HOME%/bin/ant.bat merge-results'
                        }
                    }

					
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
					
					stage("Copy Files"){
					    
					    String sourceFilePath1 = "H:\\For Kousik\\Report1\\AllModulesMainAutomatedTestResultIE02_26_20183_34_05PM.html"
                        String destinationFilePath1 = "H:\\For Kousik\\FinalReport\\AllModulesMainAutomatedTestResultIE02_26_20183_34_05PM.html"
                        (new AntBuilder()).copy(file: sourceFilePath1, tofile: destinationFilePath1)

					    String sourceFilePath2 = "H:\\For Kousik\\Report2\\AllModulesMainAutomatedTestResultMozilla02_20_20184_02_24PM.html"
                        String destinationFilePath2 = "H:\\For Kousik\\FinalReport\\AllModulesMainAutomatedTestResultMozilla02_20_20184_02_24PM.html"
                        (new AntBuilder()).copy(file: sourceFilePath2, tofile: destinationFilePath2)
					    
					    
					    //Files.copy(Paths.get(), Paths.get())
					}
					
					stage("unstash Result"){
					    println("UnStashing")
					    //stash includes: 'Report\\AllModulesMainAutomatedTestResultIE02_26_20183_34_05PM.html,Report\\AllModulesMainAutomatedTestResultMozilla02_20_20184_02_24PM.html', name: 'TestResult'
					    //stash includes: 'Report\\AllModulesMainAutomatedTestResultIE02_26_20183_34_05PM.html', name: 'TestResult'    
                        
                        dir('FinalReport') {
                            //unstash 'TestResult'
                            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'AllModulesMainAutomatedTestResultIE02_26_20183_34_05PM.html,AllModulesMainAutomatedTestResultMozilla02_20_20184_02_24PM.html', reportName: 'HTML Report', reportTitles: ''])
                        }
					}
					
					stage("Publish TestNGReport"){
						//step([$class: 'Publisher', reportFilenamePattern: '**/H:/GTAF_Framework/GTAF_SELENIUM_V6.3/Libraries/CICD/TestNGReport.xml'])
						step([$class: 'Publisher', reportFilenamePattern: '**/H:/For Kousik/Report/testng-merge.xml'])
					}
					
					stage("Publish HTML_REPORT"){
						//publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: "${reportFolder}", reportFiles: "${htmlReport}", reportName: 'HTML Report', reportTitles: ''])
						
					}

                    stage('Send email') {
                        def mailRecipients = "Kousik.Manna@cognizant.com"
                        def jobName = currentBuild.fullDisplayName
                        println "${jobName}"
                        //emailext body: '''${SCRIPT, template="groovy-html.template"}''',
                        //emailext body: '''${FILE,path="FinalReport/AllModulesMainAutomatedTestResultIE02_26_20183_34_05PM.html"}''',
                        //mimeType: 'text/html',
                        //subject: "[Jenkins] ${jobName}",
                        //to: "${mailRecipients}",
                        //replyTo: "${mailRecipients}",
                        //recipientProviders: [[$class: 'CulpritsRecipientProvider']]
                    }

				}
			}
			
		}
    }
}