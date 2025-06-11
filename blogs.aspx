<%@ Page Title="Blog" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="blogs.aspx.cs" Inherits="blogs" %>

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
                                 Blogs
                              </span> 
                            </h3>
                          </header>
    <div class="mod-newsflash-adv mod-newsflash-adv__ cols-1" id="module_116">

     <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="20" AutoGenerateColumns="False"
                                 DataKeyNames="ID" ShowFooter="True" AllowSorting="True" 
                                    CellPadding="4" Width="100%" 
                                    ForeColor="#333333" GridLines="None" 
                                    onpageindexchanging="Grid_PageIndexChanging" >
                            <Columns>
                            <asp:TemplateField  SortExpression="Title">
                            <ItemTemplate>
                            <h4> <asp:Label ID="Label1"  runat="server" Text='<%# Bind("Title") %>'></asp:Label></h4>
                            <div class="clr"></div>
                            <div class="content_full_size">
                                <asp:Label ID="Label2"  runat="server" Text='<%# Bind("Intro") %>'></asp:Label><br />
                                  <a class="btn btn-info readmore" href='BlogDescription.aspx?ID=<%#Eval("ID") %>' style="float:right">
                                 Read more
                                  </a>
                             </div>
                            </ItemTemplate> 
                            </asp:TemplateField> 
                            </Columns> 
              <PagerStyle Font-Size="15px" ForeColor="Black" HorizontalAlign="Center" />
              </asp:GridView>
     
         
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

