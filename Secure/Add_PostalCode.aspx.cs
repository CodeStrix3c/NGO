using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Net.Mail;
using System.ComponentModel.Design;
using System.Text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Data.Common;

public partial class Secure_Add_PostalCode : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            Bind_Grid();
        }
    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string theSQL = "";
        theSQL += "INSERT INTO PostalCode(Title,PCode,CreatedDate) VALUES(";
        theSQL += "'" + txtTitle.Text.Replace("'", "''") + "',";
        theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
        theSQL += "'" + obj.ReturnDate() + "'";
        theSQL += ")";
        MsgBox.Show(obj.InsertData(theSQL));
        txtTitle.Text = "";
        txtDescription.Text = "";
        Bind_Grid();
    }
    private void Bind_Grid()
    {
        DataSet ds = obj.GetPostalCode();
        Grid.DataSource = ds;
        Grid.DataBind();
    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_Grid();
    }
    protected void DeleteDomain(object sender, EventArgs e)
    {
        ImageButton ID = (ImageButton)sender;
        obj.DeletePostalCodeByID(Convert.ToInt32(ID.CommandArgument)).ToString();
        Bind_Grid();
        lblMessage.Visible = true;
        lblMessage.Text = "MESSAGE :: Delete Successfully";
        AddJavascripting();
    }
    protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = Grid.DataSource as DataTable;
        //DataTable dataTable = obj.GetUsers().Tables[0];
        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);
            Grid.DataSource = dataView;
            Grid.DataBind();
        }
        else
        {
            Bind_Grid();
        }
    }
    protected string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;
        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "ASC";
                break;

            case SortDirection.Descending:
                newSortDirection = "DESC";
                break;
        }

        return newSortDirection;
    }
    protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Unpublish") | e.CommandName.Equals("Publish"))
        {
            int ID;
            ID = Convert.ToInt32(e.CommandArgument);
            lblMessage.Visible = true;
            if (e.CommandName.Equals("Unpublish"))
            {
                obj.PostalCode_UnPublish(ID);

                lblMessage.Text = "MESSAGE :: 1 Item have been Un-Published.";
            }
            else if (e.CommandName.Equals("Publish"))
            {
                obj.PostalCode_Publish(ID);
                lblMessage.Text = "MESSAGE :: 1 Item have been Published .";
            }
            AddJavascripting();
            Bind_Grid();
        }
    }
    protected void Grid_DataBound(object sender, EventArgs e)
    {
        GridView gvSite_object = (GridView)sender;
        for (int i = 0; i < gvSite_object.Rows.Count; i++)
        {
            #region "Publish / Un-Publish :: Top Sites here..."
            HiddenField hdfIsPublished_Grid = (HiddenField)gvSite_object.Rows[i].Cells[2].FindControl("hdfIsPublished_Grid");
            ImageButton imgbtnPublish_Grid = (ImageButton)gvSite_object.Rows[i].Cells[2].FindControl("imgbtnPublish");
            ImageButton imgbtnUnPublish_Grid = (ImageButton)gvSite_object.Rows[i].Cells[2].FindControl("imgbtnUnPublish");
            if (hdfIsPublished_Grid != null & imgbtnPublish_Grid != null & imgbtnUnPublish_Grid != null)
            {
                if (hdfIsPublished_Grid.Value.Equals("0"))
                {
                    imgbtnPublish_Grid.Visible = false;
                    imgbtnUnPublish_Grid.Visible = true;
                }
                else
                {
                    imgbtnPublish_Grid.Visible = true;
                    imgbtnUnPublish_Grid.Visible = false;
                }
            }
            #endregion
        }
    }
    protected void AddJavascripting()
    {
        StringBuilder scriptString = new StringBuilder();
        //scriptString.Append("<script type='text/javascript'>");
        //scriptString.Append("window.onload = function() {");
        scriptString.Append(" function pageLoad() { \n");
        scriptString.Append("setTimeout(\"refreshPage()\", 3000);");
        scriptString.Append("};");
        scriptString.Append("function refreshPage() {");
        //scriptString.Append("document.getElementById(\"ctl00_cphMainContent_lblMessage\").style.display = 'none'; }");
        scriptString.Append("document.getElementById(\"ctl00_CPH_lblMessage\").style.display = 'none'; }");
        //scriptString.Append("</script>");

        //Page.RegisterClientScriptBlock("messageBar", Convert.ToString(scriptString));
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "BodyType_Message", scriptString.ToString(), true);
    }
}