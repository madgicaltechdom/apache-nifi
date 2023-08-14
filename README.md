# Create a Ubuntu 20.04 machine using Terraform Script

This repository contains the necessary files and instructions for deploying an EC2 machine using Terraform Script.

## Prerequisite:

- Install terraform [video](https://www.youtube.com/watch?v=Cn6xYf0QJME&t=8s)
- Setup your AWS account [video](https://www.youtube.com/watch?v=XhW17g73fvY&t=357s)
- Create IAM user with programmatic access  [video](https://www.youtube.com/watch?v=Xx_-IA9qnuI)


## Steps to run this code

Step-by-step user guide [video](https://drive.google.com/file/d/1fRf1p3izDl-JJuWF7npu99SSbUkXNFl2/view?usp=drive_link).

1. Clone this repository to your local machine:

```
git clone https://github.com/madgicaltechdom/nowigence.git
```

2. Navigate to the nowigence directory.

```
cd nowigence
```

3. Firstly you have to provide your access key value in the variable.tf file.
    
```
variable "access_key" {
  description = "value"
  default     = ""
}
```

4. Secondly, you have to provide your secret key value in the variable.tf file.

```
variable "secret_key" {
  description = "value"
  default     = ""
}
```

5. Make changes in the rest of the variables according to your need in the variable.tf file.

6. Also, have a look at the main.tf file and make changes in the "aws_security_group" resource according to your need.

7. Run `terraform init` to initialize the Terraform project.

8. Run `terraform plan` to see the changes that Terraform will make.

9. Run `terraform apply` to create the Ubuntu machine.

10. Connect to the VMs using the SSH key.

```
ssh -i <private key path> user_name@public_ip
```

## Clean up

To delete the machine that Terraform created, run `terraform destroy`.

# How to install and set up the Nifi

By following the below steps you can able to install and set up the Nifi.

## Prerequisite:

- Ubuntu machine with root access, 22 and 8080 ports.
- You should have sudo or root access to run privileged commands.
- You should have OpenJDK 11 installed on your Server.
- You should have apt or apt-get, wget, and unzip utility installed in your Server.

1. SSH to the Ubuntu machine by running the below command and switch to the root user:

```
ssh -i <private key path> user_name@public_ip
```

2. Update your server by running the below command:
   
```
apt update
```

3. Download Apache [Nifi 1.23.0](https://archive.apache.org/dist/nifi/) using wget by running the below command:

```
wget https://archive.apache.org/dist/nifi/1.23.0/nifi-1.23.0-bin.zip
```

4. Unzip the folder using unzip utility by running the below command:

```
unzip nifi-1.23.0-bin.zip
```

5. Set the JAVA_HOME path by running the below command:

```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
```
If you don't have the JAVA_HOME environment variable set, then you need to set it with the OpenJDK path. In my setup, it is on /usr/lib/jvm/java-11-openjdk-amd64/.

6. Verify the path by running the below command:

```
echo $JAVA_HOME
```

7. Navigate to the nifi-1.23.0/conf/ directory, open the nifi.properties file, search for the "web properties", and make changes in the port and host by running the below command(I am using Vim editor).

```
cd nifi-1.23.0/conf/
vi nifi.properties
```

![image](https://github.com/madgicaltechdom/nowigence/assets/101810595/9188dc5b-b3a5-4e29-9e77-85c276aaf70b)

8. Set the Nifi single-user credentials by running the below command:

```
./nifi.sh set-single-user-credentials <username> <password>
```
  
9. Navigate to the nifi-1.23.0/bin/ directory and start Apache Nifi by running the below command:

```
cd nifi-1.23.0/bin/
./nifi.sh start
```

10. Check the status of Nifi by running the below command:

```
./nifi.sh status
```

![image](https://github.com/madgicaltechdom/nowigence/assets/101810595/e6372731-4c2b-466b-b808-03864d3b3a68)

11. Now, browse this URL: https://<YOUR_MACHINE_IP>:8080/nifi you can see the Nifi login page, then provide the user credentials that you created in the 8th step for login.

![image](https://github.com/madgicaltechdom/nowigence/assets/101810595/56de79cc-5c67-45d8-8244-5e442ffa7a22)

![image](https://github.com/madgicaltechdom/nowigence/assets/101810595/edf6478e-df80-408b-a88a-e7f3b441ce28)

# How to install and set up the Nifi registry

By following the below steps you can able to install and set up the Nifi registry.

## Prerequisite:

- Ubuntu machine with root access, 22 and 18080 ports.
- You should have sudo or root access to run privileged commands.
- You should have OpenJDK 11 installed on your Server.
- You should have apt or apt-get, wget, and unzip utility installed in your Server.
- GitHub account with one repo and GitHub token for versioned flows.

1. SSH to the Ubuntu machine by running the below command and switch to the root user:

```
ssh -i <private key path> user_name@public_ip
```

2. Update your server by running the below command:
   
```
apt update
```

3. Download Apache [Nifi 1.23.0 registry](https://archive.apache.org/dist/nifi/) using wget by running the below command:

```
wget https://archive.apache.org/dist/nifi/1.23.0/nifi-registry-1.23.0-bin.zip
```

4. Unzip the folder using unzip utility by running the below command:

```
unzip nifi-registry-1.23.0-bin.zip
```

5. Set the JAVA_HOME path by running the below command:

```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
```
If you don't have the JAVA_HOME environment variable set, then you need to set it with the OpenJDK path. In my setup, it is on /usr/lib/jvm/java-11-openjdk-amd64/.

6. Verify the path by running the below command:

```
echo $JAVA_HOME
```

7. Navigate to the nifi-registry-1.23.0/ directory and clone your versioned flows repo.

8. Navigate to the nifi-registry-1.23.0/conf/ directory, open the providers.xml file, uncomment the flowPersistenceProvider block, and provide you GitHub details(username, token as password, repo link, origin, and storage directory name means your repo name) by running the below command(I am using Vim editor).

```
cd nifi-registry-1.23.0/conf/
vi providers.xml
```

![image](https://github.com/madgicaltechdom/nowigence/assets/101810595/16ef66a5-2a71-4524-95f7-273fb85d0ab2)
  
9. Navigate to the nifi-registry-1.23.0/bin/ directory and start the Apache Nifi registry by running the below command:

```
cd nifi-registry-1.23.0/bin/
./nifi-registry.sh start
```

10. Check the status of Nifi by running the below command:

```
./nifi-registry.sh status
```

![image](https://github.com/madgicaltechdom/nowigence/assets/101810595/556beba6-37e2-41c8-9b68-76b1f4b3f1f2)

NOTE:- For checking the Nifi registry port navigate to the nifi-registry-1.23.0/conf/ directory and look at the nifi-registry.properties file. 

## Reference

I got information from this [article](https://www.cyberithub.com/easy-steps-to-install-apache-nifi-on-ubuntu-20-04/) and this [video](https://www.youtube.com/watch?v=kK7eVppg9Aw).
