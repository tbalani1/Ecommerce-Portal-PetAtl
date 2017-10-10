<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>PetAtl | Checkout</title>
    <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
    <!--<link rel="stylesheet" href="css/font.css">-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
	<CFQUERY NAME="ShippingAddress" DATASOURCE="UnivDB" DBTYPE="ODBC">
		SELECT a.STREET, a.CITY, a.STATE, a.ZIPCODE, ci.FIRSTNAME, ci.LASTNAME, ci.IDCUSTOMER
		FROM ADDRESS a, CUSTOMERINFO ci  WHERE a.ADDRESSTYPE = 'Ship' AND ci.IDCUSTOMER = #URL.custId# and a.idcustomer =ci.idcustomer
	</CFQUERY>
	<CFQUERY NAME="PaymentDetails" DATASOURCE="UnivDB" DBTYPE="ODBC">
		SELECT CardNumber FROM CreditCardInfo WHERE IDCUSTOMER = #URL.custId#
	</CFQUERY>
	<CFQUERY name="fetchProductFromCart" dbtype = "ODBC" datasource = "UnivDB">
	 SELECT
    c.quantity,
    p.IDPRODUCT,
    p.PRODUCTNAME,
    p.IMAGE,
    (select ps.PRODUCTSIZE from PRODUCTSIZE ps, product p where p.IDPRODUCT = ps.IDPRODUCT and rownum=1) as Productsize,
    p.PRICE    
	FROM    cart c,    product p
	WHERE c.idproduct = p.idproduct
    and p.IDPRODUCT = 10003
	and rownum = 1
	</CFQUERY>
	<CFOUTPUT query="PaymentDetails"> 
		<cfset CardModulus = 4521>
		<cfset customerID = #URL.custId#>
	</CFOUTPUT>
</head>

<body>
    <header>
        <div class="sub-header">
		<CFOUTPUT query = "ShippingAddress">
		<span>
		<a href="user-profile.cfm?custId=#IDCUSTOMER#">#FIRSTNAME# #LASTNAME# </a>| </span><a href="login.cfm">Logout</a></div>
		</CFOUTPUT>
        <ul class="main-header clearfix">
            <li class="pull-left"><a href="#." class="main-logo white-text">PetAtl</a></li>
            <li><a href="cart.cfm" class="cart white-text">Cart (2)</a></li>
        </ul>
    </header>
    <section>
	 <form name="checkoutForm" action="orders.cfm" method="post">
        <h2>My Cart</h2>
        <ul class="order-id">
            <li>Order Date: <span>October 4, 2017</span></li>
            <li>Order Id: <span>054M6546K9857</span></li>
        </ul>
        <div class="order-details clearfix">
            <div class="shipping-address">
                <h4 class="bold-text">Shipping Address</h4>
				<CFOUTPUT query="ShippingAddress">
                <p>#FIRSTNAME# #LASTNAME#</p>
                <p>#STREET#</p>
                <p>#CITY# #STATE# #ZIPCODE#</p>
				<p>United State</p>
				</CFOUTPUT>
            </div>
            <div class="order-card-details">
                <h4 class="bold-text">Payment Method</h4>
				<CFOUTPUT query="PaymentDetails">
                <p>**** **** **** #CardModulus#</p>
				</CFOUTPUT>
            </div>
            <div class="gift-card-section">
                <h4 class="bold-text">Apply Gift Card</h4>
                <input type="text" class="form-control">
                <button type="button" class="btn btn-primary">Apply</button>
            </div>
            <div class="order-payment-summary">
                <h4 class="bold-text">Order Summary</h4>
                <p><span>Item(s) Subtotal:</span><span>$60.00</span></p>
                <p><span>Shipping &amp; Handling:</span><span>$5.00</span></p>
                <p><span>Free Shipping:</span><span>-$5.00</span></p>
                <p><span>Total before tax:</span><span>60.00</span></p>
                <p><span>Estimated tax to be collected:</span><span>$16.00</span></p>
                <hr />
                <p class="bold-text"><span>Grand Total:</span><span>$76.00</span></p>
            </div>
        </div>
        <div class="ordered-products">
            <div class="product-wrapper clearfix">
			<CFOUTPUT query="fetchProductFromCart"> 
                <div class="image"><img src="#IMAGE#"></div>
                <div class="details">
                    <h3 class="name">#PRODUCTNAME#</h3>
                    <h4 class="price" name="Price">$#price#</h4>
                    <p class="decription">#productsize#</p>
                </div>
                <div class="edit-section">
                    <label for="quantity">Quantity: </label> <input type="number" id="quantity" value="#quantity#" min="1" max="10" maxlength="2"
                        placeholder="Qty">
                    <button type="button" class="btn btn-secondary">Delete</button>
                </div>
			</CFOUTPUT>
            </div>
        </div>
        <div class="button-wrapper clearfix">
            <button type="submit" class="btn btn-primary pull-right">Place Order</button>
			<!-- <button type="submit" class="btn btn-primary pull-right" onclick="location.href = 'http://127.0.0.1:8500/Project/orders.cfm?custId="+customerID+";'">Place Order</button> -->
        </div>
		</form>
    </section>
    <footer>
        <p class="copyright-text">Copyright 2017 PetAtl.com</p>
    </footer>
</body>

</html>