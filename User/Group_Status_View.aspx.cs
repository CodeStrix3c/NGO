using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class User_Group_Status_View : System.Web.UI.Page
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
    private void Bind_Grid()
    {
        try
        {

            Grid.DataSource = obj.GetGroupStatus(Convert.ToInt32(Session["ID"].ToString()));
            Grid.DataBind();
            
        }
        catch (Exception exc)
        {
            Response.Redirect("../Alhayat_Ad/");
        }
    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_Grid();
    }
    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        MsgBox.Show(obj.DeleteGroupStatus(Convert.ToInt32(Grid.DataKeys[e.RowIndex].Value)));
        Bind_Grid();
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
    protected string CheckString(string chk)
    {
        if (chk == "" || chk == null)
        {
            return "n/a";
        }
        else
        {
            return chk;
        }
    }
    protected string ChkFile(string FileName)
    {
        if (FileName == "n/a")
        {
            return "";
        }
        else
        {
            FileName = "<img src='../Upload/" + FileName + "' class='photo_198' style='border: 2px solid white; ' alt='' />";
            return FileName;
        }
    }
}
