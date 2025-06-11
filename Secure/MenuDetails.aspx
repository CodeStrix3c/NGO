<%@ Page Title="Menu Details" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="MenuDetails.aspx.cs" Inherits="Secure_MenuDetails" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
     <!--CK Editor :: Files (START)-->
    <style id="styles" type="text/css">
        .cke_button_myDialogCmd .cke_icon
        {
            display: none !important;
        }
        .cke_button_myDialogCmd .cke_label
        {
            display: inline !important;
        }
    </style>
    <script type="text/javascript">
        //<![CDATA[

        // When opening a dialog, its "definition" is created for it, for
        // each editor instance. The "dialogDefinition" event is then
        // fired. We should use this event to make customizations to the
        // definition of existing dialogs.
        CKEDITOR.on('dialogDefinition', function (ev) {
            // Take the dialog name and its definition from the event
            // data.
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;

            // Check if the definition is from the dialog we're
            // interested on (the "Link" dialog).
            if (dialogName == 'link') {
                // Get a reference to the "Link Info" tab.
                var infoTab = dialogDefinition.getContents('info');

                // Add a text field to the "info" tab.
                infoTab.add({
                    type: 'text',
                    label: 'My Custom Field',
                    id: 'customField',
                    'default': 'Sample!',
                    validate: function () {
                        if (/\d/.test(this.getValue()))
                            return 'My Custom Field must not contain digits';
                    }
                });

                // Remove the "Link Type" combo and the "Browser
                // Server" button from the "info" tab.
                infoTab.remove('linkType');
                infoTab.remove('browse');

                // Set the default value for the URL field.
                var urlField = infoTab.get('url');
                urlField['default'] = 'www.example.com';

                // Remove the "Target" tab from the "Link" dialog.
                dialogDefinition.removeContents('target');

                // Add a new tab to the "Link" dialog.
                dialogDefinition.addContents({
                    id: 'customTab',
                    label: 'My Tab',
                    accessKey: 'M',
                    elements: [
					        {
					            id: 'myField1',
					            type: 'text',
					            label: 'My Text Field'
					        },
					        {
					            id: 'myField2',
					            type: 'text',
					            label: 'Another Text Field'
					        }
                    ]
                });
            }
        });

        //]]>
    </script>
    <!--CK Editor :: Files (END)-->
<h3>
        Details</h3>
    <table width="100%">
        <tr>
            <td align="left" valign="top">
                <table>
                    <tr>
                        <td align="left" valign="top" style="width: 395px">
                            <fieldset>
                                <legend>Enter details below:</legend>
                                <p>
                                </p>
                                        <table>
                                        <tr>
                                        <td align="right" style="font-weight: bold" valign="top">
                                            Title</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtTitle" ErrorMessage="title is required" Display="Dynamic" ValidationGroup="KidsPage"></asp:RequiredFieldValidator>                                      
                                         </td>
                                       </tr>
                                       <tr>
                                      <td align="right" valign="top" style="font-weight: bold">
                                        Choose Photo :
                                      </td>
                                      <td align="left" valign="top">
                                        <asp:FileUpload ID="Ofile" runat="server" Width="300px"/>
                                        <p>image size must be width= 300px, & height=200px</p>
                                       </td>
                                       </tr>

                                       <tr>
                                      <td align="right" valign="top" style="font-weight: bold">
                                        Image :
                                      </td>
                                       <td align="left" valign="top">
                                        <asp:FileUpload ID="upLoadLargeImage" runat="server" Width="300px"/>
                                        <p>image size must be width= 800px, & height=auto</p>
                                       </td>
                                       </tr>

                                        <tr>
                                        <td align="right" style="font-weight: bold" valign="top">
                                            Description</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtDescription" runat="server" Width="300px" TextMode="MultiLine"></asp:TextBox>
                                           <script type="text/javascript">
                                               //<![CDATA[

                                               // Replace the <textarea id="editor"> with an CKEditor
                                               // instance, using default configurations.
                                               CKEDITOR.replace('ctl00_CPH_txtDescription',
                                               {
                                                   toolbarStartupExpanded: true,
                                                   removePlugins: 'maximize,resize',
                                                   extraPlugins: 'uicolor',
                                                   toolbar:
                                                   [
                                                   //['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink'],
                                                   //['UIColor'],
                                                       ['Bold', 'Italic', 'Underline', 'StrikeThrough', '-', 'Undo', 'Redo', '-', 'Cut', 'Copy', 'Paste', 'Find', 'Replace', '-', 'Outdent', 'Indent', '-', 'Print'],
                                                       '/',
                                                       ['Styles', 'Format', 'Font', 'FontSize', 'RemoveFormat'],
                                                       '/',
                                                       ['NumberedList', 'BulletedList', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
                                                   //['Image', 'Table', '-', 'Link', 'Flash', 'Smiley', 'TextColor', 'BGColor', 'Source'],
                                                       ['Table', '-', 'Source'],
                                                       ['Link', 'TextColor', 'BGColor'],
                                                       ['UIColor']
                                                   ]


                                               });

                                               //]]>
                                            </script>
                                         </td>
                                    </tr>
                                        </table>
                                        <p style="text-align: right;">
                                            <asp:ImageButton ID="btnSave" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                                  onclick="btnSave_Click" ValidationGroup="KidsPage" />
                                        </p>
                                   
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            
        </tr>
    </table>

    <h3>Details</h3>
    <fieldset>
        <legend>List below:</legend>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnRowDeleting="Grid_RowDeleting"
                            OnSorting="gridView_Sorting" OnPageIndexChanging="Grid_PageIndexChanging" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                      <img alt="" src="../Upload/<%#(Eval("ImageUrl"))%>" style="float:left; padding-right:10px"/>
                                      <b style="font-size:13px">Title</b><br /><br />
                                       <asp:Label ID="lblWriterName" runat="server" Font-Bold="true" ForeColor="Blue" Text='<%# Bind("Title") %>'></asp:Label><br /><br />
                                       <b style="font-size:13px">Description</b><br />
                                        <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='Edit_MenuDetails.aspx?ID=<%#Eval("ID") %>&SubCatID=<%# Eval("SubCatId") %>'>
                                            <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                        </a>
                                        <asp:ImageButton ID="imgBtnDel" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="../AlbumImages/im_delete.jpg" AlternateText="Delete" OnClientClick = "return confirm('Do you want to delete?')"></asp:ImageButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                <EditRowStyle BackColor="#999999" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Left" />
                        </asp:GridView>
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
</asp:Content>

