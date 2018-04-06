## aws_client
A puppet module that installs the AWS CLI based in python on an ubuntu OS


#### Prerequisites
* Linux Ubuntu 12.04 or Greater
* Puppet 3.7.4 or greater


#### Master-less Execution

Install Puppet Module
```bash

sudo git clone https://github.com/hubchenko/aws_client.git /etc/puppet/modules/aws_client
```

Run Puppet Module - should be executed as root
```bash
puppet apply --modulepath=/etc/puppet/modules -e "class {'aws_client': aws_client_account => 'weakuseraccount', aws_access_key => 'weakaccesskey', aws_secret_key => 'weakpasskey' , aws_region => 'us-west-2'}"
```


#### Paramters

```bash
aws_python_packages: Ubuntu system packages, defaults to: ['python', 'python-pip'],
aws_pip_packages: python pip packages, defaults to: ['awscli', 's4cmd'],
aws_client_account: AWS client account name
aws_access_key: AWS Key ID,
aws_secret_key: AWS Password Key,
aws_region: Region for client to operate against, defaults to: 'us-west-2',
```

