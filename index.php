<?php 
	require ('php/session.php');
?>
<!-- 
<style type="text/css">

	body {
	  font-family: helvetica;
	  display: flex ;
	  flex-direction: column;
	  align-items: center;
	}

	.chat {
	  width: 300px;
	  border: solid 1px #EEE;
	  display: flex;
	  flex-direction: column;
	  padding: 10px;
	}

	.messages {
	  margin-top: 30px;
	  display: flex;
	  flex-direction: column;
	}

	.message {
	  border-radius: 20px;
	  padding: 8px 15px;
	  margin-top: 5px;
	  margin-bottom: 5px;
	  display: inline-block;
	}

	.yours {
	  align-items: flex-start;
	}

	.yours .message {
	  margin-right: 25%;
	  background-color: #EEE;
	  position: relative;
	}

	.yours .message.last:before {
	  content: "";
	  position: absolute;
	  z-index: 0;
	  bottom: 0;
	  left: -7px;
	  height: 20px;
	  width: 20px;
	  background: #EEE;
	  border-bottom-right-radius: 15px;
	}
	.yours .message.last:after {
	  content: "";
	  position: absolute;
	  z-index: 1;
	  bottom: 0;
	  left: -10px;
	  width: 10px;
	  height: 20px;
	  background: white;
	  border-bottom-right-radius: 10px;
	}

	.mine {
	  align-items: flex-end;
	}

	.mine .message {
	  color: white;
	  margin-left: 25%;
	  background: rgb(0, 120, 254);
	  position: relative;
	}

	.mine .message.last:before {
	  content: "";
	  position: absolute;
	  z-index: 0;
	  bottom: 0;
	  right: -8px;
	  height: 20px;
	  width: 20px;
	  background: rgb(0, 120, 254);
	  border-bottom-left-radius: 15px;
	}

	.mine .message.last:after {
	  content: "";
	  position: absolute;
	  z-index: 1;
	  bottom: 0;
	  right: -10px;
	  width: 10px;
	  height: 20px;
	  background: white;
	  border-bottom-left-radius: 10px;
	}
</style>
<div class="chat">
  <div class="yours messages">
    <div class="message last">
      Hello, how's it going?
    </div>
  </div>
  <div class="mine messages">
    <div class="message">
      Great thanks!
    </div> 
    <div class="message last">
      How about you?
     </div>
  </div>
</div> -->


<!doctype html>
<html lang="en" ng-app="chatApp">
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.4/angular.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.4/angular-animate.js"></script>
		<script type="text/javascript" src="js/auth.js"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	</head>
	<body>
		<div class="text-center" ng-controller="authCtrl as vm">
			<div class="form-signin" >
				<div class="row" ng-if="vm.loggedIn">
					<div class="col-8">
						<button id="logout" class="btn btn-sm btn-outline-dark float-right" ng-click="vm.onLogout()">
							<span>Sign Out</span>
							<i class="fas fa-sign-out-alt"></i>
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="slow-show-hide" ng-show="vm.feedback">
						<div id="feedback" ng-class="vm.feedbackClass" >
							<span ng-if="vm.feedbackClass == 'border border-danger alert alert-danger'" class="row">
								<i class="col-12 fas fa-exclamation-triangle"></i><br>
							</span>
							<span ng-if="vm.feedbackClass == 'border border-success alert alert-success'" class="row">
								<i class="col-12 fas fa-check"></i><br>
							</span>
							<span  class="row">
								<span  class="col-12" ng-bind-html="vm.feedback"></span>
							</span>
						</div>
						</div>
						<form id="login_form" ng-if="!vm.loggedIn">
							<h1 class="h3 mb-3 font-weight-normal">Please sign in to chat</h1>
							<label for="inputEmail" class="sr-only">Username</label>
							<input type="text" name="username" id="username" class="form-control" ng-keyup="vm.enableSubmit($event)" ng-model="vm.username" placeholder="Username" required="" autofocus=""/>
							<label for="inputPassword" class="sr-only">Password</label>
							<input type="password" name="password" id="password" class="form-control" ng-keyup="vm.enableSubmit($event)" ng-model="vm.password" placeholder="*****" required="" autofocus=""/>
							<br/>
							<button id="login" class="btn btn-lg btn-primary btn-block" ng-disabled="!vm.l_ready" ng-click="vm.onLogin()">
								<span>Sign In</span>
								<i class="fas fa-sign-in-alt"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
			<div ng-if="vm.loggedIn">TEST LOG IN
				<chat-login></chat-login>
			</div>
		</div>	
	</body>
</html>


<link rel="stylesheet" href="css/styles.css"></link>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script type="text/javascript" src="libs/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>



