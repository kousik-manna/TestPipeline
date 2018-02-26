
stage("FirstExecution"){
    if(Jenkins.instance.getNode('Win10Master').toComputer().isOnline()){
        node('Win10Master'){
            ws('H:\\For Kousik') {
                // some block
                println "Hi node Win10Master is online"      
                bat 'echo "This is a Batch script" '
                bat 'echo %WORKSPACE%'
                def props = readProperties file:"H:\\GTAF_Framework\\GTAF_SELENIUM_V6.3\\Libraries\\CICD\\report_path.properties"
                def reportFolder =  props['REPORT_FOLDER']
                def htmlReport =  props['HTML_REPORT']
                println "REPORT_FOLDER:: ${reportFolder}"
                println "HTML Report:: ${htmlReport}"
                
                step([$class: 'Publisher', reportFilenamePattern: '**/H:/GTAF_Framework/GTAF_SELENIUM_V6.3/Libraries/CICD/TestNGReport.xml'])
                
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: "${reportFolder}", reportFiles: "${htmlReport}", reportName: 'HTML Report', reportTitles: ''])

            }
        }
    }
}