<%@ Page Title="Categories" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="showcase-row">


        <div class="moduletable ">

            <asp:Image ID="kidsPhoto" runat="server"/>

            </div>
   
      </div>

    <div id="content-row">
        <div class="row-container">
          <div class="container">
            <div class="content-inner row">   
                      
              <div id="component" class="span12">

                   <main role="main">
                    <div class="gallery">
                    <h3 class="visible-first">
                    <span class="item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first">
                         <asp:Label ID="lblCName" runat="server" Text=""></asp:Label>
                    </span>
                     </h3>  
                    <div class="jg_pathway"></div>
                      <div class="jg_subcat">
                        <div class="jg_row jg_row2">
                             <asp:Literal ID="ltrCategory" runat="server"></asp:Literal>
                          <div class="jg_clearboth"></div>
                        </div>
                      </div>
                      </div>
                    </main>

              </div>        
            </div>
          </div>
        </div>
      </div>
</asp:Content>

