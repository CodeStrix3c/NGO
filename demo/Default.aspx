﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head>
<script>
    window.onload = function () {
        var d = new Date().getTime();
        document.getElementById("tid").value = d;
    };
</script>
</head>
<body>
    <form method="post" name="customerData" action="ccavRequestHandler.aspx">
    <table width="40%" height="100" border='1' align="center"><caption><font size="4" color="blue"><b>Integration Kit</b></font></caption></table>
    <table width="40%" height="100" border='1' align="center">
         <tr> 
            <td>Parameter Name:</td>
            <td>Parameter Value:</td>
         </tr>
         <tr> 
            <td colspan="2"> Compulsory information</td>
         </tr>
	<tr>
		<td>TID	:</td><td><input type="text" name="tid" id="tid" readonly /></td>
	</tr>
         <tr>
            <td>Merchant Id</td>
            <td><input type="text" name="merchant_id" id="merchant_id" value="179737"/></td>
         </tr>
         <tr>
            <td>Order Id</td>
            <td><input type="text" name="order_id" value="123654789"/></td>
         </tr>
         <tr>
            <td>Amount</td>
            <td><input type="text" name="amount" value="1.00"/></td>
         </tr>
         <tr>
            <td>Currency</td>
            <td><input type="text" name="currency" value="INR"/></td>
         </tr>
         <tr>
            <td>Redirect URL</td>
            <td><input type="text" name="redirect_url" value="ccavResponseHandler.aspx"/></td>
         </tr>
	     <tr>
            <td>Cancel URL</td>
            <td><input type="text" name="cancel_url" value="ccavResponseHandler.php"/></td>
         </tr>
         <tr>
            <td colspan="2">Billing information(optional):</td>
         </tr>
         <tr>
            <td>Billing Name</td>
            <td><input type="text" name="billing_name" value="Charli"/></td>
         </tr>
         <tr>
            <td>Billing Address:</td>
            <td><input type="text" name="billing_address" value="Room no 1101, near Railway station Ambad"/></td>
         </tr>
         <tr>
            <td>Billing City:</td>
            <td><input type="text" name="billing_city" value="Indore"/></td>
         </tr>
         <tr>
            <td>Billing State:</td>
            <td><input type="text" name="billing_state" value="MP"/></td>
         </tr>
         <tr>
            <td>Billing Zip:</td>
            <td><input type="text" name="billing_zip" value="425001"/></td>
         </tr>
         <tr>
            <td>Billing Country:</td>
            <td><input type="text" name="billing_country" value="India"/></td>
         </tr>
         <tr>
            <td>Billing Tel:</td>
            <td><input type="text" name="billing_tel" value="9899622605"/></td>
         </tr>
         <tr>
            <td>Billing Email:</td>
            <td><input type="text" name="billing_email" value="test@gmail.com"/></td>
         </tr>
         <tr>
           <td colspan="2">Shipping information(optional):</td>
         </tr>
         <tr>
            <td>Shipping Name</td>
            <td><input type="text" name="delivery_name" value="Chaplin"/></td>
         </tr>
         <tr>
            <td>Shipping Address:</td>
            <td><input type="text" name="delivery_address" value="room no.701 near bus stand"/></td>
         </tr>
         <tr>
            <td>shipping City:</td>
            <td><input type="text" name="delivery_city" value="Hyderabad"/></td>
         </tr>
         <tr>
            <td>shipping State:</td>
            <td><input type="text" name="delivery_state" value="Andhra"/></td>
         </tr>
         <tr>
            <td>shipping Zip:</td>
            <td><input type="text" name="delivery_zip" value="425001"/></td>
         </tr>
         <tr>
            <td>shipping Country:</td>
            <td><input type="text" name="delivery_country" value="India"/></td>
         </tr>
         <tr>
            <td>Shipping Tel:</td>
            <td><input type="text" name="delivery_tel" value="9896426054"/></td>
         </tr>
         <tr>
            <td>Merchant Param1</td>
            <td><input type="text" name="merchant_param1" value="additional Info."/></td>
         </tr>
         <tr>
            <td>Merchant Param2</td>
            <td><input type="text" name="merchant_param2" value="additional Info."/></td>
         </tr>
	    <tr>
            <td>Merchant Param3</td>
            <td><input type="text" name="merchant_param3" value="additional Info."/></td>
         </tr>
	    <tr>
            <td>Merchant Param4</td>
            <td><input type="text" name="merchant_param4" value="additional Info."/></td>
         </tr>
	    <tr>
            <td>Merchant Param5</td>
            <td><input type="text" name="merchant_param5" value="additional Info."/></td>
        </tr>
         <tr>
            <td>Promo Code</td>
            <td><input type="text" name="promo_code" /></td>
         </tr>
         <tr>
            <td>Customer Id:</td>
            <td><input type="text" name="customer_identifier" /></td>
         </tr>
         <tr>
          	<td></td>
			<td><input type="submit" value="Checkout" /></td>
         </tr>
    </table>
    </form>
</body>
</html>

