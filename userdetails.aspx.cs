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

public partial class userdetails : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (!IsPostBack)
        {
            Bind_Grid();

        }
    }
    protected void Bind_Grid()
    {
        if (Session["Id"] != null)
        {
            int id = Convert.ToInt32(Session["Id"].ToString());
            DataSet ds = obj.GetStudentRegistrationById(id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                merchant_param2.Value = "INDIAN";
                amount.Value = ds.Tables[0].Rows[0]["FeePay"].ToString();
                merchant_param1.Value = ds.Tables[0].Rows[0]["id"].ToString();
                billing_name.Value = ds.Tables[0].Rows[0]["firstName"].ToString() + " " + ds.Tables[0].Rows[0]["middleName"].ToString() + " " + ds.Tables[0].Rows[0]["lastname"].ToString();
                lname.Value = ds.Tables[0].Rows[0]["lastname"].ToString();
                billing_email.Value = ds.Tables[0].Rows[0]["emailid"].ToString();
                billing_tel.Value = ds.Tables[0].Rows[0]["contactNo"].ToString();
                billing_address.Value = ds.Tables[0].Rows[0]["jform_street_Village"].ToString();
                billing_city.Value = ds.Tables[0].Rows[0]["jform_City"].ToString();
                billing_zip.Value = ds.Tables[0].Rows[0]["jform_PinCode"].ToString();
            }

            Grid.DataSource = ds;
            Grid.DataBind();

        }
        else
        {
             Response.Redirect("userlogin.aspx");
        }
    }

    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HtmlGenericControl divOtherEcucation, divOtherWorkExperience, divotherAchievements, divotherBudgets, divstudentEducation, divstudentACHIEVEMENTS, divstudentEducationExpanses;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int id = Convert.ToInt32(Session["Id"].ToString());
            DataSet ds = obj.GetStudentRegistrationById(id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string val = ds.Tables[0].Rows[0]["occupation"].ToString();
                if (val == "Student")
                {
                    divOtherEcucation = (HtmlGenericControl)e.Row.FindControl("otherEducation") as HtmlGenericControl;
                    divOtherEcucation.Visible = false;
                    divOtherWorkExperience = (HtmlGenericControl)e.Row.FindControl("otherWorkExperience") as HtmlGenericControl;
                    divOtherWorkExperience.Visible = false;
                    divotherAchievements = (HtmlGenericControl)e.Row.FindControl("otherAchievements") as HtmlGenericControl;
                    divotherAchievements.Visible = false;
                    divotherBudgets = (HtmlGenericControl)e.Row.FindControl("otherBudgets") as HtmlGenericControl;
                    divotherBudgets.Visible = false;

                }
                else
                {

                    divstudentEducation = (HtmlGenericControl)e.Row.FindControl("studentEducation") as HtmlGenericControl;
                    divstudentEducation.Visible = false;
                    divstudentACHIEVEMENTS = (HtmlGenericControl)e.Row.FindControl("studentACHIEVEMENTS") as HtmlGenericControl;
                    divstudentACHIEVEMENTS.Visible = false;
                    divstudentEducationExpanses = (HtmlGenericControl)e.Row.FindControl("studentEducationExpanses") as HtmlGenericControl;
                    divstudentEducationExpanses.Visible = false;

                }
            }

        }
    }

    

    public string RandomDigits(int length)
    {
        var random = new Random();
        string s = string.Empty;
        for (int i = 0; i < length; i++)
            s = String.Concat(s, random.Next(10).ToString());
        return s;
    }
}