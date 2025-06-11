<%@ Page Title="Description" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BlogDescription.aspx.cs" Inherits="BlogDescription" %>

<%@ Register src="UserControls/InsideLatestNews.ascx" tagname="InsideLatestNews" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                         <%-- <header><h3 class="moduleTitle ">
                              <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">
                                 Blogs
                              </span> 
                            </h3>
                          </header>--%>
    <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">

        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="10" AutoGenerateColumns="False"
                                 DataKeyNames="ID" ShowFooter="True" AllowSorting="True" 
                                    CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>
                            <asp:TemplateField  SortExpression="Title">
                            <ItemTemplate>
                            <h4> <asp:Label ID="Label1"  runat="server" Text='<%# Bind("Title") %>'></asp:Label></h4>
                            <div class="clr"></div>
                            <div class="content_full_size">
                                <asp:Label ID="Label2"  runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                             </div>
                            </ItemTemplate> 
                            </asp:TemplateField> 
                            </Columns> 
              <PagerStyle Font-Size="15px" ForeColor="Black" HorizontalAlign="Center" />
              </asp:GridView>
              <h4>Your Opinion</h4>
                 <table style="width:600px">
                <tr>
                    <td align="left" valign="top"> 
                        <asp:Label ID="lblName" runat="server" Text="Name :"></asp:Label> 
                      <asp:RequiredFieldValidator ID="rfvCommenterName" ControlToValidate="txtCName" runat="server"
                                                        ErrorMessage="Name Required" Display="Dynamic" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                    <br />
                        <asp:TextBox ID="txtCName" runat="server" CssClass="text"  BorderStyle="Inset" Width="80%" MaxLength="255"></asp:TextBox>
                    </td>
                </tr>
                
              
                <tr>
                    <td align="left" valign="top" style="height: 30px">
                   <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label> 
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Required"
                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtEmailID" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtEmailID" ErrorMessage="Enter email in correct format" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RegularExpressionValidator>
                    <br />
                    <asp:TextBox ID="txtEmailID" runat="server" CssClass="text" BorderStyle="Inset" Width="80%" MaxLength="255"></asp:TextBox>

                    </td>
                </tr>
              
               <tr>
                    <td align="left" valign="top" style="height: 30px">
                         <asp:Label ID="lblComment" runat="server" Text="Comment :"></asp:Label> 
                         <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" ControlToValidate="txtMessage" ErrorMessage="Comment required" Display="Dynamic" ValidationGroup="vgComment"></asp:RequiredFieldValidator> 
                         <br />
                         <asp:TextBox ID="txtMessage" runat="server"   CssClass="text" BorderStyle="Inset" TextMode="MultiLine" Width="100%" height="80px"></asp:TextBox>
                       
                        </td>
                </tr>

                <tr>
                    <td>
              <asp:Button ID="btnSend" runat="server" Text="Send" 
                            onclick="btnSend_Click"  ValidationGroup="vgComment" />
                        <asp:Label ID="lblmessage" runat="server" Visible="false"></asp:Label>
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


                  		        .lrcounter-horizontal-vertical table tr, .lrcounter-horizontal-vertical table td {
                  		            background: none repeat scroll 0 0 transparent !important;
                  		            border: medium none !important;
                  		            color: #000000 !important;
                  		            display: inline-table;
                  		            margin-left: 4px !important;
                  		            padding: 0 2px !important;
                  		            text-align: left !important;
                  		            vertical-align: bottom !important;
                  		        }

                  		    iframe, svg {
                  		        max-width: none !important;
                  		    }
                  		</style>
		<section class="page-category page-category__">
	</section>   
                       
                  
                                  </main>
              </div>        
                          </div>
          </div>
        </div>
      </div>
</asp:Content>

