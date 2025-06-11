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

public partial class FazilKashmir_Ad_View_Speaker : System.Web.UI.Page
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

        DataSet ds = obj.GetSpeakers();
        Grid.DataSource = ds;
        Grid.DataBind();

    }
    public string getPhotos(object varPhoto)
    {
        string varphotos = varPhoto.ToString();
        string varReturn;
        if (string.IsNullOrEmpty(varPhoto.ToString()))
        {
            varReturn = "../Upload/NoPhoto.jpg";
        }
        else
        {
            varReturn = "../Upload/" + varphotos;
        }
        return varReturn;
    }
    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

           string ImageID = Convert.ToInt32(Grid.DataKeys[e.RowIndex].Value).ToString();
           string Path = Server.MapPath("../Upload/");
           PhotoManage.DeleteSpeakers(Convert.ToInt32(ImageID), Path);
           MsgBox.Show("Delete Sucessfully");
           Bind_Grid();
       
    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
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