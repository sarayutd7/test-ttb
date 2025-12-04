# Jenkins Pipeline Setup Guide

## Overview
This guide explains how to set up and use the Jenkins pipeline for executing automated test scripts.

## Prerequisites

### 1. Jenkins Installation
- Jenkins 2.0 or higher
- Required Jenkins Plugins:
  - **Pipeline Plugin**
  - **HTML Publisher Plugin** (for test reports)
  - **Robot Framework Plugin** (optional, for better integration)
  - **Email Extension Plugin** (for email notifications)

### 2. Jenkins Plugins Installation
1. Go to Jenkins Dashboard → Manage Jenkins → Manage Plugins
2. Install the following plugins:
   - Pipeline
   - HTML Publisher
   - Robot Framework (optional)
   - Email Extension Plugin

### 3. System Requirements
- Python 3.7 or higher
- pip package manager
- Git installed on Jenkins agent

## Jenkinsfile Structure

The pipeline consists of the following stages:

### Stage 1: Checkout Code From Git
- Checks out the source code from Git repository
- Displays branch name and build information

### Stage 2: Setup Environment
- Verifies Python installation
- Checks pip availability

### Stage 3: Install Dependencies
- Installs required Python packages from `requirements.txt`
- Installs Robot Framework and related libraries

### Stage 4: Run Test Automate
- Executes all test cases in parallel:
  - **Task 1**: Duplicate Items Test
  - **Task 2**: Login Test
  - **Task 3**: API Test
  - **Task 4**: Mobile Test (skipped if Appium not available)

### Stage 5: Merge Test Results
- Merges all test results into a single report
- Creates consolidated HTML reports

### Stage 6: Send Result To Jenkins
- Publishes HTML test reports
- Archives test artifacts
- Publishes Robot Framework results (if plugin installed)

## Setup Instructions

### Option 1: Using Jenkinsfile in Repository

1. **Create Jenkins Pipeline Job:**
   - Go to Jenkins Dashboard → New Item
   - Enter job name (e.g., "Test Automation Pipeline")
   - Select "Pipeline" project type
   - Click OK

2. **Configure Pipeline:**
   - In Pipeline configuration:
     - Definition: Pipeline script from SCM
     - SCM: Git
     - Repository URL: Your Git repository URL
     - Credentials: Add Git credentials if needed
     - Branch: */main (or your default branch)
     - Script Path: `test/Jenkinsfile`

3. **Save and Build:**
   - Click Save
   - Click "Build Now" to trigger the pipeline

### Option 2: Using Simple Jenkinsfile

If you prefer a simpler version, use `Jenkinsfile.simple`:

1. Copy `Jenkinsfile.simple` to `Jenkinsfile`
2. Or update the Script Path in Jenkins to: `test/Jenkinsfile.simple`

### Option 3: Direct Pipeline Script

1. **Create Pipeline Job:**
   - Go to Jenkins Dashboard → New Item
   - Select "Pipeline" project type
   - In Pipeline section:
     - Definition: Pipeline script
     - Copy the content from `Jenkinsfile` into the script area

## Configuration

### Environment Variables

You can configure the following in Jenkins:

- `PYTHON_VERSION`: Python version to use (default: 3.9)
- `ROBOT_RESULTS_DIR`: Directory for test results (default: results)
- `ROBOT_REPORTS_DIR`: Directory for reports (default: reports)

### Email Notifications

To enable email notifications:

1. Configure Email Extension Plugin in Jenkins
2. Set up SMTP server settings
3. Update email recipients in the pipeline's `post` section

### Parallel Execution

The pipeline runs tests in parallel for faster execution. You can modify the `parallel` block in the "Run Test Automate" stage to:
- Run tests sequentially (remove `parallel` block)
- Adjust parallel execution based on agent capacity

## Viewing Results

### Test Reports
1. After pipeline execution, go to the build page
2. Click on "Robot Framework Test Report" link
3. View detailed test results, logs, and reports

### Build Artifacts
1. On the build page, click "Artifacts"
2. Download test result files (XML, HTML, logs)

### Console Output
1. Click "Console Output" to see detailed execution logs
2. Check for any errors or warnings

## Troubleshooting

### Common Issues

1. **Python Not Found**
   - Ensure Python is installed on Jenkins agent
   - Add Python to PATH environment variable
   - Or specify full path to Python in pipeline

2. **Dependencies Installation Failed**
   - Check internet connectivity
   - Verify pip is working: `pip --version`
   - Try installing dependencies manually first

3. **Tests Fail to Execute**
   - Check workspace path is correct
   - Verify test files exist in `test/testcases/`
   - Check file permissions

4. **Reports Not Published**
   - Verify HTML Publisher Plugin is installed
   - Check report file paths are correct
   - Ensure reports are generated before publishing

5. **Git Checkout Failed**
   - Verify Git credentials are correct
   - Check repository URL is accessible
   - Ensure branch name exists

### Debug Mode

To debug the pipeline:

1. Add more `echo` statements in stages
2. Use `sh 'set -x'` to enable shell debugging
3. Check Jenkins console output for detailed logs

## Advanced Configuration

### Custom Agent

To use a specific Jenkins agent:

```groovy
pipeline {
    agent {
        label 'your-agent-label'
    }
    // ... rest of pipeline
}
```

### Scheduled Builds

Add build triggers in Jenkins job configuration:
- Build periodically: `H 2 * * *` (daily at 2 AM)
- Poll SCM: `H/15 * * * *` (every 15 minutes)

### Build Parameters

Add parameters for flexible execution:

```groovy
parameters {
    choice(name: 'TEST_SUITE', choices: ['all', 'task1', 'task2', 'task3', 'task4'], description: 'Select test suite')
    booleanParam(name: 'SKIP_MOBILE', defaultValue: false, description: 'Skip mobile tests')
}
```

## Best Practices

1. **Version Control**: Always commit Jenkinsfile to Git
2. **Branch Strategy**: Use different Jenkinsfiles for different branches if needed
3. **Artifact Retention**: Configure artifact retention policy
4. **Notifications**: Set up proper email/Slack notifications
5. **Security**: Use Jenkins credentials for sensitive information
6. **Monitoring**: Set up build monitoring and alerts

## Example Pipeline Execution

```
Started by user Admin
[Pipeline] Checkout Code From Git
[Pipeline] Setup Environment
[Pipeline] Install Dependencies
[Pipeline] Run Test Automate (Parallel)
  [Pipeline] Task 1 - Duplicate Items Test
  [Pipeline] Task 2 - Login Test
  [Pipeline] Task 3 - API Test
  [Pipeline] Task 4 - Mobile Test
[Pipeline] Merge Test Results
[Pipeline] Send Result To Jenkins
[Pipeline] Post Actions
Finished: SUCCESS
```

## Support

For issues or questions:
1. Check Jenkins console output
2. Review test logs in results directory
3. Verify all prerequisites are met
4. Check Jenkins plugin versions

