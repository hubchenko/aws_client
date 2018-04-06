
class aws_client (

$aws_python_packages = ['python', 'python-pip'],
$aws_pip_packages = ['awscli', 's4cmd'],
$aws_client_account = 'weakuseraccount',
$aws_access_key = 'weakkey',
$aws_secret_key = 'weakpass',
$aws_region = 'us-west-2',



	)

{
	

	if $operatingsystem == "Ubuntu" {

		package {
		    $aws_python_packages :
		        ensure      => installed,
		        provider    => apt,
		 
		}

		package {
		    $aws_pip_packages :
		        ensure      => installed,
		        provider    => pip,
		        require     => Package['python-pip'],
		}



		file {
		    "/home/$aws_client_account/.aws/credentials":
		        ensure  => file,
		        content => template("aws_client/aws_credentials.erb"),
		        owner   => $aws_client_account,
		        require     => Package['awscli'],
		        
			}
		file {
		    "/home/$aws_client_account/.aws/config":
		        ensure  => file,
		        content => template("aws_client/aws_config.erb"),
		        owner   => $aws_client_account,
		        require     => Package['awscli'],
		        
			}

		file {
		    "/home/$aws_client_account/.profile":
		        ensure  => file,
		        content => template("aws_client/s3_export_profile.erb"),
		        owner   => $aws_client_account,
		        require     => Package['s4cmd'],
		        
			}
		}
	else {
		notify {
		    'Class applied, however not enforced':
		        name     => 'Class applied, however not enforced',
		        message  => 'Class applied, however not enforced',
		       
		}
	}

}
