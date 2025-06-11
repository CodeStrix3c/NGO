using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class result : System.Web.UI.Page
{

    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = obj.GetResultByRollNo(txtSearch.Text);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["IsPublished"].ToString() != "0")
                {
                   
                    lblmessage.Text = "<b>Congratulations!!</b><br>You have been selected for Free Coaching Program offered by Ehsaase-e-Insaniyat Trust and NABARD. Please contact our office for further information.";
                }
                else
                {
                   
                    lblmessage.Text = "<b>Sorry!!</b><br>We do not find your name in the selection list. You may have been placed in waiting queue, please contact our office for assistance.";
                }
            }
            else
            {
                lblmessage.Text = "Sorry this Roll No. is not available";
            }

        }
        catch
        {
            lblmessage.Text = "Sorry this Roll No. is not available";
        }
    }
}