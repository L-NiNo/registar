<?php
	require('session.php');
	$response = new \stdClass();
	
	$username = getSessionName();
	$userid = getSessionUserid();
	$role = getSessionRole();
	// $x = "::: ".$username." - ".$userid." - ".$role." :::";
	if(isset($username) && isset($userid) && isset($role)){
		session_destroy();
		$response->success = true;
		$response->message = "Thank you for visiting, <br>you are now signed out.";
	} else {
		$response->message = "You are not logged in.";
	}
	echo json_encode($response);
?>