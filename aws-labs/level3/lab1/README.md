

1. Create a private RDS instance named devops-rds using a free tier template.
- The engine type must be MySQL v8.0.36, and it must be a db.t3.micro type instance.
- The master username must be devops_admin with an appropriate password.
- The RDS storage type must be gp2, and the storage size must be 5GiB.
- Create a database named devops_db.
- Keep the rest of the configurations as default. Ensure the instance is in available state.
- Adjust the security groups so that the devops-ec2 instance can connect to the RDS on port 3306 and also open port 80 for the instance.

2) An EC2 instance named devops-ec2 exists. Connect to this instance from the AWS console. Create an SSH key (/root/.ssh/id_rsa) on the aws-client host if it doesn't already exist. Add the public key to the authorized keys of the root user on the EC2 instance for password-less SSH access.
```
ssh-keygen
```

3) There is a file named index.php under the /root directory on the aws-client host. Copy this file to the devops-ec2 instance under the /var/www/html/ directory. Make the appropriate changes in the file to connect to the RDS.
```
scp /root/index.php root@<ec2-endpoint>:/var/www/html/
```

4) You should see a Connected successfully message in the browser once you access the instance using the public IP.