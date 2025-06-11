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

public partial class FazilKashmir_Ad_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((TextBox)FormView1.FindControl("txtCaption")).Focus();
        if (!IsPostBack)
        {
            Bind_Grid();
        }
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        string caption = ((TextBox)FormView1.FindControl("txtCaption")).Text.Replace("'", "''");
        bool ispublic = ((CheckBox)FormView1.FindControl("chkIsPublic")).Checked;
              
        PhotoManage.AddAlbum(caption, ispublic);
        Bind_Grid();
    }
    protected void Bind_Grid()
    {
        IList ds = PhotoManage.GetAlbumsWithCategory();
        FormView1.DataSource = ds;
        FormView1.DataBind();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanged(object sender, GridViewPageEventArgs e)
    {
        int index = e.NewPageIndex;
        GridView1.PageIndex = index;
        Bind_Grid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex.ToString());
        string AlbumID = GridView1.DataKeys[index].Value.ToString();
        string Path = Server.MapPath("../Upload/");
        PhotoManage.RemoveAlbum(Convert.ToInt32(AlbumID), Path);
        GridView1.EditIndex = -1;
        Bind_Grid();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}
