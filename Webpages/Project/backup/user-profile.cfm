<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>PetAtl | User Profile</title>
    <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
    <!--<link rel="stylesheet" href="css/font.css">-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
	<CFQUERY NAME="CustomerDetails" DATASOURCE="UnivDB" DBTYPE="ODBC">
	select c.firstname, c.lastname, c.phone1, c.EMAILADDRESS, d.cardnumber, d.cvv, d.month, d.year
	from customerinfo c, creditcardinfo d
	where c.IDCUSTOMER = #URL.custId#
	and c.IDCUSTOMER = d.IDCUSTOMER
	</CFQUERY>
	<CFQUERY NAME="ShipDetails" DATASOURCE="UnivDB" DBTYPE="ODBC">
	select SUBSTR(c.phone1, 1, 3) as ship_p_areacode, substr(c.phone1,4) as ship_p_phone, 
	SUBSTR(c.phone2, 1, 3) as ship_s_areacode, substr(c.phone2,4) as ship_s_phone, c.emailaddress, 
	a.city, a.state, a.street, a.zipcode , a.addresstype
	from customerinfo c inner join address a
	on c.idcustomer=a.idcustomer
	where a.addresstype='Ship' and c.idcustomer=#URL.custId#
	</CFQUERY>
</head>

<body>
    <header>
        <div class="sub-header">
					<CFOUTPUT query="CustomerDetails">
		<span>#FIRSTNAME# #LASTNAME# | </span><a href="login.cfm">Logout</a>
					</CFOUTPUT>
		</div>
        <ul class="main-header clearfix">
            <li class="pull-left"><a href="#." class="main-logo white-text">PetAtl</a></li>
            <li><a href="orders.cfm" class="orders white-text">Orders</a></li>
            <li><a href="#." class="cart white-text">Cart (0)</a></li>
        </ul>
    </header>
    <section>
        <h2>My Profile</h2>
        <div class="user-profile-section clearfix">
            <div class="personal-details-wrapper">
                <div class="personal-details">
                    <h3>Personal Details</h3>
					<CFOUTPUT query="CustomerDetails">
                    <label>Name<span class="mandatory-star">*</span></label>
                    <input type="text" class="form-control" value="#FIRSTNAME# #LASTNAME#">
                    <label>Phone Number<span class="mandatory-star">*</span></label>
                    <input type="text" class="form-control" value="#phone1#">
                    <label>Email<span class="mandatory-star">*</span></label>
                    <input type="email" class="form-control" value="#EMAILADDRESS#">
					</CFOUTPUT>
                </div>
            </div>
            <div class="select-address-wrapper new-shipping-address-details clearfix">
                <h3>Shipping Address</h3>
                <div class="contact shipping-contact clearfix">
                    <p class="heading">Shipping Contact</p>
				<CFOUTPUT query="CustomerDetails">
                    <div class="small-input">
                        <label>First Name<span class="mandatory-star">*</span></label>
                        <input type="text" placeholder="First Name" class="form-control" value="#FIRSTNAME#">
                    </div>
                    <div class="big-input">
                        <label>Last Name<span class="mandatory-star">*</span></label>
                        <input type="text" placeholder="Last Name" class="form-control" value="#LASTNAME#">
                    </div>
					</CFOUTPUT>
				<CFOUTPUT query="ShipDetails">
                    <div class="small-input">
                        <label>Area Code<span class="mandatory-star">*</span></label>
                        <input type="text" placeholder="Area Code" class="form-control" value="#ship_p_areacode#">
                    </div>
                    <div class="big-input">
                        <label>Primary Phone<span class="mandatory-star">*</span></label>
                        <input type="text" placeholder="Primary Phone" class="form-control" value="#ship_p_phone#">
                    </div>
                    <div class="small-input">
                        <label>Area Code</label>
                        <input type="text" placeholder="Area Code" class="form-control" value="#ship_s_areacode#">
                    </div>
                    <div class="big-input">
                        <label>Alternate Phone</label>
                        <input type="text" placeholder="Alternate Phone (optional)" class="form-control" value="#ship_s_phone#">
                    </div>
                    <div class="full-width">
                        <label>Email<span class="mandatory-star">*</span></label>
                        <input type="email" placeholder="Email Address" class="form-control" value="#EMAILADDRESS#">
                    </div>
                </div>
                <div class="address shipping-address clearfix">
                    <p class="heading">Shipping Address</p>
                    <div class="full-width">
                        <label>Street Address<span class="mandatory-star">*</span></label>
                        <input type="text" placeholder="Street Address" class="form-control" value="#STREET#">
                    </div>
                    <div class="full-width">
                        <label>City, State</label>
                        <input type="text" placeholder="City, State" class="form-control full-width" value="#CITY#, #STATE#">
                    </div>
                    <div class="zip-code-wrapper clearfix">
                        <div class="small-input">
                            <label>Zip Code<span class="mandatory-star">*</span></label>
                            <input type="text" placeholder="Zip Code" class="form-control" value="#ZIPCODE#">
                        </div>
                    </div>
                </div>
				</CFOUTPUT>
            </div>
            <div class="payment-mode-wrapper">
                <h3>Saved Card Details</h3>
                <div class="clearfix">
				<CFOUTPUT query="CustomerDetails">
                    <div class="big-input">
                        <label>Debit/Credit Card Number<span class="mandatory-star">*</span></label>
                        <input type="text" placeholder="Debit/Credit Card Number" class="form-control" value="#CARDNUMBER#">
                    </div>
                    <div class="small-input margin-left-10">
                        <label>Security Code<span class="mandatory-star">*</span></label>
                        <input type="text" placeholder="Security Code" class="form-control" value="#CVV#">
                    </div>
                    <div class="small-input">
                        <label>Month<span class="mandatory-star">*</span></label>
						<input type="text" placeholder="Security Code" class="form-control" value="#MONTH#">
                    </div>
                    <div class="small-input">
                        <label>Year<span class="mandatory-star">*</span></label>
						<input type="text" placeholder="Security Code" class="form-control" value="#YEAR#">
                    </div>
					</CFOUTPUT>
                </div>
            </div>
        </div>
        <div class="button-wrapper">
            <button type="button" class="btn btn-primary">Back</button>
            <button type="button" class="btn btn-primary pull-right">Update</button>
        </div>
    </section>
    <footer>
        <p class="copyright-text">Copyright 2017 demokart.com</p>
    </footer>
</body>

</html>