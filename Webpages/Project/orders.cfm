<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>PetAtl | Order History</title>
    <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
    <!--<link rel="stylesheet" href="css/font.css">-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
	<cfif not isdefined("Form.checkoutForm")> 
	<cfset Form.checkoutForm = "No"> 
	</cfif>
	<CFQUERY NAME="OrderHistory" DATASOURCE="UnivDB" DBTYPE="ODBC">
		INSERT INTO ORDERHISTORY (IDORDER, ORDERNUM, ORDERDATE, IDADDRESS, IDCUSTOMER) 
		VALUES ((SELECT MAX(IDORDER)+1 FROM ORDERHISTORY),11203, '15-Nov-2017', (SELECT MAX(IDADDRESS) FROM ADDRESS), 2001)
	</CFQUERY>
	<CFQUERY NAME="OrderProduct" DATASOURCE="UnivDB" DBTYPE="ODBC">
		INSERT INTO ORDEREDPRODUCT (IDPRODUCT, IDORDER, GIFT, PRICE, PRICEPLUSTAX, DELIVERYDATE, STATUS) 
		VALUES (10004, (SELECT MAX(IDORDER) FROM ORDERHISTORY), 'Y', 60.00, 76.00, '15-Nov-2017', 'SHIPPED')
	</CFQUERY>
	<CFQUERY NAME="fetchinfo" DATASOURCE="UnivDB" DBTYPE="ODBC">
SELECT
    p.productname,
    p.IMAGE,
    p.PRICE,
	p.shortdescription,
	op.DELIVERYDATE,
    op.GIFT,
    ci.IDCUSTOMER,
    oh.IDORDER,
	op.STATUS,
    ci.FIRSTNAME,
    ci.LASTNAME,
	op.quantity,
	op.PRICEPLUSTAX
FROM
    product p,
    ORDEREDPRODUCT op,
    customerinfo ci,
    orderhistory oh
where p.IDPRODUCT = 10003
and p.idproduct = op.idproduct
and ci.idcustomer = oh.idcustomer
and oh.idorder = op.idorder
</CFQUERY>
</head>

<body>
    <header>
        <div class="sub-header">
	<cfoutput query = "fetchinfo">
		<span><a href="user-profile.cfm?custId=#IDCUSTOMER#">#FIRSTNAME# #LASTNAME# </a> | </span>
		<a href="login.cfm">Logout</a>
		</cfoutput>
		</div>
        <ul class="main-header clearfix">
            <li class="pull-left"><a href="products.cfm" class="main-logo white-text">PetAtl</a></li>
        </ul>
    </header>
    <section>
        <h2>Recent Orders</h2>
        <div class="ordered-products order-history">
            <div class="order-heading clearfix">
                <div class="image-heading">Product</div>
                <div class="details-heading">Details</div>
                <div class="price-section-heading">Total Price</div>
                <div class="edit-section-heading">Quantity</div>
                <div class="delivery-status-section-heading">Status</div>
            </div>
			<div class="product-wrapper clearfix">
			<CFOUTPUT query="fetchinfo"> 
                <div class="image"><img src="#IMAGE#"></div>
                <div class="details">
                    <h3 class="name">#ProductName#</h3>
                    <p class="decription">#shortdescription#</p>
                        <p class="order-placement-date">#DELIVERYDATE#</p>
                </div>
				<div class="price-section">
                    <h3>$#PRICEPLUSTAX#</h3>
                </div>
                <div class="edit-section">
                    <input type="number" id="quantity" min="1" max="10" maxlength="2" placeholder="Qty" value="#quantity#">
                </div>
				<div class="delivery-status-section">
                    <p>#status#</p>
                    <button type="button" class="btn btn-secondary">Cancel</button>
                </div>
			</CFOUTPUT>
			</div>
            <div class="button-wrapper clearfix">
                <button type="button" class="btn btn-primary pull-left">Back</button>
            </div>
        </div>
    </section>
    <footer>
        <p class="copyright-text">Copyright 2017 PetAtl.com</p>
    </footer>
</body>

</html>