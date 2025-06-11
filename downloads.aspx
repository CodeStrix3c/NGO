<%@ Page Title="RESOURCES" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="downloads.aspx.cs" Inherits="downloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div id="showcase-row">
        <div class="moduletable ">

            <asp:Literal ID="ltrImage" runat="server"></asp:Literal>

        </div>
   
      </div>

    <div id="content-row">
        <div class="row-container visible visible-first">
          <div class="container">
            <div class="content-inner row">   
                      
              <div id="component" class="span12">
                <main role="main">
                  <!-- Content-bottom -->
                  <div id="content-bottom-row" class="row">
                    <div id="content-bottom">
                      <section class="moduletable   span9"><header><h3 class="moduleTitle">
                          <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">
                              <asp:Label ID="lblCName" runat="server" Text=""></asp:Label>
                          </span></h3></header>
                          <div class="mod-newsflash-adv team mod-newsflash-adv__ cols-3" id="module_90">
                        <div class="row-fluid">

                            <asp:Literal ID="ltrData" runat="server"></asp:Literal>

                                </div> 
                              <div class="clearfix"></div>
                              </div>
                            </section>
  
                          <div class="moduletable   span3">
                              <header><h3 class="moduleTitle">
                                  <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">RESOURCES</span> 
                                  </h3></header><div class="mod-menu">
	                        <ul class="nav menu item-list">

                                <asp:Literal ID="ltrLinks" runat="server"></asp:Literal>

                            </ul>
                        </div></div>
                    </div>
                  </div>
                                  </main>
              </div>        
                          </div>
          </div>
        </div>
      </div>

</asp:Content>

