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

public partial class Secure_studentDetails : System.Web.UI.Page
{
    protected iLayer obj;
    protected StudentRegistrationBLL oCategoryManger;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        oCategoryManger = new StudentRegistrationBLL();

        if (Request.QueryString["Id"] == "" || Request.QueryString["Id"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }
    }
    private void Bind_Grid()
    {

        DataSet ds = oCategoryManger.GetStudentRegistrationsbyId(Convert.ToInt32(Request.QueryString["Id"]));
        Grid.DataSource = ds;
        Grid.DataBind();

    }


    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HtmlGenericControl divOtherEcucation, divOtherWorkExperience, divotherAchievements, divotherBudgets, divstudentEducation, divstudentACHIEVEMENTS, divstudentEducationExpanses;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataSet ds = oCategoryManger.GetStudentRegistrationsbyId(Convert.ToInt32(Request.QueryString["Id"]));
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

    
}