pipeline {
    agent any
    
    environment {
        PYTHON_VERSION = '3.9'
        ROBOT_RESULTS_DIR = 'results'
        ROBOT_REPORTS_DIR = 'reports'
    }
    
    stages {
        stage('Checkout Code From Git') {
            steps {
                echo 'Checking out code from Git repository...'
                checkout scm
                
                script {
                    echo "Branch: ${env.BRANCH_NAME}"
                    echo "Build Number: ${env.BUILD_NUMBER}"
                    echo "Workspace: ${env.WORKSPACE}"
                }
            }
        }
        
        stage('Setup Environment') {
            steps {
                echo 'Setting up Python environment...'
                script {
                    sh '''
                        python3 --version || python --version
                        pip3 --version || pip --version
                    '''
                }
            }
        }
        
        stage('Install Dependencies') {
            steps {
                echo 'Installing Python dependencies...'
                script {
                    sh '''
                        cd ${WORKSPACE}/test
                        pip3 install -r requirements.txt || pip install -r requirements.txt
                        pip3 install robotframework || pip install robotframework
                        pip3 install robotframework-seleniumlibrary || pip install robotframework-seleniumlibrary
                        pip3 install robotframework-requests || pip install robotframework-requests
                        pip3 install robotframework-appiumlibrary || pip install robotframework-appiumlibrary
                    '''
                }
            }
        }
        
        stage('Run Test Automate') {
            parallel {
                stage('Task 1 - Duplicate Items Test') {
                    steps {
                        echo 'Running Task 1: Duplicate Items Test...'
                        script {
                            sh '''
                                cd ${WORKSPACE}/test
                                robot -d ${ROBOT_RESULTS_DIR}/task1 \
                                      --log task1_log.html \
                                      --report task1_report.html \
                                      --output task1_output.xml \
                                      testcases/task1_duplicate_items.robot || true
                            '''
                        }
                    }
                }
                
                stage('Task 2 - Login Test') {
                    steps {
                        echo 'Running Task 2: Login Test...'
                        script {
                            sh '''
                                cd ${WORKSPACE}/test
                                robot -d ${ROBOT_RESULTS_DIR}/task2 \
                                      --log task2_log.html \
                                      --report task2_report.html \
                                      --output task2_output.xml \
                                      testcases/task2_login_test.robot || true
                            '''
                        }
                    }
                }
                
                stage('Task 3 - API Test') {
                    steps {
                        echo 'Running Task 3: API Test...'
                        script {
                            sh '''
                                cd ${WORKSPACE}/test
                                robot -d ${ROBOT_RESULTS_DIR}/task3 \
                                      --log task3_log.html \
                                      --report task3_report.html \
                                      --output task3_output.xml \
                                      testcases/task3_api_test.robot || true
                            '''
                        }
                    }
                }
                
                stage('Task 4 - Mobile Test') {
                    steps {
                        echo 'Running Task 4: Mobile Test...'
                        script {
                            sh '''
                                cd ${WORKSPACE}/test
                                # Skip mobile tests if Appium is not available
                                if command -v appium &> /dev/null; then
                                    robot -d ${ROBOT_RESULTS_DIR}/task4 \
                                          --log task4_log.html \
                                          --report task4_report.html \
                                          --output task4_output.xml \
                                          testcases/task4_mobile_test.robot || true
                                else
                                    echo "Appium not found. Skipping mobile tests."
                                fi
                            '''
                        }
                    }
                }
            }
        }
        
        stage('Merge Test Results') {
            steps {
                echo 'Merging all test results...'
                script {
                    sh '''
                        cd ${WORKSPACE}/test
                        mkdir -p ${ROBOT_RESULTS_DIR}/merged
                        rebot --outputdir ${ROBOT_RESULTS_DIR}/merged \
                              --output merged_output.xml \
                              --log merged_log.html \
                              --report merged_report.html \
                              ${ROBOT_RESULTS_DIR}/task1/task1_output.xml \
                              ${ROBOT_RESULTS_DIR}/task2/task2_output.xml \
                              ${ROBOT_RESULTS_DIR}/task3/task3_output.xml \
                              ${ROBOT_RESULTS_DIR}/task4/task4_output.xml || true
                    '''
                }
            }
        }
        
        stage('Send Result To Jenkins') {
            steps {
                echo 'Publishing test results to Jenkins...'
                script {
                    // Publish Robot Framework results
                    publishHTML([
                        reportName: 'Robot Framework Test Report',
                        reportDir: 'test/results/merged',
                        reportFiles: 'merged_report.html',
                        keepAll: true,
                        alwaysLinkToLastBuild: true
                    ])
                    
                    // Archive test results
                    archiveArtifacts artifacts: 'test/results/**/*', allowEmptyArchive: true
                    
                    // Publish test results (if Robot Framework plugin is installed)
                    step([
                        $class: 'RobotPublisher',
                        outputPath: 'test/results/merged',
                        outputFileName: 'merged_output.xml',
                        reportFileName: 'merged_report.html',
                        logFileName: 'merged_log.html',
                        passThreshold: 80.0,
                        unstableThreshold: 60.0,
                        otherFiles: '',
                        onlyCritical: false
                    ])
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline execution completed.'
            script {
                sh '''
                    cd ${WORKSPACE}/test
                    echo "=== Test Results Summary ==="
                    if [ -f ${ROBOT_RESULTS_DIR}/merged/merged_output.xml ]; then
                        echo "Merged results available at: ${ROBOT_RESULTS_DIR}/merged/"
                    fi
                    echo "Individual test results:"
                    ls -la ${ROBOT_RESULTS_DIR}/*/ || true
                '''
            }
        }
        
        success {
            echo 'All tests passed successfully!'
            emailext (
                subject: "SUCCESS: Jenkins Pipeline - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "Build successful!\n\nJob: ${env.JOB_NAME}\nBuild: ${env.BUILD_NUMBER}\nURL: ${env.BUILD_URL}",
                to: "${env.CHANGE_AUTHOR_EMAIL}"
            )
        }
        
        failure {
            echo 'Pipeline failed!'
            emailext (
                subject: "FAILURE: Jenkins Pipeline - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "Build failed!\n\nJob: ${env.JOB_NAME}\nBuild: ${env.BUILD_NUMBER}\nURL: ${env.BUILD_URL}\n\nPlease check the console output for details.",
                to: "${env.CHANGE_AUTHOR_EMAIL}"
            )
        }
        
        unstable {
            echo 'Pipeline is unstable!'
        }
    }
}

