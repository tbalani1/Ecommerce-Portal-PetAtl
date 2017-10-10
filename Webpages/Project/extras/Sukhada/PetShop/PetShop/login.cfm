<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>DemoKart | Login</title>
  <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
  <!--<link rel="stylesheet" href="css/font.css">-->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/global.css">
  <script type="text/javascript">
	function validateLoginPage(){
		var password=document.loginForm.password.value;  
		var name=document.loginForm.username.value;
		if (name==null || name==""){  
			alert("Name can't be blank");  
			return false;  
		}else if(password.length<6){  
			alert("Password must be at least 6 characters long.");  
			return false;  
		} 
	}  
  </script>
  <cfif not isdefined("Form.PaymentForm")> 
  <cfset Form.PaymentForm = "No"> 
  </cfif> 

  <CFQUERY NAME="AddCustomerInfo" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO CUSTOMERINFO (IDCustomer, FIRSTNAME, LASTNAME, PHONENUMBER, EMAILADDRESS, PASSWORD)
			VALUES (34576, '#Form.customerFName#', '#Form.customerLName#', #Form.phoneNumber#, '#Form.email#', '#Form.password#')
		  </CFQUERY>
</head>

<body class="login-page">
  <header>
    <div class="sub-header"><span>Welcome to DemoKart</span></div>
    <div class="main-header"><a href="#." class="main-logo white-text">DemoKart</a></div>
  </header>
  <section>
    <form name="loginForm" class="login-box" method="post" action="validateLogin.cfm" onsubmit="return validateLoginPage()">
      <h4>Login Text</h4>
      <label for="username">Username</label>
      <input type="text" name="loginUsername" id="username" placeholder="Username" class="form-control">
      <label for="password">Password</label>
      <input type="password" name="loginPassword" id="password" placeholder="Password" class="form-control">
      <div class="clearfix">
        <button type="reset" class="btn btn-secondary">Cancel</button>
        <button type="submit" class="btn white-btn">Login</button>
      </div>
    </form>
  </section>
  <footer>
    <p class="copyright-text">Copyright 2017 demokart.com</p>
  </footer>
</body>

</html>