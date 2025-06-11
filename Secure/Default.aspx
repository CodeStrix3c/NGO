<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="../Control/Login.ascx" TagName="Login" TagPrefix="ccl" %>
<%@ Register Src="../Control/Footer.ascx" TagName="Footer" TagPrefix="ccl" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login Page</title>
    <link href="Style/Admin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            width: 600px;
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div style="padding-left:150px">
<img src="images/BE_logo.jpg" width="980" height="150" alt=""/>
</div>
<div style="background-color:Blue; height:25px">
</div>
       <div style="padding-left:150px">
<div style="padding-left:160px">
<img src="images/login.png" alt="" width="600" height="200" />
<div style="background-color:Black; border-top-left-radius:10px; border-top-right-radius:10px; border-bottom-right-radius:10px; border-bottom-left-radius:10px" 
        class="style2"></div>
</div>
 <div style="background-color:Blue">

 </div>
<div class="boxed">
    <div style="padding-left:300px; padding-top:20px">
       <ccl:Login ID="login" runat="Server" />
        
    </div>
    <div style="padding-left:130px; padding-top:20px">
   <div style="background-color:Black; width:600px; height:25px; border-top-left-radius:10px; border-top-right-radius:10px; border-bottom-right-radius:10px; border-bottom-left-radius:10px"></div>
   </div>
</div>
 <div style="background-color:Blue"></div>
</div>
        <ccl:Footer ID="footer" runat="Server" />
        
    </form>
</body>
</html>
