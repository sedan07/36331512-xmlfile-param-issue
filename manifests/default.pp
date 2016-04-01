#Set up staging dir for creation of packages
$staging_windir = 'C:/tmp/'
file { $staging_windir:
  ensure => directory,
}

node default {
  xmlfile { "C:/Program Files/Amazon/Ec2ConfigService/Settings/config.xml":
    ensure                => present,
    use_existing_file => true,
  }

  xmlfile_modification { "test" :
    file        => "C:/Program Files/Amazon/Ec2ConfigService/Settings/config.xml",
    changes => 'set /Ec2ConfigurationSettings/Plugins/Plugin[Name = "Ec2DynamicBootVolumeSize"]/State "Enabled"',
  }
}
