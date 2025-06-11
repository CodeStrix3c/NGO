using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;

public partial class Secure_View_Information : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
           // Bind_Grid();
            Bind_GridByTypeId();
        }
    }
    private void Bind_Grid()
    {

        DataSet ds = obj.GetInformation();
        Grid.DataSource = ds;
        Grid.DataBind();

    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
       // Bind_Grid();
        Bind_GridByTypeId();
    }
    protected void DeleteDomain(object sender, EventArgs e)
    {
        ImageButton ID = (ImageButton)sender;
        obj.DeleteInformationByID(Convert.ToInt32(ID.CommandArgument)).ToString();
        //Bind_Grid();
        Bind_GridByTypeId();
        lblMessage.Text = "MESSAGE :: Delete Successfully";

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
          //  Bind_Grid();
            Bind_GridByTypeId();
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
                obj.Information_UnPublish(ID);

                lblMessage.Text = "MESSAGE :: 1 Item have been Un-Published.";
            }
            else if (e.CommandName.Equals("Publish"))
            {
                obj.Information_Publish(ID);
                lblMessage.Text = "MESSAGE :: 1 Item have been Published .";
            }
            AddJavascripting();
            Bind_GridByTypeId();

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
    private void Bind_GridByTypeId()
    {
        try
        {
            DataSet ds = obj.GetInformationByTypeId(int.Parse(ddlPageType.SelectedValue.ToString()));
            Grid.DataSource = ds;
            Grid.DataBind();
        }
        catch { }
    }
    protected void ddlPageType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_GridByTypeId();
    }
}