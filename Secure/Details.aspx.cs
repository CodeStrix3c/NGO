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
        Page.MaintainScrollPositionOnPostBack = true;
        Bin_FormView();
    }
    protected void Bin_FormView()
    {
        IList li = PhotoManage.GetNewPhotos(Convert.ToInt32(Request.QueryString["PhotoID"]));
        FormView1.DataSource = li;
        FormView1.DataBind();
    }
    protected void FormView1_PageIndexChanged(object sender, FormViewPageEventArgs e)
    {
        int index = e.NewPageIndex;
        FormView1.PageIndex = index;
        Bin_FormView();
    }
}
