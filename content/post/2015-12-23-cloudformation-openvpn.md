---
date: 2015-12-23
title: AWS Cloudformation template for OpenVPN server creation
location: Munich, Germany
tags: [aws, cloudformation, netflix, openvpn, automation, vpn]
alias: /2015/12/23/aws-cloudformation-template-for-openvpn-server-creation/
twitter: true
---

Are you traveling for Christmas to a country where Netflix/Hulu isn't available? Are you worried you might resort to violence against your own family once you're fed up with them? Here's a VPN server template to help the situation (and keep you away from prison).

**update Jan 6, 2016:** [Oh, well.](https://media.netflix.com/en/press-releases/netflix-is-now-available-around-the-world) VPN servers can still be useful for other purposes.

Netflix is brilliant and there's no better time to catch up on your [Jessica Jones](http://www.netflix.com/title/80002311?locale=en-DE) episodes than Christmas break. But what if your family resides in a country where Netflix isn't available yet? 😱 Fear not, there's a way to circumvent geolocation-based legal barriers that protect, in my case, Eastern Europe from excellent comic book-based television. First, you're gonna need a *fast* internet connection.[^1] Second, a VPN server into the country where Netflix is available, e.g., Bundesrepublik Deutschland.

To create one really quickly and cheaply (and destroy it as easily once it's not needed), it's best to use Cloudformation, an orchestration/templating tool that AWS provides. With Cloudformation, all the details[^2] of your stack are included in one JSON file which, once uploaded via AWS Console, deploys the stack defined by the template. The JSON file below defines an EC2 instance together with a security group suited for OpenVPN:

{{< highlight json >}}
{
    "AWSTemplateFormatVersion": "2010-09-09",
    "Description": "OpenVPN server template",
    "Mappings": {
        "AWSRegion2AMI": {
            "ap-northeast-1": {
                "AMI": "ami-5ea72b5e"
            },
            "ap-southeast-1": {
                "AMI": "ami-365c5764"
            },
            "ap-southeast-2": {
                "AMI": "ami-831d51b9"
            },
            "eu-central-1": {
                "AMI": "ami-507f7e4d"
            },
            "eu-west-1": {
                "AMI": "ami-03644074"
            },
            "sa-east-1": {
                "AMI": "ami-4fd55f52"
            },
            "us-east-1": {
                "AMI": "ami-5fe36434"
            },
            "us-west-1": {
                "AMI": "ami-8bf40fcf"
            },
            "us-west-2": {
                "AMI": "ami-9fe2f2af"
            }
        }
    },
    "Parameters": {
        "InstanceType": {
            "AllowedValues": [
                "t2.micro",
                "t2.medium",
                "m3.medium",
                "m3.large",
                "m3.xlarge",
                "m3.2xlarge"
            ],
            "ConstraintDescription": "must be a valid EC2 instance type.",
            "Default": "t2.micro",
            "Description": "Instance type for EC2 instance.",
            "Type": "String"
        },
        "KeyName": {
            "ConstraintDescription": "must be the name of an existing EC2 KeyPair.",
            "Default": "openvpn",
            "Description": "Name of an existing EC2 KeyPair to enable SSH access to the instances",
            "Type": "AWS::EC2::KeyPair::KeyName"
        },
        "Project": {
            "AllowedPattern": "[\\x20-\\x7E]*",
            "ConstraintDescription": "can contain only ASCII characters.",
            "Default": "OpenVPN-server",
            "Description": "OpenVPN-server",
            "MaxLength": "255",
            "MinLength": "1",
            "Type": "String"
        }
    },
    "Resources": {
        "OpenVPNInstance": {
            "Properties": {
                "ImageId": {
                    "Fn::FindInMap": [
                        "AWSRegion2AMI",
                        {
                            "Ref": "AWS::Region"
                        },
                        "AMI"
                    ]
                },
                "InstanceType": {
                    "Ref": "InstanceType"
                },
                "KeyName": {
                    "Ref": "KeyName"
                },
                "SecurityGroups": [
                    {
                        "Ref": "VPNSecurityGroup"
                    }
                ],
                "Tags": [
                    {
                        "Key": "Name",
                        "Value": {
                            "Fn::Join": [
                                "-",
                                [
                                    "EC2-VPN",
                                    {
                                        "Ref": "Project"
                                    }
                                ]
                            ]
                        }
                    }
                ],
                "UserData": {
                    "Fn::Base64": {
                        "Fn::Join": [
                            "",
                            [
                                "public_hostname=openvpn\n",
                                "admin_user=openvpn\n",
                                "admin_pw=openvpn\n",
                                "reroute_gw=1\n",
                                "reroute_dns=1\n"
                            ]
                        ]
                    }
                }
            },
            "Type": "AWS::EC2::Instance"
        },
        "VPNSecurityGroup": {
            "Properties": {
                "GroupDescription": "Enable SSH access to the instance and VPN access via configured port. ",
                "SecurityGroupIngress": [
                    {
                        "CidrIp": "0.0.0.0/0",
                        "FromPort": "443",
                        "IpProtocol": "tcp",
                        "ToPort": "443"
                    },
                    {
                        "CidrIp": "0.0.0.0/0",
                        "FromPort": "1194",
                        "IpProtocol": "udp",
                        "ToPort": "1194"
                    }
                ],
                "Tags": [
                    {
                        "Key": "Name",
                        "Value": {
                            "Fn::Join": [
                                "-",
                                [
                                    "SG-VPN",
                                    {
                                        "Ref": "Project"
                                    }
                                ]
                            ]
                        }
                    }
                ]
            },
            "Type": "AWS::EC2::SecurityGroup"
        }
    }
}
{{< /highlight >}}

You can [download it](https://gist.github.com/pkazmierczak/6886e01508c470934c4d), and use it whenever you need to quickly deploy an OpenVPN server. In order to use it, you need:

1. an AWS account (this costs money, but not much, and only when it's being used);

2. to accept the terms of use for the [OpenVPN Access Service AMI](https://aws.amazon.com/marketplace/pp/B00MI40CAE); it's free for not more than 2 VPN connections at a time;

3. to have at least one key pair for the EC2 instance that will be deployed;

4. to configure the OpenVPN server and optionally create another user (the default username and password is `openvpn` as defined in the template);

5. to configure a VPN client software capable of connecting to OpenVPN servers; on a Mac I recommend [Viscosity](https://www.sparklabs.com/viscosity/), Linux users need the OpenVPN plugin for Network Manager, Windows users need to get a grip and change the OS (seriously though, I don't know any VPN clients for Windows, but for sure there are many good ones).

That's it! To access the control panel of your VPN server, browse to `https://yourEC2_public_IP_address/admin` and accept the OpenVPN license. To get the `client.ovpn` configuration file for your client software, look up `https://yourEC2_public_IP_address/?src=connect` (you may need to tweak the settings depending on the client you're using).

If you'd like to change the Cloudformation template, I recommend using [Troposphere](https://github.com/cloudtools/troposphere) package for Python rather than editing the raw JSON file. Here's the <a href="https://gist.github.com/pkazmierczak/54146775a1d8f45669c6">source</a> I used to generate the template above.

Merry Christmas everyone!

[^1]: Now you'd think it's difficult to get a fast enough internet connection in the poor Eastern Block, but my experience shows that on average the quality of internet providers is orders of magnitude better in, say, Poland than in, say, Germany/The Netherlands/Belgium/Norway/UK.

[^2]: Ordinarily, yes, CF templates *should* include all the details of a given stack. The template presented here is as bare as possible, though, using a default VPC, default subnet etc., to keep it simple.
