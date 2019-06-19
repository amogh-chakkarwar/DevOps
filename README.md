# Building ASP.NET app using AZURE pipeline and deploying on AWS using CodeDeploy

### AWS CloudFormation
![CloudFormation](https://amoghdata351256.s3.amazonaws.com/AWS+Cloud+Formation.JPG)

## Build/Deploy Instructions
1. Git clone the DevOps Repository 
2. Make changes to the code
3. Push updated code to the master branch - That's all the steps you have to do
4. Azure pipeline build is triggered with the updated code
5. Updated code is published and put it in a folder
6. All the required PowerShell scripts are added to that folder
7. The folder is then uploaded to a specific S3 bucket on AWS
8. The CodeDeploy on AWS is triggered and the new build is deployed on the instance
9. Once the Deploy is successful refresh the browser
10. The new site is up and running
