<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsletter.aspx.cs" Inherits="newsletter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br /><br />
        Name : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br /><br />
        Email : <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="btnSend" runat="server" Text="Send" />
    
    </div>
    </form>
</body>
</html>
