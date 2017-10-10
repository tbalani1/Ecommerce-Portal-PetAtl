<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>PetAtl | Home</title>
  <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
  <!--<link rel="stylesheet" href="css/font.css">-->
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/global.css">
<script type="text/javascript">
</script>
  <CFQUERY NAME="FetchProducts" DATASOURCE="UnivDB" DBTYPE="ODBC">
SELECT
    p.productname,
    p.BESTSELLING,
    p.IMAGE,
    p.SHORTDESCRIPTION,
    p.LONGDESCRIPTION,
    p.PRICE,
	p.idproduct,
	s.sellername
FROM
    product p,
    seller s
where p.IDSELLER = s.IDSELLER
</CFQUERY>

</head>

<body>
  <header>
    <div class="main-header">
	<a href="products.cfm" class="main-logo white-text">PetAtl</a>
	<a href="#." class="cart white-text"><h3 id="cartCount">Cart (0)</h3></a>
	</div>
  </header>
  <section>
    <h2>Products</h2>
    <div class="products clearfix">
	  <CFOUTPUT query = "FetchProducts">
      <div class="product-wrapper">
        <div class="image"><a href="product-description.cfm?idproduct=#idproduct#"><img src="#image#"></a></div>
        <div class="details">
          <h3 class="name"><a href="product-description.cfm?idproduct=#idproduct#">#productname#</a></h3>
          <p class="decription">by #sellername#</p>
          <h4 class="price">$#PRICE#</h4>
          <p class="decription">#SHORTDESCRIPTION#</p>
          <p class="rating">
            <img src="images/star_yellow.png">
            <img src="images/star_yellow.png">
            <img src="images/star_yellow.png">
            <img src="images/star_white.png">
            <img src="images/star_white.png">
          </p>
		  <p></p>
        </div>
      </div>
	  </CFOUTPUT>
      </div>
    </div>
  </section>
  <footer>
    <p class="copyright-text">Copyright 2017 VAST</p>
  </footer>
</body>

</html>