<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Photos.aspx.cs" Inherits="FazilKashmir_Ad_Default2" Title="Add Photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
    <h3>Photos</h3>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td align="left" valign="top">
<table cellpadding="0" cellspacing="0" border="0" >
<tr>
<td align="left" valign="top">
<fieldset>
<legend>Add Photos</legend>
<table >
<tr>
<td align="right" valign="top" >
Select Image : 
</td>
<td align="left" valign="top">
<asp:FileUpload ID="Ofile" runat="server" />
<asp:RequiredFieldValidator runat="server" id="rfv" ControlToValidate="Ofile" ErrorMessage="Image is required" Display="Dynamic" ValidationGroup="AddPhotos"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right" valign="top" >
Caption : 
</td>
<td align="left" valign="top">
<input type="text" runat="server" id="caption"  />
<asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="caption" ErrorMessage="Caption is required" Display="Dynamic" ValidationGroup="AddPhotos"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right" valign="top" >
</td>
<td align="right" valign="top">
<asp:ImageButton ID="imgAdd" runat="server" ImageUrl="../AlbumImages/button-save.gif"  OnClick="imgAdd_Click" ValidationGroup="AddPhotos" OnClientClick="return Photos()" />
</td>
</tr>
</table>
</fieldset>

</td>

</tr>
</table>
</td>
<td align="left" valign="top" >
<table cellpadding="0" cellspacing="0" border="0" width="300px" >
<tr>
<td align="left" valign="top">
<fieldset>
<legend>Photos in This Album</legend>
<asp:gridview id="GridView1" runat="server" 
datakeynames="PhotoID" cellpadding="3"  OnPageIndexChanging="GridView1_PageIndexChanged"
autogeneratecolumns="False" BorderStyle="None" BorderWidth="0px"
width="100%" showheader="False" AllowPaging="True"
OnRowCancelingEdit="GridView1_RowCancelingEdit" 
OnRowDeleting="GridView1_RowDeleting" 
OnRowEditing="GridView1_RowEditing" 
OnRowUpdating="GridView1_RowUpdating" 
OnRowCommand="GridView1_RowCommand"
> 
<EmptyDataRowStyle CssClass="emptydata"></EmptyDataRowStyle>
<EmptyDataTemplate>
You currently have no photos.
</EmptyDataTemplate>
<columns>
<asp:TemplateField>
<ItemTemplate>
<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
<tr>
<td class="topx--"></td>
<td class="top-x-"></td>
<td class="top--x"></td>
</tr>
<tr>
<td class="midx--"></td>
<td>
<img src='../Control/ShowImage.aspx?Size=S&PhotoID=<%# Eval("PhotoID") %>' class="photo_198" style="border:2px solid white;width:50px;" alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' /></td>
<td class="mid--x"></td>
</tr>
<tr>
<td class="botx--"></td>
<td class="bot-x-"></td>
<td class="bot--x"></td>
</tr>
</table>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField>
<ItemTemplate>
<asp:Label ID="lblcaption" runat="Server" Text='<%#Eval("Caption") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="txtCaption" runat="Server" Text='<%#Eval("Caption")%>' ></asp:TextBox>
<asp:RequiredFieldValidator runat="server" id="rfv" ControlToValidate="txtCaption" ErrorMessage="Caption is required" Display="Dynamic" ValidationGroup="Photos"></asp:RequiredFieldValidator>
</EditItemTemplate>
</asp:TemplateField>
<asp:TemplateField>
<ItemTemplate>
<div style="width:100%;text-align:right;">
<asp:ImageButton ID="ImageButton2" Runat="server" CommandName="Edit" ImageUrl="../AlbumImages/button-edit.gif"  CausesValidation="false" />
<asp:ImageButton ID="ImageButton3" Runat="server" CommandName="Delete"  ImageUrl="../AlbumImages/button-delete.gif"  CausesValidation="False" OnClientClick = "return confirm('Do you want to delete?')" />
</div>
</ItemTemplate>
<EditItemTemplate>
<div style="width:100%;text-align:right;">
<asp:ImageButton ID="ImageButton4" Runat="server" CommandName="Update" ImageUrl="../AlbumImages/button-save.gif"  ValidationGroup="Photos"  />
<asp:ImageButton ID="ImageButton5" Runat="server" CommandName="Cancel" ImageUrl="../AlbumImages/button-cancel.gif" CausesValidation="False"   />
</div>
</EditItemTemplate>
</asp:TemplateField>
</columns>
</asp:gridview>
</fieldset>

</td>
</tr>
</table>
</td>
</tr>
</table>
</asp:Content>

