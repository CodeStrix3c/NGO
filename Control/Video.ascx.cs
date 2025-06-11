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

public partial class Control_Video : System.Web.UI.UserControl
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            Bind_Lit();
        }
    }
    protected void Bind_Lit()
    {
        DataSet ds = obj.GetTopOneVideo();
       // lit.Text = "<iframe width='200' height='180' src=" + ds.Tables[0].Rows[0]["VideoName"].ToString() + "></iframe>";

        lit.Text = "<iframe width='530' height='260'><embed src=" + ds.Tables[0].Rows[0]["VideoName"].ToString() + " type='application/x-shockwave-flash' allowscriptaccess='always' allowfullscreen='true' width='530' height='260'></embed></iframe>";

    }
}
