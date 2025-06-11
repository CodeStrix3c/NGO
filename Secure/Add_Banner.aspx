<%@ Page Title="Banner" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Add_Banner.aspx.cs" Inherits="Secure_Add_Banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" runat="Server">
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
    <h3>Banners</h3>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="left" valign="top">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td align="left" valign="top">
                            <fieldset>
                                <legend>Add Banner Images</legend>
                                <table>
                                    <tr>
                                        <td align="right" valign="top">Select Image : 
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:FileUpload ID="Ofile" runat="server" />
                                            <asp:RequiredFieldValidator runat="server" ID="rfv" ControlToValidate="Ofile" ErrorMessage="Image is required" Display="Dynamic" ValidationGroup="AddPhotos"></asp:RequiredFieldValidator>
                                              (image should be width 1290px & height 400px)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="top">Title : 
                                        </td>
                                        <td align="left" valign="top">
                                            <input type="text" runat="server" id="caption" />
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="caption" ErrorMessage="Caption is required" Display="Dynamic" ValidationGroup="AddPhotos"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold" valign="top">Intro</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtIntro" runat="server" Width="95%" Height="80px" TextMode="MultiLine"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" style="font-weight: bold" valign="top">Description</td>
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

                                    <tr>
                                        <td align="right" valign="top"></td>
                                        <td align="right" valign="top">
                                            <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="../AlbumImages/button-save.gif" OnClick="imgAdd_Click" ValidationGroup="AddPhotos" OnClientClick="return Photos()" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>

                        </td>

                    </tr>
                </table>
            </td>

        </tr>
        <tr>
            <td align="left" valign="top">
                <table cellpadding="0" cellspacing="0" border="0" width="300px">
                    <tr>
                        <td align="left" valign="top">
                            <fieldset>
                                <legend>Banners</legend>
                                <asp:GridView ID="GridView1" runat="server" PageSize="10"
                                    DataKeyNames="ID" CellPadding="3" OnPageIndexChanging="GridView1_PageIndexChanged"
                                    AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px"
                                    Width="100%" ShowHeader="False" AllowPaging="True"
                                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                    OnRowDeleting="GridView1_RowDeleting"
                                    OnRowEditing="GridView1_RowEditing"
                                    OnRowUpdating="GridView1_RowUpdating"
                                    OnRowCommand="GridView1_RowCommand">
                                    <EmptyDataRowStyle CssClass="emptydata"></EmptyDataRowStyle>
                                    <EmptyDataTemplate>
                                        You Have No Banner Currently.
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                                    <tr>
                                                        <td class="topx--"></td>
                                                        <td class="top-x-"></td>
                                                        <td class="top--x"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="midx--"></td>
                                                        <td>
                                                            <img alt="" src="<%# getPhotos(Eval("ImageUrl"))%>" style="float: left; width: 600px; height: 200px; padding-right: 10px" />
                                                            <td class="mid--x"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="botx--"></td>
                                                        <td class="bot-x-"></td>
                                                        <td class="bot--x"></td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                          
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label ID="lblcaption" runat="Server" Text='<%#Eval("Title") %>'></asp:Label>
                                            </ItemTemplate>
                                           
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div style="width: 100%; text-align: right;">
                                                     <a href='Edit_Banner.aspx?ID=<%#Eval("ID") %>'>
                                                    <asp:Image ID="imgBtnEdit" runat="server" ImageUrl="../AlbumImages/im_edit.jpg" AlternateText="Edit" />
                                                         </a> 
                                                    <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Delete" ImageUrl="../AlbumImages/button-delete.gif" CausesValidation="False" OnClientClick="return confirm('Do you want to delete?')" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </fieldset>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

