<?php
	require_once "/usr/share/nginx/owncloud/config/config.php";

	print "<?php
$CONFIG = array (
  'instanceid' => '" . $CONFIG['instanceid'] . "',
  'passwordsalt' => '" . $CONFIG['passwordsalt'] . "',
  'datadirectory' => '" . $CONFIG['datadirectory'] . "',
  'dbtype' => '" . $CONFIG['dbtype'] . "',
  'version' => '" . $CONFIG['version'] . "',
  'dbname' => '" . $CONFIG['dbname'] . "',
  'dbhost' => '" . $CONFIG['dbhost'] . "',
  'dbtableprefix' => '" . $CONFIG['dbtableprefix'] . "',
  'dbuser' => '" . $CONFIG['dbuser'] . "',
  'dbpassword' => '" . $CONFIG['dbpassword'] . "',
  'installed' => " . $CONFIG['installed'] . ",
);
";
