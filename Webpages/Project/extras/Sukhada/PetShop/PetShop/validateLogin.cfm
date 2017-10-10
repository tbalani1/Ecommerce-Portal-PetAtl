<html> 
<head> 
<title>Input form</title> 
</head> 

<body> 
<!--- If the Contractor check box is clear), set the value of the Form.PaymentForm 
to "No" ---> 
<cfif not isdefined("Form.loginForm")> 
	<cfset Form.loginForm = "No"> 
	</cfif>
	
	<CFQUERY NAME="CustomerPassword" DATASOURCE="UnivDB" DBTYPE="ODBC">
		SELECT PASSWORD,IDCUSTOMER FROM CUSTOMERINFO WHERE EMAILADDRESS = '#Form.loginUsername#'
	</CFQUERY>
	<CFOUTPUT query="CustomerPassword">
	#password#
		<CFIF #password# NEQ #Form.loginPassword#>
			<CFLOCATION addtoken="no" url="http://localhost:8500/PetShop/login.cfm">
		<CFELSE>
			<CFLOCATION addtoken="no" url="http://localhost:8500/PetShop/checkout.cfm?custId=#IDCUSTOMER#">
		</CFIF>
	</CFOUTPUT>

</body> 
</html>