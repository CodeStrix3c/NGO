using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Secure_exportExcel : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            Bind_GridAll();
        }
    }
    private void Bind_GridAll()
    {
        DataSet ds = obj.GetRegistration();
        string str = "";
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            str += "<table id=\"tbl\" runat=\"server\">";
            str += "<tr>";
            str += "<td style=\"width: 200px; border: 1px solid #000;\">";
            str += "<b>Date</b>";
            str += "</td>";
            str += "<td style=\"width: 200px; border: 1px solid #000;\">";
            str += "<b>Post Name</b>";
            str += "</td>";
            str += "<td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Name</b>";
            str += " </td>";
            str += "<td style=\"width: 200px; border: 1px solid #000;\">";
            str += "<b>Contact</b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Email</b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Education</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Max Marks</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Marks Obtained</b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Education</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Max Marks</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Marks Obtained</b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Education</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Max Marks</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Marks Obtained</b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Education</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Max Marks</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Marks Obtained</b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Education</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Max Marks</b>";
            str += " </td>";
            str += " <td style=\"width: 60px; border: 1px solid #000;\">";
            str += " <b>Marks Obtained</b>";
            str += " </td>";

            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Position </b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Ist Experience </b>";
            str += " </td>";

            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Position </b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>2nd Experience</b>";
            str += " </td>";

            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>Position </b>";
            str += " </td>";
            str += " <td style=\"width: 200px; border: 1px solid #000;\">";
            str += " <b>3rd Experience</b>";
            str += " </td>";

            str += " </tr>";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

               
                str += " <tr>";
                str += "<td style=\"border: 1px solid #ddd;\">" + Convert.ToDateTime(dr["CreatedDate"].ToString()).ToString("MM/dd/yyyy") + " </td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["PostName"].ToString() + " </td>";
                str += "<td style=\"border: 1px solid #ddd;\">" + dr["Name"].ToString() + " </td>";
                str += "<td style=\"border: 1px solid #ddd;\">" + dr["MobileNo"].ToString() + " </td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["Email"].ToString() + " </td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["ExamPassed"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MaxMarks"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MarksObtained"].ToString() + "</td>";

                str += " <td style=\"border: 1px solid #ddd;\">" + dr["ExamPassedOne"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MaxMarksOne"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MarksObtainedOne"].ToString() + "</td>";

                str += " <td style=\"border: 1px solid #ddd;\">" + dr["ExamPassedTwo"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MaxMarksTwo"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MarksObtainedTwo"].ToString() + "</td>";

                str += " <td style=\"border: 1px solid #ddd;\">" + dr["ExamPassedThree"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MaxMarksThree"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MarksObtainedThree"].ToString() + "</td>";

                str += " <td style=\"border: 1px solid #ddd;\">" + dr["ExamPassedFour"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MaxMarksFour"].ToString() + "</td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["MarksObtainedFour"].ToString() + "</td>";

                str += " <td style=\"border: 1px solid #ddd;\">" + dr["Position"].ToString() + " </td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["Experience"].ToString() + " </td>";

                str += " <td style=\"border: 1px solid #ddd;\">" + dr["PositionOne"].ToString() + " </td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["ExperienceOne"].ToString() + " </td>";

                str += " <td style=\"border: 1px solid #ddd;\">" + dr["PositionTwo"].ToString() + " </td>";
                str += " <td style=\"border: 1px solid #ddd;\">" + dr["ExperienceTwo"].ToString() + " </td>";
                str += "</tr>";
               

            }
            str += "</table>";
            ltrDetails.Text = str;
        }






    }
  
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/x-msexcel";
        Response.AddHeader("Content-Disposition", "attachment; filename=Applications.xls");
        Response.ContentEncoding = Encoding.UTF8;
        StringWriter tw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(tw);
        ltrDetails.RenderControl(hw);
        Response.Write(tw.ToString());
        Response.End();

    }

}