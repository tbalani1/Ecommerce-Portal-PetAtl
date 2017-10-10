<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>DemoKart | Payment</title>
  <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
  <!--<link rel="stylesheet" href="css/font.css">-->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/global.css">
</head>

<body class="payments-page">
  <header>
    <div class="sub-header"><span> | </span><a href="#.">Logout</a></div>
    <ul class="main-header clearfix">
      <li class="pull-left"><a href="#." class="main-logo white-text">DemoKart</a></li>
      <li><a href="#." class="orders white-text">Orders</a></li>
      <li><a href="#." class="cart white-text">Cart (0)</a></li>
    </ul>
  </header>
  <section>
  <FORM name="PaymentForm" action="insert_payments_action.cfm" method="post">
    <h2>Payments</h2>
    <div class="payments-wrapper clearfix">
      <div class="create-account-wrapper">
        <div class="create-account">
          <h3>Create Account</h3>
          <label for="login-name">First Name</label>
          <input type="text" placeholder="First Name" id="customerFName" class="form-control mandatory" name="customerFName">
		  <label for="login-name">Last Name</label>
          <input type="text" placeholder="Last Name" id="customerLName" class="form-control mandatory" name="customerLName">
          <label for="login-phone">Phone Number</label>
          <input type="text" placeholder="Phone Number" id="phoneNumberP" class="form-control mandatory" name="phoneNumberP">
          <label for="login-phone">Secondary Phone Number</label>
          <input type="text" placeholder="Secondary Phone Number" id="phoneNumberS" class="form-control mandatory" name="phoneNumberS">          <label for="login-email">Email</label>
          <input type="email" placeholder="Email" id="email" class="form-control mandatory" name="email">
          <label for="login-password">Password</label>
          <input type="password" placeholder="Password" id="password" class="form-control mandatory" name="password">
          <label for="login-confirm-password">Confirm Password</label>
          <input type="password" placeholder="Confirm Password" id="login-confirm-password" class="form-control mandatory"name="password">
        </div>
      </div>
      
      <div class="select-address-wrapper new-shipping-address-details clearfix">
        <h3>Shipping Address</h3>
        <div class="contact shipping-address clearfix">
          <p class="heading">Shipping Address</p>
          <input type="text" placeholder="Street Address" id="StreetAddress" class="form-control full-width mandatory" name="StreetAddress">
          <input type="text" placeholder="Apt, Suite, Bldg (optional)" id="Appt" class="form-control full-width" name="Appt">
          <div class="zip-code-wrapper clearfix">
            <input type="text" placeholder="Zip Code" id="ZipCode1" class="form-control small-input mandatory" name="ZipCode1">
            <span class="help-text">Enter Zip for City and State</span>
          </div>
          <div class="zip-code-wrapper clearfix">
            <input type="text" placeholder="Zip Code" id="ZipCode2" class="form-control small-input mandatory" name="ZipCode2">
            <span class="help-text">Enter Zip for City and State</span>
          </div>
        </div>
		
		<div class="address clearfix payment-mode-wrapper">
        <h3>Payment Method</h3>
        <div class="payment-options">
          <input type="radio" id="payment-mode" name="CreditDebitRadio"> <label for="payment-mode">VISA / Mastercard</label>
        </div>
        <div class="card-section">
          <input type="text" placeholder="Debit/Credit Card Number" id="DebitCreditCard" class="form-control big-input mandatory" name="DebitCreditCard">
          <input type="text" placeholder="Security Code" id="SecurityCode" class="form-control small-input" name="SecurityCode">
          <label>Expires </label>
          <select name="Mon">
            <option>Month</option>
            <option>JAN</option>
            <option>FEB</option>
            <option>MAR</option>
            <option>APR</option>
            <option>MAY</option>
            <option>JUN</option>
            <option>JUL</option>
            <option>AUG</option>
            <option>SEPT</option>
            <option>OCT</option>
            <option>NOV</option>
            <option>DEC</option>
          </select>
          <select name="Year">
            <option>Year</option>
            <option>2017</option>
            <option>2018</option>
            <option>2019</option>
            <option>2020</option>
            <option>2021</option>
            <option>2022</option>
            <option>2023</option>
            <option>2024</option>
            <option>2025</option>
            <option>2026</option>
            <option>2027</option>
            <option>2028</option>
            <option>2029</option>
            <option>2030</option>
            <option>2031</option>
          </select>
		  <br/>
		  <br/>
		  <label for="name-on-card">Name on card</label>
		  <br/>
		  <br/>
          <input type="text" placeholder="Name on card" id="NameOnCard" class="form-control mandatory" name="NameOnCard">
        </div>
      </div>
      </div>
      <div class="select-address-wrapper billing-address-details clearfix">
        <h3>Billing Address <span class="same-address-flag pull-right"><label for="save-billing-information">Same as shipping address</label><input type="checkbox" id="save-billing-information"></span></h3>
        <div class="contact billing-contact clearfix">
          <p class="heading">Billing Contact</p>
          <input type="text" placeholder="First Name" id="BillingFName" class="form-control small-input mandatory" name="BillingFName">
          <input type="text" placeholder="Last Name" id="BillingLName" class="form-control big-input mandatory" name="BillingLName">
          <input type="text" placeholder="Area Code" id="BillingACode1" class="form-control small-input mandatory" name="BillingACode1">
          <input type="text" placeholder="Primary Phone" id="BillingPPhone" class="form-control big-input mandatory" name="BillingPPhone">
          <input type="text" placeholder="Area Code" id="BillingACode2" class="form-control small-input" name="BillingACode2">
          <input type="text" placeholder="Alternate Phone (optional)" id="BillingAPhone" class="form-control big-input" name="BillingAPhone">
          <input type="email" placeholder="Email Address" id="BillingEmail" class="form-control full-width mandatory" name="BillingEmail">
        </div>
        <div class="address billing-address clearfix">
          <p class="heading">Billing Address</p>
          <input type="text" placeholder="Company Name (optional)" id="BillingCompName" class="form-control full-width" name="BillingCompName">
          <input type="text" placeholder="Street Address" id="BillingStAddr" class="form-control full-width mandatory" name="BillingStAddr">
          <input type="text" placeholder="Apt, Suite, Bldg (optional)" id="BillingAppt" class="form-control full-width" name="BillingAppt">
          <div class="zip-code-wrapper clearfix">
            <input type="text" placeholder="Zip Code" id="BillingZip1" class="form-control small-input mandatory" name="BillingZip1">
            <span class="help-text">Enter Zip for City and State</span>
          </div>
          <div class="zip-code-wrapper clearfix">
            <input type="text" placeholder="Zip Code" id="BillingZip2" class="form-control small-input mandatory" name="BillingZip2">
            <span class="help-text">Enter Zip for City and State</span>
          </div>
		  <div class="save-billing-info">
			<input type="checkbox" id="save-billing-information" name="save-billing-information"><label for="save-billing-information">Save my default credit/debit card information</label>
		  </div>
        </div>
      </div>
    </div>
    <div class="button-wrapper">
      <button type="button" class="btn btn-secondary">Chat</button>
	  <input type="Submit" class="btn btn-primary pull-right" value="Continue">
    </div>
	</form>
  </section>
  <footer>
    <p class="copyright-text">Copyright 2017 demokart.com</p>
  </footer>
</body>

</html>