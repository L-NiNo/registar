<?php 
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$username = $request->user;
	$password = $request->password;
	$response =new \stdClass();
	$response->success = false;
	if ($username){
		if($password){
			require("db/connect.php");
			$password= md5(md5("%g6W".$password."9w$2"));				
			$query = $mysqli->query("SELECT * FROM users WHERE username='$username'");
			$numrows = $query->num_rows;
			if ($numrows==1){
				$row = $query->fetch_assoc();
				$user = new \stdClass();
				$user->id = $row['user_id'];
				$user->name = $row['username'];
				$user->pass = $row['password'];
				$user->active = $row['active'];
				$user->role = $row['role'];
				
				if ($password === $user->pass){
					if($user->active == 1){					
						require('session.php');
						setSessionVals($user->id, $user->name, $user->role, time());
						$x = json_encode($_SESSION);
						$response->success = true;				
						$response->message = "<h1>Welcome!</h1> Your login was successful.";								
					} else { $response->message =  "Account must be activated first to sign in."; }
				} else { $response->message =  "Invalid login info.<br> Please try again."; }						
			} else { $response->message =  "Invalid login info.<br> Please try again."; }	
			$query->close();
			$mysqli->close();
		} else { $response->message =  "You must enter your password."; }
	} else { $response->message =  "You must enter your username."; }
	echo json_encode($response);			
?>