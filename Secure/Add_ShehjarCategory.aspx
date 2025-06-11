<%@ Page Title="Shehjar" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="Add_ShehjarCategory.aspx.cs" Inherits="Secure_Add_ShehjarCategory" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" runat="Server">

    <h3>Shehjar</h3>
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
                                        <td align="right" style="font-weight: bold" valign="top">Title</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="top" style="font-weight: bold">Choose Photo :
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:FileUpload ID="Ofile" runat="server" Width="300px" onchange="javascript:chkOfile();" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" valign="top">Banner Image : 
                                        </td>
                                        <td align="left" valign="top">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <br />
                                            (image should be width 1290px & height 400px)
                                            <asp:RequiredFieldValidator runat="server" ID="rfv" ControlToValidate="Ofile" ErrorMessage="Image is required" Display="Dynamic" ValidationGroup="KidsPage"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" style="font-weight: bold" valign="top">Intro</td>
                                        <td align="left" valign="top">
                                            <asp:TextBox ID="txtIntro" runat="server" Width="300px" TextMode="MultiLine"></asp:TextBox>
                                            <script type="text/javascript">
                                                //<![CDATA[

                                                // Replace the <textarea id="editor"> with an CKEditor
                                                // instance, using default configurations.
                                                CKEDITOR.replace('ctl00_CPH_txtIntro',
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
                                </table>
                                <p style="text-align: right;">
                                    <asp:ImageButton ID="btnSave" runat="server" CommandName="Insert" ImageUrl="../AlbumImages/button-save.gif"
                                        OnClientClick="return News()" OnClick="btnSave_Click" ValidationGroup="KidsPage" />
                                </p>

                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>

        </tr>
    </table>
</asp:Content>

