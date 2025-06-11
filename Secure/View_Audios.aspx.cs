using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class FazilKashmir_Ad_View_Audios : System.Web.UI.Page
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            BindDropdown();
           Bind_Grid();
        }
    }
    protected void BindDropdown()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.GetAllAudioSubjectIds();
            ddlSpeakers.DataSource = ds.Tables[0];
            ddlSpeakers.DataTextField = "Title";
            ddlSpeakers.DataValueField = "ID";
            ddlSpeakers.DataBind();
            ListItem li = new ListItem("--Select Subject--", "0");
            ddlSpeakers.Items.Insert(0, li);
        }
        catch { }

    }
    private void Bind_Grid()
    {
        Grid.DataSource = obj.GetAudios();
        Grid.DataBind();
      
    }
    protected void ddlSpeakers_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (int.Parse(ddlSpeakers.SelectedValue.ToString()) == 0)
            {
                Bind_Grid();
            }
            else
            {
                Grid.DataSource = obj.GetAudiosBySubjectID(int.Parse(ddlSpeakers.SelectedValue.ToString()));
                Grid.DataBind();
            }
        }
        catch { }
    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_Grid();
    }
    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Path = Server.MapPath("../Audios/");
        MsgBox.Show(obj.DeleteAudio(Convert.ToInt32(Grid.DataKeys[e.RowIndex].Value)));
        Bind_Grid();
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
}
