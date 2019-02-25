<?php
	require_once('content.php');
	$mysqli = new mysqli($DB->TABLE, $DB->ACCESS, $DB->PW, $DB->NAME);
	if ($mysqli->connect_errno) {
    	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
	// echo $mysqli->host_info . "\n";
?>