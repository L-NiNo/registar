<?php
	error_reporting (E_ALL ^ E_NOTICE);
	$a = session_id();
	if(empty($a)) session_start();
	// echo "SID: ".SID."<br>session_id(): ".session_id()."<br>COOKIE: ".$_COOKIE["PHPSESSID"];
	if (!isset($_SESSION['safety'])){
    	session_regenerate_id(true);
    	$_SESSION['safety'] = true;
	}
	$_SESSION['sessionid'] = session_id();

	if(!isset($_SESSION['timeout'])) $_SESSION['timeout'] = time();
	// echo 'SESSION START TIME: '.$_SESSION['timeout'].'<br>';
	if (!isset($_SESSION['userid'])){
		$userid 		= ($_SESSION['userid'])? $_SESSION['userid']: null;
		$username		= ($_SESSION['username'])? $_SESSION['username']: null;
		$role 			= ($_SESSION['role'])? $_SESSION['role']: null;
		$s_start_time	= ($_SESSION['timeout'] )? $_SESSION['timeout'] : time(); 
		$duration		= (100 * 60);							//how long do we want the session to last? (Minutes * Seconds) 
		$s_stop_time	= (!isset($s_stop_time))? $s_start_time + $duration: $s_stop_time;
		$current_time 	= time();
	}
	// echo 'START TIME: '.$s_start_time.'<br>';
	// echo 'Current Time: '.$current_time.'<br>';
	// echo 'Session Duration: '.$duration.'<br>';
	// echo 'Session Time remaining: '.($s_stop_time - $current_time).'<br>';
	// echo 'Stop Time: '.$s_stop_time.'<br>';

	if (isset($s_stop_time) && isset($duration) && $s_stop_time == $duration ){						
		$s_stop_time = NULL;
	} 

	$timeLimit 	=	$s_stop_time;
	
	if (isset($timeLimit)){
		// Echo $timeLimit."<BR>";
		// ECHO TIME()."<BR>";
		
		if ($timeLimit < time()) { 
		// ECHO "Time is up!<BR>".$timeLimit." is less than ".time();    
			session_destroy();
			echo"<script>
		 			alert('Sorry, your session has timed out. Please sign back in.');
				</script>";
			// echo"<meta http-equiv='refresh' content='0;url=index.php'>";
		} else { 
			// echo "session ok"; 
		}  
  	}

  	function setSessionVals($id, $name, $role, $time){
  		$_SESSION['userid'] = $id;
  		$_SESSION['username'] = $name;
  		$_SESSION['role'] = $role;
  		$_SESSION['timeout'] = $time;
  	}

  	function getSessionVals(){
  		return $_SESSION;
  	}

  	function getSessionName(){
  		return $_SESSION['username'];
  	}
  	function getSessionUserid(){
  		return $_SESSION['userid'];
  	}
  	function getSessionRole(){
  		return $_SESSION['role'];
  	}
	
?>