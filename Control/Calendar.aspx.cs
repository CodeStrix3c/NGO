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

public partial class Admin_Calendar : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date.ToString("MM/dd/yyyy") == DateTime.Now.ToString("MM/dd/yyyy"))
        {
            e.Cell.BackColor = System.Drawing.Color.LightGray;
        }

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        string strjscript = "<script language='javascript'>";
        strjscript += "window.opener." + HttpContext.Current.Request.QueryString["formname"];
        strjscript += ".value = '" + Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "';window.close();";
        strjscript += "</script" + ">"; //Don't ask, tool bug.
        Literal1.Text = strjscript;

    }
}
