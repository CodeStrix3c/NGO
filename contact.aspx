<%@ Page Title="Contact us" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-row">
        <div class="row-container visible visible-first">
          <div class="container">
            <div class="content-inner row">   
                      
              <div id="component" class="span12">
                <main role="main">
                         
                          
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
		<div class="page page-contact page-contact__">

  
  <!-- Address -->
    <div class="row-fluid">
    

<div class="contact_details">
		<div class="contact_details_item span4">
            <h3>Address:</h3>		
            <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="15" AutoGenerateColumns="False"
                                   DataKeyNames="ID" ShowFooter="True" AllowSorting="True" 
                                    OnPageIndexChanging="Grid_PageIndexChanging" CellPadding="4" Width="100%" 
                                    ForeColor="#333333" GridLines="None">
                                     <Columns>
                                     <asp:TemplateField  SortExpression="Title">
                                     <ItemTemplate>
                                      <h4>
                                      <asp:Label ID="lblWriterName"  runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                      </h4>                
                                        <table>
                                        <tr>
                                        <td >
                                        <asp:Label ID="lblSName" runat="server"  Text='<%# Bind("Address") %>'></asp:Label>
                                        </td>
                                        </tr>
                                    </table>
                            </ItemTemplate>
                            </asp:TemplateField>
                            </Columns>
                            </asp:GridView>

					</div>
	</div>
		
	
</div>  </div>
  
  <!-- Misc -->
                  
  <div class="contact_misc">
	  <h3>Contact form:</h3>
  </div>
  <div class="contact_form">
	<form id="contact-form" action="/joomla_52178/index.php/contacts" method="post" class="form-validate">
		<fieldset>
			<p><i class="muted">Send an email. All fields with an * are required.</i></p>
			<div class="clearfix"></div>
			<div class="row-fluid">
				<div class="span4">
					<label id="jform_contact_name-lbl" for="jform_contact_name" class="hasTooltip required" title="" data-original-title="<strong>Name</strong><br />Your name">
	             Name<span class="star">&nbsp;*</span></label>
                    <div class="controls">
                        <input type="text" name="jform[contact_name]" id="jform_contact_name" value="" class="required" size="30" required="required" aria-required="true">
                    </div>
				</div>
				<div class="span4">
					<label id="jform_contact_email-lbl" for="jform_contact_email" class="hasTooltip required" title="" data-original-title="<strong>Email</strong><br />Email for contact">
	                 Email<span class="star">&nbsp;*</span></label>	
                    <div class="controls">
                       <input type="email" name="jform[contact_email]" class="validate-email required" id="jform_contact_email" value="" size="30" required="required" aria-required="true">
                     </div>
				</div>
				<div class="span4">
					<label id="jform_contact_emailmsg-lbl" for="jform_contact_emailmsg" class="hasTooltip required" title="" data-original-title="<strong>Mobile No.</strong><br />Enter your mobile no. here .">
	                 Mobile<span class="star">&nbsp;*</span></label>
                    <div class="controls">
                        <input type="text" name="jform[contact_mobile]" id="jform_contact_emailmsg" value="" class="required" size="60" required="required" aria-required="true">
                    </div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<label id="jform_contact_message-lbl" for="jform_contact_message" class="hasTooltip required" title="" data-original-title="<strong>Message</strong><br />Enter your message here.">
	                Message<span class="star">&nbsp;*</span></label>
                    <div class="controls">
						<textarea name="jform[contact_message]" id="jform_contact_message" cols="50" rows="10" class="required" required="required" aria-required="true"></textarea>					
                    </div>
										<div class="control-group">
												<div class="controls">
													</div>
											</div>
									</div>
			</div>
			<div class="controls">
				<div class="contact_email-copy pull-right">
                <asp:Button ID="btnsubmit" runat="server" Text="Send" OnClick="btnsubmit_Click"></asp:Button>                    
				</div>
			</div>
		</fieldset>
	</form>
</div>
  <!-- MISC INFO -->

      
</div>   
                                  </main>
              </div>        
                          </div>
          </div>
        </div>
      </div>
</asp:Content>

