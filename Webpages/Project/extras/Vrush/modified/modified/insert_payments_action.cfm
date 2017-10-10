<html> 
<head> 
<title>Input form</title> 
</head> 

<body> 
<cfif not isdefined("Form.PaymentForm")> 
<cfset Form.PaymentForm = "No"> 
</cfif> 

<CFQUERY NAME="AddCustomerInfo" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO CUSTOMERINFO (IDCustomer, FIRSTNAME, LASTNAME, PHONENUMBER, PHONENUMBER2, EMAILADDRESS, PASSWORD)
			VALUES ((select (max(idcustomer)+1) from customerinfo), '#Form.customerFName#', '#Form.customerLName#', '#Form.phoneNumberP#','#Form.phoneNumberS#', '#Form.email#', '#Form.password#')
		  </CFQUERY>
		  
<CFQUERY NAME="AddShippingAddress" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO ADDRESS (IDADDRESS, STREET, CITY, STATE, ZIPCODE, ADDRESSTYPE, DEFAULTADDRESS, IDCUSTOMER)
			VALUES ((select (max(idaddress)+1) from address), '#Form.StreetAddress#', 'Georgia', 'Atlanta', '#Form.ZipCode1#', 'Ship', 1, (select max(idcustomer) from customerinfo))
		  </CFQUERY>

<CFQUERY NAME="AddBillingAddress" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO ADDRESS (IDADDRESS, STREET, CITY, STATE, ZIPCODE, ADDRESSTYPE, DEFAULTADDRESS, IDCUSTOMER)
			VALUES ((select (max(idaddress)+1) from address), '#Form.BillingStAddr#', 'Georgia', 'Atlanta', '#Form.BillingZip1#', 'Bill', 0, (select max(idcustomer) from customerinfo))
		  </CFQUERY>

<CFQUERY NAME="AddCustomerInfo2" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO CUSTOMERINFO (IDCustomer, FIRSTNAME, LASTNAME, PHONENUMBER,PHONENUMBER2, EMAILADDRESS)
			VALUES ((select (max(idcustomer)+1) from customerinfo), '#Form.BillingFName#', '#Form.BillingLName#','#BillingPPhone#', '#Form.BillingAPhone#', '#Form.BillingEmail#')
		  </CFQUERY>
		  
<CFQUERY NAME="CREDITCARDINFO" DATASOURCE="UnivDB" DBTYPE="ODBC">
			INSERT INTO CREDITCARDINFO (CARDTYPE, CARDNUMBER, CVV, MONTH, YEAR, NAMEONCARD, IDCUSTOMER)
			VALUES ('MasterCard', '#Form.DebitCreditCard#', '#Form.SecurityCode#', '#Form.Mon#','#Form.Year#','#Form.NameOnCard#', (select (max(idcustomer)) from customerinfo))
		  </CFQUERY>	
		  
<h1>Customer Added</h1> 
<cfoutput>You have added #Form.customerFName# #Form.customerLName# to the Customer database. 
</cfoutput> 

</body> 
</html>


<!--
Name           Null?    Type         
-------------- -------- ------------ 
IDADDRESS      NOT NULL NUMBER(5)    
STREET         NOT NULL VARCHAR2(30) 
CITY           NOT NULL VARCHAR2(30) 
STATE          NOT NULL VARCHAR2(30) 
ZIPCODE        NOT NULL NUMBER(5)    
ADDRESSTYPE    NOT NULL VARCHAR2(30) 
DEFAULTADDRESS NOT NULL VARCHAR2(1)  
IDCUSTOMER              NUMBER(5)    
 -->