<html> 
<head> 
<title>Input form</title> 
<CFQUERY NAME="ShippingAddress" DATASOURCE="UnivDB">
		SELECT a.STREET, a.CITY, a.STATE, a.ZIPCODE, ci.FIRSTNAME, ci.LASTNAME
		FROM ADDRESS a, CUSTOMERINFO ci
		WHERE a.ADDRESSTYPE = 'Ship' AND ci.IDCUSTOMER = '34575'
	</CFQUERY>
</head> 

<body> 
	
	
	United State
	<CFOUTPUT query="ShippingAddress">
                #STREET#
	</CFOUTPUT>

</body> 
</html>