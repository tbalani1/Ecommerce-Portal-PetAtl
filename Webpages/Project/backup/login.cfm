<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>PetAtl | Login</title>
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
	function load(){
		alert("User created successfully!");
	}
  </script>
  <cfif not isdefined("Form.PaymentForm")> 
  <cfset Form.PaymentForm = "No"> 
  </cfif> 

  <cfif isdefined("Form.customerFName")>
<CFQUERY NAME="AddCustomerInfo" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO CUSTOMERINFO (IDCustomer, FIRSTNAME, LASTNAME, PHONE1, PHONE2, EMAILADDRESS, PASSWORD)
			VALUES ((select (max(idcustomer)+1) from customerinfo), '#Form.customerFName#', '#Form.customerLName#', '#Form.phoneNumber#','#Form.phoneNumberS#', '#Form.email#', '#Form.password#')
		  </CFQUERY>
		  
<CFQUERY NAME="AddShippingAddress" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO ADDRESS (IDADDRESS, STREET, CITY, STATE, ZIPCODE, ADDRESSTYPE, DEFAULTADDRESS, IDCUSTOMER)
			VALUES ((select (max(idaddress)+1) from address), '#Form.StreetAddress#', '#Form.city#', '#Form.State#', '#Form.ZipCode1#', 'Ship', 1, (select max(idcustomer) from customerinfo))
		  </CFQUERY>

<CFQUERY NAME="AddBillingAddress" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO ADDRESS (IDADDRESS, STREET, CITY, STATE, ZIPCODE, ADDRESSTYPE, DEFAULTADDRESS, IDCUSTOMER)
			VALUES ((select (max(idaddress)+1) from address), '#Form.BillingStAddr#', '#Form.BillingCity#', '#Form.BillingState#', '#Form.BillingZip1#', 'Bill', 0, (select max(idcustomer) from customerinfo))
		  </CFQUERY>
		  
<CFQUERY NAME="CREDITCARDINFO" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO CREDITCARDINFO (CARDTYPE, CARDNUMBER, CVV, MONTH, YEAR, NAMEONCARD, IDCUSTOMER)
			VALUES ('MasterCard', '#Form.DebitCreditCard#', '#Form.SecurityCode#', '#Form.Mon#','#Form.Year#','#Form.NameOnCard#', (select (max(idcustomer)) from customerinfo))
		  </CFQUERY>	  
  </cfif> 
</head>

<body class="login-page">
  <header>
  <div class="main-header">
	<a href="#." class="main-logo white-text">Welcome to PetAtl</a>
	<a href="payments.cfm" class="cart white-text"><h3 id="cartCount">Register</h3></a>
	</div>
    <!-- <div class="main-header"><a href="#." class="main-logo white-text">Welcome to PetAtl,</a></div> -->
		  <!-- <a href="payments.cfm" class="cart white-text"><h3 id="login">Register</h3></a> -->

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
    <p class="copyright-text">Copyright 2017 PetAtl.com</p>
  </footer>
</body>

</html>