<%@ Page Title="Result" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="result" %>

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
                                 Search Result
                              </span> 
                            </h3>
                          </header>
                            <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">

                                Enter Your Roll No:
                                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="Search"  OnClick="btnSearch_Click" ValidationGroup="Writer"></asp:Button>
                                <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtSearch" ErrorMessage="Enter Your Roll No." Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSearch" Text="Please enter number" EnableClientScript="true" ValidationExpression="^\d+(\.\d{2})?$" ValidationGroup="Writer"></asp:RegularExpressionValidator>
                                
                                <br></br>
                                <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
         
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
                       
                  <!-- Content-bottom -->
                  
                                  </main>
              </div>        
           </div>
          </div>
        </div>
      </div>
</asp:Content>
