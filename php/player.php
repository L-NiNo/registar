<?php 
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$player = $request->player;

	$response =new \stdClass();
	$response->error = null;
	$response->messages = [];
	$success = false;
	try {
		// LOOK UP BY NATIONAL ID
		require("db/connect.php");
		$query = $mysqli->prepare("SELECT * FROM national AS n JOIN players AS p WHERE p.player_id = n.player_id AND n.national_id = ?");
		$query->bind_param('i', $player->playerId);
		$query->execute();
		$results = $query->get_result();
		$numrows = $results->num_rows;
		// No rows, new player
		if ($numrows == 0){
			$response->data = null;
		} else if ($numrows == 1){ // Single record found, returning registrant  (expected)
			$response->data = $results->fetch_assoc();
		} else if($numrows > 1){ // Multi records --> should not happen
			$array = [];
			while($row = $results->fetch_assoc()) {
				array_push($array, $row);
			}
			$response->data = $array;
		}
		$success = true;
	}
	catch(exception $e){
		$response->error = $e;
	}
	finally {	
		array_push($response->messages, ($success)?'success: true':'success: false');
		echo json_encode($response);
	}

			// // LOOK UP BY NATIONAL ID
			// require("db/connect.php");
			// $query = $mysqli->prepare("SELECT * FROM registration AS r JOIN players AS p WHERE p.player_id = r.player_id AND r.national_id = ?");
			// $query->bind_param('i', $player->playerId);
			// $query->execute();
			// // $response->results = $query->get_result();
			// $results = $query->get_result();

			// $numrows = $results->num_rows;
			// $response->rows = $numrows;
			// if ($numrows == 0){
			// 	$response->data = null;
			// } else if ($numrows == 1){
			// 	$response->data = $results->fetch_assoc();
			// } else if($numrows > 1){
			// 	$array = [];
			// 	while($row = $results->fetch_assoc()) {
			// 		array_push($array, $row);
			// 	}
			// 	$response->data = $array;
			// }
			
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
						// $response->success = true;				
	// 					$response->message = "<h1>Welcome!</h1> Your login was successful.";								
	// 				} else { $response->message =  "Account must be activated first to sign in."; }
	// 			} else { $response->message =  "Invalid login info.<br> Please try again."; }						
	// 		} else { $response->message =  "Invalid login info.<br> Please try again."; }	
	// 		$query->close();
	// 		$mysqli->close();
	// 	} else { $response->message =  "You must enter your password."; }
	// } else { $response->message =  "You must enter your username."; }
	// echo json_encode($response);			

//<!-- 
//INSERT INTO `registration` (`reg_id`, `national_id`, `player_id`, `school`, `year`, `timestamp`, `consent_medical`, `consent_liability`, `consent_conduct_ds`, `consent_conduct_tghsll`, `consent_picture`) VALUES (NULL, '10025', '002', 'DSMS', '2019-2020', CURRENT_TIMESTAMP, '1', '1', '1', '1', '1');
//INSERT INTO `players` (`id`, `player_id`, `fname`, `lname`, `email`, `phone`, `address`, `city`, `zip`, `shirt_size`, `short_size`) VALUES (NULL, '001', 'Jane', 'Crane', 'xxx@xx.com', '5121231234', '123 St Road', 'Austin', '78737', 'M', 'M');
//INSERT INTO `reg_address` (`id`, `player_id`, `address`, `city`, `st`, `zip`) VALUES (NULL, '001', '123 St Road', 'Austin', 'TX', '78737');
//INSERT INTO `medical_info` (`med_id`, `player_id`, `physician`, `phone`, `insurance`, `policy_num`, `insurance_num`, `alergies`, `other`, `medications`) VALUES ('001', '001', 'Dr Lang', '8887779999', 'Cigna', '0012336', '18009990000', 'none', 'none', 'none');
//INSERT INTO `guardians` (`id`, `player_id`, `g1_name`, `g1_email`, `g1_phone`, `g2_name`, `g2_email`, `g2_phone`) VALUES (NULL, '001', 'James Crane', ' xx@xx.com', '9632581478', 'Christine Crane', 'xxx2@xx.com', NULL);
//INSERT INTO `e_contacts` (`id`, `player_id`, `ec1_name`, `ec1_num`, `ec1_relationship`, `ec2_name`, `ec2_num`, `ec2_relationship`) VALUES (NULL, '001', 'Daniel James', '9876541233', 'Uncle', 'Terrie Prince', '4656872213', 'Other'); -->

?>