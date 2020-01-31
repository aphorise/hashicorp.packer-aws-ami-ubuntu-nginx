# HashiCrop `packer` Template for AWS EBS AMI Ubuntu 18 with NGiNX
This repo contains a `packer` template for building an [AWS EBS-backed AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) of [Ubuntu 18.04 LTS](http://releases.ubuntu.com) (aka bionic-beaver) which includes a [NGiNX](https://nginx.org/en/) http server.


### Prerequisites
Ensure that you already have [**Packer**](https://www.packer.io/) installed & working - obviously an AWS account with an appropriate IAM role & tokens will also be needed (:unlock:) .


## Usage
Make changes as required; thereafter commence with build using `packer` CLI providing **`AWS_ACCESS_KEY_ID`** & **`AWS_SECRET_ACCESS_KEY`** **environment variables** inline (as exemplified below) or otherwise setting them prior to invoking `packer build`:

```bash
packer validate aws-ubuntu18lts-nginx.json
 # if output: Template validated successfully.
 # then build:

AWS_ACCESS_KEY_ID='...' AWS_SECRET_ACCESS_KEY='...' \
packer build aws-ubuntu18lts-nginx.json
```

On success - the resulting output should indicate the produced AMI ID & name produced - eg:
```
==> Builds finished. The artifacts of successful builds are:
--> ubuntu18.04_nginx64: AMIs were created:
us-east-1: ami-0e193d0c4cf2f6ad5
```


## Notes
The **source base** [**Ubuntu AMI**](https://console.aws.amazon.com/ec2/home?region=us-east-1#launchAmi=ami-07ebfd5b3428b6f4d) extended herein are in AWS `us-east-1` and were already provided by [Canonical Ltd (may be found listed at-this-link)](https://cloud-images.ubuntu.com/locator/ec2/); AMI-ID's for different regions of interest to you can be found therein.

**Network** (VPC, SG) and **SSH** consideration should be made where intending to extending this template toward proper usage beyond a mere practise / training exercise. For example - `associate_public_ip_address` that's currently set will expose the EC2 instance over public / WAN IP during the build stages (before auto termination) and what's more no `ssh_keypair_name` or `ssh_private_key_file` are set (typical use cases) - for more information see the [Packer - AMI Builder (EBS backed) - documentation](https://www.packer.io/docs/builders/amazon-ebs.html#communicator-configuration)

**SSH Username** and **Installation** may be extended by way of [cloudinit](https://cloudinit.readthedocs.io/en/latest/) [**user-data**](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html) and a commented template (`os-cc-ud.sh`) is already included as example; if you wish to use a custom SSH Username (instead of default `ubuntu`) or if you'd like to have applications installed as part of the the user-data (instead of `provisioners`) then uncomment sections and thereafter remove or adjust the correlating portions from `aws-ubuntu18lts-nginx.json` template.


## Reference & Credits:
Some material re-used from:
 * [Packer your AMIs for Immutable AWS Deployments](https://lobster1234.github.io/2017/04/23/packer-your-AMIs-for-immutable-aws-deployments/)
 * [Changing The Default "ubuntu" Username On New EC2 Instances](https://alestic.com/2014/01/ec2-change-username/)
------
