<?php 
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$playerId = $request->player;
	$lname = $request->lname;
	$email = $request->email;
	$response =new \stdClass();
	$response->success = false;
	$json = '{"status":null,"nationalId":"","id":"","fname":"James","lname":"Dean","email":"123@123.com","address":{"street1":"1230 St ln","street2":"apt 130","city":"Austin","state":"Texas","zip":"78737"},"dob":{"day":9,"month":12,"year":2002,"string":"12/09/2002"},"school":"DSHS","grade":9,"year":"2018-2019","emergency":{"primary":{"name":"james man","relationship":"uncle","phone":"5125736325"},"secondary":{"name":"jane man","relationship":"aunt","phone":"5121369856"}},"consents":{"one":true,"two":true,"three":true,"four":true,"five":true,"six":true},"medical":{"physician":"Sean Ditty","physicianNum":"3652659685","insurance":"cigna","policy":"0A15795658","callNum":"18003336666","allergies":"N/A","conditions":"N/A","medications":"N/A"},"guardian":{"primary":{"name":"Mommy Doe","email":"zzz@xx.com","phone":"3596589963"},"secondary":{"name":"Daddy Doe","phone":"9876541259"}}}';
	
	$response->player = json_decode($json);
	// if ($username){
	// 	if($password){
	// 		require("db/connect.php");
	// 		$password= md5(md5("%g6W".$password."9w$2"));				
	// 		$query = $mysqli->query("SELECT * FROM users WHERE username='$username'");
	// 		$numrows = $query->num_rows;
	// 		if ($numrows==1){
	// 			$row = $query->fetch_assoc();
	// 			$user = new \stdClass();
	// 			$user->id = $row['user_id'];
	// 			$user->name = $row['username'];
	// 			$user->pass = $row['password'];
	// 			$user->active = $row['active'];
	// 			$user->role = $row['role'];
				
	// 			if ($password === $user->pass){
	// 				if($user->active == 1){					
	// 					require('session.php');
	// 					setSessionVals($user->id, $user->name, $user->role, time());
	// 					$x = json_encode($_SESSION);
						$response->success = true;				
	// 					$response->message = "<h1>Welcome!</h1> Your login was successful.";								
	// 				} else { $response->message =  "Account must be activated first to sign in."; }
	// 			} else { $response->message =  "Invalid login info.<br> Please try again."; }						
	// 		} else { $response->message =  "Invalid login info.<br> Please try again."; }	
	// 		$query->close();
	// 		$mysqli->close();
	// 	} else { $response->message =  "You must enter your password."; }
	// } else { $response->message =  "You must enter your username."; }
	echo json_encode($response);			
?>