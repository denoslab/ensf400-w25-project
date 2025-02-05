# ENSF 400 - Winter 2025 - Course Project

## Project Overview

In this project, you will work based on a software project by incorporating/extending a complete CI/CD (Continuous Integration/Continuous Deployment) pipeline. This is based on an open-source sample application: https://github.com/7ep/demo

This project can also be any application that requires the project of build, test, and deployment.
You will leverage GitHub for source control, Docker for containerizing your application, and a CI/CD tool (Jenkins) to automate the build, testing, and verification process. The goal is to validate every code change automatically through container builds, unit tests, code quality checks, and end-to-end functional tests.


## Project Requirements

By the end of this project, your group must deliver the following:

1.	Manage your project on GitHub and follow proper Git workflows (branching, pull requests, code reviews). Document the process of how you use Git workflows to collaborate with your team members.

1.	Containerize your application for builds and deployments. Upload and download your container images to a public or private image repository (e.g., Docker Hub or GitHub Container Registry). Ensure a container image is built with unique build tag(s) matching the triggering commit from any branch.

1.	Set up an automated CI/CD with Jenkins in a Codespace environment. Configure the pipeline to trigger upon pull requests merging changes into the main branch.

1.	Document the CI/CD process and provide clear instructions on replicating your environment. Submit a video demo at the end of the project.

### Existing Pipelines
You will also demonstrate the delivery of the following process and artifacts that come with the project.

1.	Run static analysis quality-gating using SonarQube
1.	Performance testing with Jmeter
1.	Security analysis with OWASP's "DependencyCheck"
1.	Build Javadocs


## Evaluation Criteria

Your project will be assessed on the following criteria:

### GitHub Repository & Git Workflow (15%)
1.	Project on GitHub in a public repository with all team members participating in the development and maintenance of the project (5%).
1.	Demonstrate the process practicing Git workflows (branching, pull requests, code reviews) (10%).

### Containerization (20%)
1.	Dockerfile to containerize the project (5%).
1.	Use of container image repository to upload and download images (5%).
1.	Effective tagging mechanism for each building matching the commits/branches/pull requests (10%).

### CI/CD Pipeline Automation (40%)
1.	Jenkins integration with GitHub in Codespace (10%).
1.	Triggering automated checks upon pull request to the main branch (10%).
1.	Deployment process to automatically deploy the application in the Codespace environment upon a build (10%).
1.	Be able to run items 5-8 in **Existing Pipelines** (10%).

### Testing & Code Quality (10%)
1.	Generate test coverage reports upon each automated build (5%).
1.	Generate code quality report using SonarQube reports upon each automated build (5%).

### Documentation & Demo (15%)
1.	Clarity and completeness of README and other documentation. The documentation must demonstrate the team’s collaboration process (5%).
1.	Demonstration video with a length not exceeding 10 minutes, showing a clear understanding of the pipeline and its benefits. The documentation must demonstrate the team’s collaboration process (10%).

