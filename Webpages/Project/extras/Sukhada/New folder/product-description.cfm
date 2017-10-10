<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>PetAtl | Product</title>
  <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
  <!--<link rel="stylesheet" href="css/font.css">-->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/global.css">
  <script type = "text/javascript">
  function addToCart(){
	var count = document.getElementById("quantity").value;
	if (count != null || count == ""){
		document.getElementById("cartCount").value = count;
	} else {
		document.getElementById("cartCount").value = 0;
	}
  }
  
  </script>
  <CFQUERY NAME = "fetchproductdetails" DATASOURCE="UnivDB" DBTYPE="ODBC">
  SELECT
    pd.DIMENSIONS,
    pd.FLAVOURS,
    pd.IDDETAILS,
    p.IDPRODUCT,
    p.LONGDESCRIPTION,
    p.SHORTDESCRIPTION,
    p.AVAILABILITY,
    p.BESTSELLING,
    p.PRICE,
    p.PRODUCTNAME,
    p.IMAGE,
    s.SELLERNAME,
    s.RATING as sellerrating
FROM
    productsize ps,
    productdetail pd,
    product p,
    seller s
WHERE
    p.idproduct = ps.idproduct
    and ps.IDPRODUCTSIZE = pd.IDPRODUCTSIZE
    and p.idseller = s.idseller
    and p.IDPRODUCT = '#URL.idproduct#'
  </CFQUERY>
  <CFQUERY NAME = "fetchproductdesc" DATASOURCE="UnivDB" DBTYPE="ODBC">
  SELECT
    pd.DIMENSIONS,
    pd.FLAVOURS,
    pd.IDDETAILS,
	pd.actualweight,
	pd.shippingweight,
    p.IDPRODUCT,
    ps.IDPRODUCTSIZE,
    ps.PRODUCTSIZE,
    ps.QUANTITYAVAILABLE,
    p.LONGDESCRIPTION,
    p.SHORTDESCRIPTION,
    p.AVAILABILITY,
    p.BESTSELLING,
    p.PRICE,
    p.PRODUCTNAME,
    p.IMAGE,
    s.SELLERNAME,
    s.RATING as sellerrating
FROM
    productsize ps,
    productdetail pd,
    product p,
    seller s
WHERE
    p.idproduct = ps.idproduct
    and ps.IDPRODUCTSIZE = pd.IDPRODUCTSIZE
    and p.idseller = s.idseller
    and p.IDPRODUCT = '#URL.idproduct#'
  </CFQUERY>
  <CFQUERY name="fetchReview" DATASOURCE="UnivDB" DBTYPE="ODBC">
  select p.idproduct ,
	avg(r.RATING) as avgRating,
	(select CUSTOMERCOMMENT from REVIEW r, product p where r.idproduct = p.idproduct and p.idproduct = '#URL.idproduct#' and rownum = 1) as customercomment
	from REVIEW r, product p
	where r.idproduct = p.idproduct
	and p.idproduct = '#URL.idproduct#'
	group by p.idproduct
  </CFQUERY>
  <CFQUERY name="maxQuantity" DATASOURCE="UnivDB" DBTYPE="ODBC">
	select count(Quantity) as quantityCount from cart;
  </CFQUERY>
</head>

<body>
  <header>
    <div class="main-header"><a href="products.cfm" class="main-logo white-text">PetAtl</a>
	<a href="cart.cfm" class="cart white-text"><h3 id="cartCount">Cart (#quantityCount#)</h3></a>
	
	</div>
  </header>
  <section>
    <h2>Product Details</h2>
    <div class="main-product">
      <div class="product-wrapper clearfix">
        <div class="right-wrapper">
		<CFOUTPUT query="fetchproductdetails">
          <div class="image"><img src="#IMAGE#"></div>
		</CFOUTPUT>
          <div class="details">
		  <CFOUTPUT query="fetchproductdetails">
            <h2 class="name">#PRODUCTNAME#</h2>
            <p class="subtext">By #sellername#</p>
            <h4 class="price">$#PRICE#<span class="in-stock"> | In Stock</span></h4>
            <!-- <h4 type = "hidden" class="price">$#PRICE#<span class="out-of-stock"> | Out of Stock</span></h4> -->
			</CFOUTPUT>
			<hr/>
			<h4>Size:</h4>
            <ul class="size-options">
			<CFOUTPUT query="fetchproductdesc">
              <li>#PRODUCTSIZE#</li>
              <!--<li class="selected">6 lb</li>-->
			</CFOUTPUT>
			<hr/>
			<h4> Features: </h4>
            </ul>
            <!-- <p class="selected-size"><span class="bold-text"> </span><span>6 lb</span></p> -->
            <p class="decription">
            </p>
            <ul class="product-points">
			<CFOUTPUT query="fetchproductdesc">
              <li>#PRODUCTSIZE#</li>
              <!--<li class="selected">6 lb</li>-->
			</CFOUTPUT>
			<CFOUTPUT query="fetchproductdetails">
              <li>#SHORTDESCRIPTION#</li>
			</CFOUTPUT>
            </ul>
          </div>
        </div>
		<form name="proddesc" action="cart.cfm?prodId=#idproduct#" method="post">
        <div class="order-placement">
          <label for="quantity">Quantity: </label> 
		  <input type="number" name="quantity" id="quantity" min="1" max="10" maxlength="2" placeholder="Qty"/>
          <button type="button" class="btn btn-primary" onclick = "addToCart()">Add to Cart</button>
          <hr />
          <h3>Customer Rating</h3>
          <p class="rating">
            <img src="images/star_yellow.png">
            <img src="images/star_yellow.png">
            <img src="images/star_yellow.png">
            <img src="images/star_white.png">
            <img src="images/star_white.png">
          </p>
		  <CFOUTPUT query="fetchReview">
          <p class="subtext">#avgRating# out of 5</p>
          <!-- Round off kar lena yahan pe yellow stars ko -->
          <hr />
          <h3>Reviews</h3>
          <p class="review-text" >#customercomment#</p>
		  </CFOUTPUT>
        </div>
		</form>
      </div>
      <div class="product-details">
        <h4 class="main-heading">Product Details</h4>
		<CFOUTPUT query="fetchproductdesc">
        <p class="small-text">Flavour name: #flavours# | Size: #productsize#</p>
        <p>#shortdescription#</p>
        <ul>
          <li><span class="bold-text">Size: </span>#productsize#</li>
          <li><span class="bold-text">Dimensions: </span>#DIMENSIONS# inches</li>
          <li><span class="bold-text">Product Weight: </span>#actualweight# lbs</li>
          <li><span class="bold-text">Shipping weight: </span>#shippingweight# lbs</li>
          <li><span class="bold-text">Flavour: </span>#flavours#</li>
          <li><span class="bold-text">Item model number: </span>ITM#iddetails#</li>
		</ul>
		</CFOUTPUT>
      </div>
      <div class="product-description">
        <h4 class="main-heading">Product Description</h4>
		<CFOUTPUT query="fetchproductdesc">
        <p class="small-text">Flavour name: #flavours# | Size: #productsize#</p>
		</CFOUTPUT>
        <h5 class="sub-heading">Product Description</h5>
		<CFOUTPUT query="fetchproductdetails">
        <p>#SHORTDESCRIPTION#</p>
        <h5 class="sub-heading">From the Manufacturer</h5>
        <p>#LONGDESCRIPTION#</p>
		</CFOUTPUT>
      </div>
    </div>
  </section>
  <footer>
    <p class="copyright-text">Copyright 2017 by VAST</p>
  </footer>
</body>

</html>