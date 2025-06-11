<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Edit_Contact.aspx.cs" Inherits="FazilKashmir_Ad_Edit_Contact" Title="Edit Contact" ValidateRequest="false" %>

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
  <h3>Add New Contacts</h3>

    <fieldset>
        <legend>Enter details below:</legend>
        <table cellpadding="3" cellspacing="3" border="0">
            <tbody>

                <tr>
                    <td align="right" valign="top" style="font-weight: bold; width: 77px;">
                        Name:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtName" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtName" ErrorMessage="Name is required" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                  <tr>
                    <td align="right" valign="top" style="font-weight: bold; width: 77px;">
                        Address:
                    </td>
                    <td align="left" valign="top">
                          <asp:TextBox ID="txtAddress" runat="Server" Width="300px" TextMode="MultiLine"></asp:TextBox>
                       
                        <script type="text/javascript">
                            //<![CDATA[

                            // Replace the <textarea id="editor"> with an CKEditor
                            // instance, using default configurations.
                            CKEDITOR.replace('ctl00_CPH_txtAddress',
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

            <%--     <tr>
                    <td align="right" valign="top" style="font-weight: bold; width: 77px;">
                        Contact:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtContactNo" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                    </td>
                </tr>

                 <tr>
                    <td align="right" valign="top" style="font-weight: bold; width: 77px;">
                        Mobile No:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtMobileno" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td align="right" valign="top" style="font-weight: bold; width: 77px;">
                        Fax:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtFax" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                    </td>
                </tr>
                  <tr>
                    <td align="right" valign="top" style="font-weight: bold; width: 77px;">
                        Email:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtEmail" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ControlToValidate="txtEmail" ErrorMessage="Enter email in correct format" SetFocusOnError="true" ValidationGroup="Writer"></asp:RegularExpressionValidator>
                    </td>
                 </tr>--%>
                <tr>
                    <td align="right" valign="top" style="width: 77px">
                    </td>
                   <td align="right" valign="top">
                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="../AlbumImages/button-save.gif"
                            AlternateText="Save" ValidationGroup="Writer"
                            onclick="btnSave_Click"  />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>

</asp:Content>

