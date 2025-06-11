<%@ Page Title="Edit Core Competencies" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Edit_CoreCompetencies.aspx.cs" Inherits="Secure_Edit_CoreCompetencies" %>

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
 <h3>Edit Category</h3>
    <fieldset>
        <legend>Edit details below:</legend>
        <table cellpadding="3" cellspacing="3" border="0">
            <tbody>
               
                <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                      Category Name:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtName" runat="Server" Width="300px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="txtName" ErrorMessage="Name is required" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td align="right" valign="top">
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

