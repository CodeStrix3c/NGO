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

public partial class Secure_Donation_view : System.Web.UI.Page
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

        DataSet ds = obj.GetDonationDeatils();
        Grid.DataSource = ds;
        Grid.DataBind();

    }
    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        int index = Convert.ToInt32(e.RowIndex.ToString());
        string ID = Grid.DataKeys[index].Value.ToString();
        obj.DeleteDonationDeatils(Convert.ToInt32(ID));
        MsgBox.Show("Delete Successfully");
        Bind_Grid();

    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_Grid();
    }
}