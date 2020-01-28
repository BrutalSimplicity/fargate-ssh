# Inspect Fargate Container via SSH

The `Dockerfile` can be used to deploy a fargate or ECS container that can be logged into via ssh, which can be useful for inspecting the container enviroment and for troubleshooting issues with AWS.

**NOTE: Use for testing only. DO NOT USE FOR PRODUCTION SCENARIOS (private key is hosted in a public github repository).**

## Steps

1. Create an ECR repository and build, tag, and push the `Dockerfile` in this folder 
2. Create an ECS cluster, service, and task definition referencing the image in ECR
3. Be sure to attach a public subnet to the container
4. You must create a security group that opens traffic to port 22 (ssh)
5. At least one running task/container.

## How to SSH

Once you have everything setup above. You can ssh into the instance using the public IP and private key. The public IP should be viewable via the console for the task, and the private key is included in this folder.

Now run `ssh -i insecure_key root@<ip-address>`

### Example

```
➜  ssh git:(OPSSTE-24817) ✗ ssh -i insecure_key root@54.175.117.49
Last login: Thu Jan 16 20:58:27 2020 from 65.170.41.5

root@ip-172-31-21-252:/# env | grep AWS_CONTAINER_CREDENTIALS_RELATIVE_URI
AWS_CONTAINER_CREDENTIALS_RELATIVE_URI=/v2/credentials/e0f16625-611f-4e95-81d0-69883d15bb58
```
