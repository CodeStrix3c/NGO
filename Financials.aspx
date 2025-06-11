<%@ Page Title="Financials" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Financials.aspx.cs" Inherits="Financials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Showcase -->
    <div id="showcase-row">


        <div class="moduletable ">

            <img src="images/financial.JPG" width="100%" class="lazy"/>

            </div>
   
      </div>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #customers tr:hover {
                background-color: #ddd;
            }

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
    </style>
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
                                  Financials 
                              </span> 
                            </h3>
                          </header>
                            <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">
                                       <div class="kblock kcategories-1">
			                            <div class="kcontainer" id="catid_1">
		                                <div class="kbody">
                                        <table id="customers">
				                        <tbody>

                                        <asp:Literal ID="ltrDetails" runat="server"></asp:Literal>
				                
		                                </tbody>
                                        </table>
                                        </div>
                                        </div>
                                        </div>
                           <div class="clearfix"></div>

                          </div>
                        </div>
        

                       <%--  <uc1:InsideLatestNews ID="InsideLatestNews1" runat="server" />--%>


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

