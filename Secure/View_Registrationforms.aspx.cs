using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class Secure_View_Registrationforms : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            Bind_GridAll();
            Bind_JobPost();
        }
    }
    private void Bind_GridAll()
    {
        DataSet ds = obj.GetRegistration();
        Grid.DataSource = ds;
        Grid.DataBind();
    }
   
    private void Bind_JobPost()
    {
        DataSet ds = obj.GetLatestJobs_BE();
        ddlPost.DataSource = ds.Tables[0];
        ddlPost.DataTextField = "Title";
        ddlPost.DataValueField = "ID";
        ddlPost.DataBind();
        ListItem li = new ListItem("Select Post...!", "0");
        ddlPost.Items.Insert(0, li);
    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_GridAll();
    }
    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex.ToString());
        string PhotoID = Grid.DataKeys[index].Value.ToString();
        string Path = Server.MapPath("../Upload/");
        obj.DeleteRegistrationByID(Convert.ToInt32(PhotoID), Path);
        MsgBox.Show("Delete Successfully");
        Bind_GridAll();

    }
    protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = Grid.DataSource as DataTable;
        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);
            Grid.DataSource = dataView;
            Grid.DataBind();
        }
        else
        {
            Bind_GridAll();
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
    public string FileURL(object varfileUrl)
    {
        return "../Upload/" + varfileUrl.ToString();
    }
    protected void ddlPost_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = obj.GetRegistrationByPostID(int.Parse(ddlPost.SelectedValue.ToString()));
            Grid.DataSource = ds;
            Grid.DataBind();
        }
        catch { }
    }
   
  
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow;
        int i = 0;
        int Id = 0;
        string varSuccess = string.Empty;
        for (i = 0; i < Grid.Rows.Count; i++)
        {
            gvRow = Grid.Rows[i];
            bool check = ((CheckBox)gvRow.FindControl("chkBox")).Checked;
            if (check)
            {
                Id = Convert.ToInt32(Grid.DataKeys[i].Value);
                 string Path = Server.MapPath("../Upload/");
                 obj.DeleteRegistrationByID(Convert.ToInt32(Id), Path);
            }
        }
     
        Bind_GridAll();
    }
  
}