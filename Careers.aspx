<%@ Page Title="Careers" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Careers.aspx.cs" Inherits="Careers" %>

<%@ Register Src="UserControls/InsideLatestNews.ascx" TagName="InsideLatestNews" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Showcase -->
    <div id="showcase-row">


           <div class="moduletable ">


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
                           <h1 style="color:black">Careers</h1> <hr/><br/>
                         <%-- <header><h3 class="moduleTitle ">
                              <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">
                                  <asp:Label ID="lblSubName" runat="server" Text=""></asp:Label>
                              </span> 
                            </h3>
                          </header>
                            <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">
                                <asp:Literal ID="ltrDetails" runat="server"></asp:Literal>
                           <div class="clearfix"></div>

                          </div>--%>

                            <asp:Literal ID="ltrcarrer" runat="server"></asp:Literal>

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

