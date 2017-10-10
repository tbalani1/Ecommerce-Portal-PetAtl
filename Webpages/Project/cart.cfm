<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>PetAtl | Cart</title>
    <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
    <!--<link rel="stylesheet" href="css/font.css">-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
	<CFQUERY name="insertproductintocart" DBType="ODBC" datasource = "UnivDB">
	insert into cart values((select nvl(max(idcart),200) + 1 from cart), 2, 2014, 10003)
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
	<script type = "text/javascript">
	function removeFromCart()
	{
		var x = document.getElementById("myDIV");

        x.style.display = "none";
		var y = document.getElementById("myDIV2");

        y.style.display = "none";
		
		document.getElementById("cartCount").innerHTML = "Cart (" + 0 + ")";
	}
	</script>
</head>

<body>
    <header>
        <ul class="main-header clearfix">
            <li class="pull-left"><a href="products.cfm" class="main-logo white-text">PetAtl</a></li>
            <li><a href="#." class="cart white-text"><h3 id="cartCount">Cart (2)</h3></a></li>
        </ul>
    </header>
    <section>
        <h2>My Cart</h2>
        <div class="ordered-products">
            <div class="order-heading clearfix">
                <div class="image-heading">Product</div>
                <div class="details-heading">Details</div>
                <div class="price-section-heading">Price</div>
                <div class="edit-section-heading">Quantity</div>
            </div>
            <div class="product-wrapper clearfix" id = "myDIV">
				<CFOUTPUT query = "fetchProductFromCart">
                <div class="image"><img src="#IMAGE#"></div>
                <div class="details" style="text-align:center; float:center">
                    <h3 class="name">#PRODUCTNAME#</h3>
                    <p class="decription" >#productsize#</p>
                </div>
                <div class="price-section">
                    <h3>$#price#</h3>
                </div>
                <div class="edit-section" >
                    <input type="number" id="quantity" value="#quantity#" min="1" max="10" maxlength="2" placeholder="Qty">
                    <button type="button" class="btn btn-secondary" onclick = "removeFromCart()">Remove From Cart</button>
                </div>
				</CFOUTPUT>
            </div>
            <div class="subtotal-wrapper clearfix" id = "myDIV2">
                <h3 class="pull-right"><span>Subtotal</span> <span>(2 item): </span><span>$60.00</span></h3>
				<br/>
				<br/>
                <h3 class="pull-right"><span>Taxes</span> <span>: </span><span>$16.00</span></h3>
				<br/>
				<br/>
                <h3 class="pull-right"><span>Total</span> <span>(with taxes): </span><span>$76.00</span></h3>
            </div>
			<form name="ProceedToCheckout" action="payments.cfm" method="post">
            <div class="button-wrapper clearfix">
                <button type="submit" class="btn btn-primary pull-right">Proceed to Checkout</button>
            </div>
			</form>
        </div>
    </section>
    <footer>
        <p class="copyright-text">Copyright 2017 PetAtl.com</p>
    </footer>
</body>

</html>