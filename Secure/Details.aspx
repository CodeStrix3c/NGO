<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="FazilKashmir_Ad_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
<h3>Detail</h3>
 <asp:formview id="FormView1" runat="server"  cssclass="view" OnPageIndexChanging="FormView1_PageIndexChanged"
			borderstyle="none" borderwidth="0" CellPadding="0" cellspacing="0" EnableViewState="false">
			<itemtemplate>
				<p><%# Server.HtmlEncode(Eval("Caption").ToString()) %></p>
				<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
					<tr>
						<td class="topx--"></td>
						<td class="top-x-"></td>
						<td class="top--x"></td>
					</tr>
					<tr>
						<td class="midx--"></td>
						<td><img src="../Control/ShowImage.aspx?PhotoID=<%# Eval("PhotoID") %>&Size=L" class="photo_198" style="border:4px solid white" alt='Photo Number <%# Eval("PhotoID") %>' /></a></td>
						<td class="mid--x"></td>
					</tr>
					<tr>
						<td class="botx--"></td>
						<td class="bot-x-"></td>
						<td class="bot--x"></td>
					</tr>
				</table>
				<p>&nbsp;</p>
			</itemtemplate>
		</asp:formview>
</asp:Content>

