#Set up staging dir for creation of packages
$staging_windir = 'C:/tmp/'
file { $staging_windir:
  ensure => directory,
}

node default {
  xmlfile { "C:/Path To Existing XML File/config.xml":
    ensure                => present,
    use_existing_file => true,
  }

  xmlfile_modification { "test" :
    file        => "C:/Path To Existing XML File/config.xml",
    changes => 'set /Someconfig/State "Enabled"',
  }
}
