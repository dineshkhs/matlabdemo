pipeline {
    agent any 
    stages {
        stage('Build & Test'){
            matrix {
                agent {
                    label 'LINUX'
                }
                
                axes {
                    axis {
                        name 'MATLAB_VERSION'
                        values 'R2020b', 'R2021a'
                    }
                }
                
                tools{
                    matlab "${MATLAB_VERSION}"
                }
                
                stages {
                    stage('Run MATLAB Command') {
                        steps {
                            runMATLABCommand 'buildMEXfiles'
                        }
                    }
                    
                    stage('Run MATLAB Test') {
                        steps {
                            runMATLABTests(testResultsJUnit: 'test-result/result.xml')
                        }
                    }
                }
            }
        }
    }
}
