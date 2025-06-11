<%@ Page Title="Sponsor A Child" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sponsor_A_Child.aspx.cs" Inherits="Sponsor_A_Child" %>

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
                          <header><h3 class="moduleTitle ">
                              <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">
                              Sponsor a child
                              </span> 
                            </h3>
                          </header>
    <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">
                 
   
                    Name :   <asp:RequiredFieldValidator ID="rfvCommenterName" ControlToValidate="txtCName" runat="server"
                                                        ErrorMessage="Name Required" Display="Dynamic" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCName" runat="server" CssClass="text" width="100%"  BorderStyle="Inset"
                            MaxLength="255"></asp:TextBox><br />
                                                  
           
                 
                    Mobile:
                    <asp:TextBox ID="txtMContactNo" runat="server" CssClass="text" width="100%"  BorderStyle="Inset"
                            MaxLength="16"></asp:TextBox><br />
                   
                    Subject:  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSubject" runat="server"
                                                        ErrorMessage="Subject Required" Display="Dynamic" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                      <asp:TextBox ID="txtSubject" runat="server" CssClass="text" width="100%" BorderStyle="Inset"
                             MaxLength="255"></asp:TextBox><br />
                                                   
                  
                     Your Organization :      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtOrganization" runat="server"
                                                        ErrorMessage="Organization Required" Display="Dynamic" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtOrganization" runat="server"  CssClass="text" width="100%"  BorderStyle="Inset"
                             MaxLength="255"></asp:TextBox><br />
                                               
                   
                    Email:   <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Required"
                                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtEmailID" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ControlToValidate="txtEmailID" ErrorMessage="Enter email in correct format" SetFocusOnError="true" ValidationGroup="vgComment"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtEmailID" runat="server" CssClass="text" width="100%"  BorderStyle="Inset"
                            MaxLength="255"></asp:TextBox><br />
                                                  
                  
                    Message:   <asp:RequiredFieldValidator ID="rfvComments" runat="server" ErrorMessage="Message Required"
                             Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtDescription" ValidationGroup="vgComment"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtDescription" runat="server" width="100%" TextMode="MultiLine"  BorderStyle="Inset"
                            Height="100px" MaxLength="1000"></asp:TextBox><br />
                           
             
                    <asp:Button ID="btnSend" runat="server" Text="Send" Width="82px" Height="30px" 
                            onclick="btnSend_Click"  ValidationGroup="vgComment" />
                        <asp:Label ID="lblmessage" runat="server" Visible="false"></asp:Label>
               
     
         
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

