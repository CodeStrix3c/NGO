<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestingByIsfan.aspx.cs" Inherits="_samples_TestingByIsfan" ValidateRequest="false" %>

<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Using API to customize dialogs - CKEditor Sample </title>
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />

    <script type="text/javascript" src="../ckeditor.js"></script>

    <script src="sample.js" type="text/javascript"></script>

    <link href="sample.css" rel="stylesheet" type="text/css" />
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
        CKEDITOR.on( 'dialogDefinition', function( ev )
	        {
		        // Take the dialog name and its definition from the event
		        // data.
		        var dialogName = ev.data.name;
		        var dialogDefinition = ev.data.definition;

		        // Check if the definition is from the dialog we're
		        // interested on (the "Link" dialog).
		        if ( dialogName == 'link' )
		        {
			        // Get a reference to the "Link Info" tab.
			        var infoTab = dialogDefinition.getContents( 'info' );

			        // Add a text field to the "info" tab.
			        infoTab.add( {
					        type : 'text',
					        label : 'My Custom Field',
					        id : 'customField',
					        'default' : 'Sample!',
					        validate : function()
					        {
						        if ( /\d/.test( this.getValue() ) )
							        return 'My Custom Field must not contain digits';
					        }
				        });

			        // Remove the "Link Type" combo and the "Browser
			        // Server" button from the "info" tab.
			        infoTab.remove( 'linkType' );
			        infoTab.remove( 'browse' );

			        // Set the default value for the URL field.
			        var urlField = infoTab.get( 'url' );
			        urlField['default'] = 'www.example.com';

			        // Remove the "Target" tab from the "Link" dialog.
			        dialogDefinition.removeContents( 'target' );

			        // Add a new tab to the "Link" dialog.
			        dialogDefinition.addContents({
				        id : 'customTab',
				        label : 'My Tab',
				        accessKey : 'M',
				        elements : [
					        {
						        id : 'myField1',
						        type : 'text',
						        label : 'My Text Field'
					        },
					        {
						        id : 'myField2',
						        type : 'text',
						        label : 'Another Text Field'
					        }
				        ]
			        });
		        }
	        });

	        //]]>
    </script>

</head>
<body>
    <form id="form1" runat="server">
  <%--  <asp:FormView ID="fvTesting" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Id">
        <ItemTemplate>
            <textarea cols="80" id="txtEditor" name="txtEditor" rows="10" runat="server" ><%# Eval("Title") %></textarea>

                <script type="text/javascript">
		    //<![CDATA[
			    // Replace the <textarea id="editor1"> with an CKEditor instance.
			    var editor = CKEDITOR.replace( 'fvTesting_txtEditor',
				    {
					    // Defines a simpler toolbar to be used in this sample.
					    // Note that we have added out "MyButton" button here.
					    toolbar : [ [ 'Source', '-', 'Bold', 'Italic', 'Underline', 'Strike','-','Link', '-', 'MyButton' ] ]
				    });

    //			// Listen for the "pluginsLoaded" event, so we are sure that the
    //			// "dialog" plugin has been loaded and we are able to do our
    //			// customizations.
    //			editor.on( 'pluginsLoaded', function( ev )
    //				{
    //					// If our custom dialog has not been registered, do that now.
    //					if ( !CKEDITOR.dialog.exists( 'myDialog' ) )
    //					{
    //						// We need to do the following trick to find out the dialog
    //						// definition file URL path. In the real world, you would simply
    //						// point to an absolute path directly, like "/mydir/mydialog.js".
    //						var href = document.location.href.split( '/' );
    //						href.pop();
    //						href.push( 'api_dialog', 'my_dialog.js' );
    //						href = href.join( '/' );

    //						// Finally, register the dialog.
    //						CKEDITOR.dialog.add( 'myDialog', href );
    //					}

    //					// Register the command used to open the dialog.
    //					editor.addCommand( 'myDialogCmd', new CKEDITOR.dialogCommand( 'myDialog' ) );

    //					// Add the a custom toolbar buttons, which fires the above
    //					// command..
    //					editor.ui.addButton( 'MyButton',
    //						{
    //							label : 'My Dialog',
    //							command : 'myDialogCmd'
    //						} );
    //				});
		    //]]>
            </script>

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Id], [Title] FROM [Advertisement]">
    </asp:SqlDataSource>--%>
    
    
    
      <asp:FormView ID="fvTesting" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Id" DefaultMode="Insert" Width="100%">
        <InsertItemTemplate>
            <textarea cols="80" id="txtEditor" name="txtEditor" rows="10" runat="server" ><%# Eval("Title") %></textarea>

                <script type="text/javascript">
		    //<![CDATA[
			    // Replace the <textarea id="editor1"> with an CKEditor instance.
			    var editor = CKEDITOR.replace( 'fvTesting_txtEditor',
				    {
					    // Defines a simpler toolbar to be used in this sample.
					    // Note that we have added out "MyButton" button here.
					    toolbar : [ [ 'Source', '-', 'Bold', 'Italic', 'Underline', 'Strike','-','Link', '-', 'MyButton' ] ]
				    });

    //			// Listen for the "pluginsLoaded" event, so we are sure that the
    //			// "dialog" plugin has been loaded and we are able to do our
    //			// customizations.
    //			editor.on( 'pluginsLoaded', function( ev )
    //				{
    //					// If our custom dialog has not been registered, do that now.
    //					if ( !CKEDITOR.dialog.exists( 'myDialog' ) )
    //					{
    //						// We need to do the following trick to find out the dialog
    //						// definition file URL path. In the real world, you would simply
    //						// point to an absolute path directly, like "/mydir/mydialog.js".
    //						var href = document.location.href.split( '/' );
    //						href.pop();
    //						href.push( 'api_dialog', 'my_dialog.js' );
    //						href = href.join( '/' );

    //						// Finally, register the dialog.
    //						CKEDITOR.dialog.add( 'myDialog', href );
    //					}

    //					// Register the command used to open the dialog.
    //					editor.addCommand( 'myDialogCmd', new CKEDITOR.dialogCommand( 'myDialog' ) );

    //					// Add the a custom toolbar buttons, which fires the above
    //					// command..
    //					editor.ui.addButton( 'MyButton',
    //						{
    //							label : 'My Dialog',
    //							command : 'myDialogCmd'
    //						} );
    //				});
		    //]]>
            </script>

        </InsertItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Id], [Title] FROM [Advertisement]" 
        DeleteCommand="DELETE FROM [Advertisement] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Advertisement] ([Title]) VALUES (@Title)" 
        UpdateCommand="UPDATE [Advertisement] SET [Title] = @Title WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
    </form>
</body>
</html>
