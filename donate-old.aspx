<%@ Page Title="Donate" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="donate-old.aspx.cs" Inherits="donate" %>

<%@ Register Src="UserControls/InsideLatestNews.ascx" TagName="InsideLatestNews" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="showcase-row">

        <div class="moduletable ">

            <img src="images/donate.jpg">

        </div>

    </div>

    <div id="content-row">
        <div class="row-container">
            <div class="container">
                <div class="content-inner row">

                    <div id="component" class="span12">
                        <main role="main">

                            <!-- Content-top -->
                            <div id="content-top-row" class="row">
                                <div id="content-top">
                                    <div class="moduletable   span8">
                                        <header>
                                            <h3 class="moduleTitle ">
                                              <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">
                                               <asp:Label ID="lblCName" runat="server" Text=""></asp:Label> 
                                              </span> 
                                            </h3>
                                        </header>
                                        <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">

                                            <table>

                                                <tr>
                                                    <td align="left" valign="top">
                                                        Name :
                                                        <br />
                                                        <asp:TextBox ID="txtCName" runat="server" CssClass="text" BorderStyle="Inset" MaxLength="255"></asp:TextBox>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="rfvCommenterName" ControlToValidate="txtCName" runat="server" ErrorMessage="Name Required" Display="Dynamic" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td align="left" valign="top">
                                                        Mobile:
                                                        <br />
                                                        <asp:TextBox ID="txtMContactNo" runat="server" CssClass="text" BorderStyle="Inset" MaxLength="16"></asp:TextBox>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top" style="height: 30px">
                                                        Email:
                                                        <br />
                                                        <asp:TextBox ID="txtEmailID" runat="server" CssClass="text" BorderStyle="Inset" MaxLength="255"></asp:TextBox>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Required" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtEmailID" ValidationGroup="vgComments"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailID" ErrorMessage="Enter email in correct format" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top">
                                                        Message:
                                                        <br />
                                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" BorderStyle="Inset" Height="100px" MaxLength="1000"></asp:TextBox>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="rfvComments" runat="server" ErrorMessage="Message Required" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtDescription" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td style="text-align: center">
                                                                    <asp:Image ID="ImgCaptcha" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="middle">
                                                                    <asp:Label ID="LblMsg" runat="server" Text="Enter the above code here:"></asp:Label>
                                                                    <br />
                                                                    <asp:TextBox ID="TxtCpatcha" runat="server" Text="" Width="196px" Height="24px" BackColor="Silver" BorderStyle="Inset"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="CP" ControlToValidate="TxtCpatcha" runat="server" ErrorMessage="Enter Code" Display="Dynamic" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="middle">
                                                                    <asp:LinkButton ID="btnTryNewWords" runat="server" Font-Names="Tahoma" Font-Size="Smaller" onclick="btnTryNewWords_Click">Can&#39;t read? Try different words.
                                                                    </asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:Label ID="lblCheckResult" runat="server" Text="?"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnSend" runat="server" Text="Send" Width="82px" Height="30px" onclick="btnSend_Click" ValidationGroup="vgComment" />
                                                        <asp:Label ID="lblmessage" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>

                                            <div class="clearfix"></div>

                                        </div>
                                    </div>

                                    <uc1:InsideLatestNews ID="InsideLatestNews1" runat="server" />

                                </div>
                            </div>

                            <style>
                                .lrcounter-horizontal-vertical table {
                                    background: none repeat scroll 0 0 transparent !important;
                                    border: medium none !important;
                                    color: #000000 !important;
                                    margin: 0 !important;
                                    padding: 0 !important;
                                    text-align: left !important;
                                }
                                
                                .lrcounter-horizontal-vertical table tr,
                                .lrcounter-horizontal-vertical table td {
                                    background: none repeat scroll 0 0 transparent !important;
                                    border: medium none !important;
                                    color: #000000 !important;
                                    display: inline-table;
                                    margin-left: 4px !important;
                                    padding: 0 2px !important;
                                    text-align: left !important;
                                    vertical-align: bottom !important;
                                }
                                
                                iframe,
                                svg {
                                    max-width: none !important;
                                }
                            </style>
                            <section class="page-category page-category__">
                            </section>

                            <!-- Content-bottom -->

                        </main>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

