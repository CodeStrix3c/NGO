<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exportExcel.aspx.cs" Inherits="Secure_exportExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Registrations</h3>
            <fieldset>
                <legend>List below:</legend>
                <table>
                    <tr>
                        <td align="left" valign="top" style="height: 30px">
                            <asp:Button ID="btnExcel" runat="server" Text="Save Excel" OnClick="btnExcel_Click" />
                        </td>
                    </tr>
                </table>
                <b>
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></b>
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td align="left" valign="top">
                                <asp:Literal ID="ltrDetails" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>

        </div>
    </form>
</body>
</html>
