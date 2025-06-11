<%@ Page Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Edit_Audios.aspx.cs" Inherits="FazilKashmir_Ad_Edit_Audios" Title="Edit Audios" %>

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
 <h3>Add Audios Detail</h3>

    <fieldset>
        <legend>Enter details below:</legend>
        <table cellpadding="3" cellspacing="3" border="0">
            <tbody>
            
              <%--  <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Choose Audio :
                    </td>
                    <td align="left" valign="top">
                        <asp:FileUpload ID="AddAudio" runat="server" Width="300px"/>
                    </td>
                </tr>--%>
                
                <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        Title:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox ID="txtTitle" runat="Server" Width="300px"></asp:TextBox>
                       

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
                <tr>
                    <td align="right" valign="top">
                    </td>
                    <td align="right" valign="top">
                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="../AlbumImages/button-save.gif"
                            AlternateText="Save" onclick="btnSave_Click" OnClientClick="return Audios()" />
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>

</asp:Content>

