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
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Text;

public partial class Secure_exportPdf : System.Web.UI.Page
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
        DataSet ds = obj.GetNewRegistrationForPDF_FE();
        Grid.DataSource = ds;
        Grid.DataBind();

        //string str = "";
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    DataRow dr;
        //    int i = 0;

        //    for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        //    {
        //        dr = ds.Tables[0].Rows[i];

        //        str += "<table>";
        //        str += " <tr>";
        //        str += "<td style=\"width:100%\">";
        //        str += " <br />";
        //        str += " <b>";
        //        str += "" + dr["Name"].ToString() + "</b><br />";
        //        str += " <b> Job Location :-  </b> " + dr["PreferenceDistOne"].ToString() + ",";
        //        str += " " + dr["PreferenceDistTwo"].ToString() + ",";
        //        str += " " + dr["PreferenceDistThree"].ToString() + " <br />";

        //        str += "<b>Post Name:</b>";
        //        str += " " + dr["PostName"].ToString() + "<br />";
        //        str += " <b>Date:</b>";
        //        str += " " + dr["CreatedDate"].ToString() + " <br />";
        //        str += "  <b>Gender:</b>";
        //        str += " " + dr["Gender"].ToString() + " ";
        //        str += " <b>, Marital Status:</b>";
        //        str += "" + dr["MaritalStatus"].ToString() + " <br />";
        //        str += "<b>DOB:</b>";
        //        str += "" + dr["DOB"].ToString() + " <br />";
        //        str += " <b>Parentage/Husband's Name:</b>";
        //        str += " " + dr["Parentage"].ToString() + " <br />";
        //        str += " <b>Email:</b>";
        //        str += " " + dr["Email"].ToString() + " <br />";
        //        str += "  <b>Mobile No:</b>";
        //        str += "" + dr["MobileNo"].ToString() + " <br />";
        //        str += " <b>Alternate Contact:</b>";
        //        str += "" + dr["AlternateNo"].ToString() + " <br />";

        //        str += " <h3>Permanent Address</h3>";
        //        str += " <b>Address :</b>";
        //        str += " " + dr["Address"].ToString() + "<br />";
        //        str += " <b>District :</b>";
        //        str += "" + dr["District"].ToString() + " <br />";
        //        str += " <b>State :</b>";
        //        str += "" + dr["State"].ToString() + " <br />";
        //        str += " <b>PinCode :</b>";
        //        str += " " + dr["PinCode"].ToString() + " <br />";

        //        str += " <h3>Present Address</h3>";
        //        str += " <b>Address :</b>";
        //        str += "" + dr["PAddress"].ToString() + " <br />";
        //        str += "<b>District :</b>";
        //        str += "" + dr["PDistrict"].ToString() + " <br />";
        //        str += " <b>State :</b>";
        //        str += "" + dr["PState"].ToString() + " <br />";
        //        str += " <b>PinCode :</b>";
        //        str += " " + dr["PPinCode"].ToString() + " <br />";

        //        str += " </td>";
        //        str += " <td style=\"width: 200px\">";

        //        str += "  <img alt=\"\" src=\"../Upload/" + dr["FileUrl"].ToString() + "\" style=\"width: 200px; padding-left: 100px; padding-right: 10px\" />";
        //        str += "  <img alt=\"\" src=\"../Upload/" + dr["SigUrl"].ToString() + "\" style=\"width: 200px; padding-left: 100px; padding-right: 10px\" />";


        //        str += " </td>";
        //        str += " </tr>";
        //        str += "</table>";
        //        str += " <h3>Education Details: </h3>";
        //        str += " <table>";
        //        str += " <tr>";
        //        str += " <td style=\"width: 130px; border:1px solid #000;\">";
        //        str += "  <b>Examination Passed</b>";
        //        str += " </td>";
        //        str += " <td style=\"width: 150px; border: 1px solid #000;\">";
        //        str += "  <b>Subject</b>";
        //        str += "  </td>";
        //        str += " <td style=\"width: 100px; border: 1px solid #000;\">";
        //        str += "   <b>Year Of Passing</b>";
        //        str += "  </td>";
        //        str += "  <td style=\"width: 70px; border: 1px solid #000;\">";
        //        str += "    <b>Max. Marks</b>";
        //        str += " </td>";
        //        str += " <td style=\"width: 100px; border: 1px solid #000;\">";
        //        str += "     <b>Marks Obtained</b>";
        //        str += "  </td>";
        //        str += "  <td style=\"width: 30px; border: 1px solid #000;\">";
        //        str += "      <b>%</b>";
        //        str += "  </td>";
        //        str += "  <td style=\"width: 150px; border: 1px solid #000;\">";
        //        str += "      <b>University/Board</b>";
        //        str += "   </td>";
        //        str += "  </tr>";
        //        str += " <tr>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["ExamPassed"].ToString() + " </td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "  " + dr["Subject"].ToString() + " </td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "   " + dr["PassingYear"].ToString() + " </td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "   " + dr["MaxMarks"].ToString() + " </td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += "  " + dr["MarksObtained"].ToString() + "  </td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += "   " + dr["Percentage"].ToString() + " </td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += "   " + dr["UniversityBoard"].ToString() + " </td>";
        //        str += " </tr>";
        //        str += " <tr>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += "  " + dr["ExamPassedOne"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["SubjectOne"].ToString() + " </td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["PassingYearOne"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "  " + dr["MaxMarksOne"].ToString() + " </td>";
        //        str += "<td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["MarksObtainedOne"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["PercentageOne"].ToString() + " </td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += "  " + dr["UniversityBoardOne"].ToString() + "</td>";
        //        str += "  </tr>";
        //        str += " <tr>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["ExamPassedTwo"].ToString() + " </td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += "  " + dr["SubjectTwo"].ToString() + " </td>";
        //        str += "<td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["PassingYearTwo"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["MaxMarksTwo"].ToString() + " </td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "  " + dr["MarksObtainedTwo"].ToString() + " </td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "  " + dr["PercentageTwo"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["UniversityBoardTwo"].ToString() + "</td>";
        //        str += " </tr>";
        //        str += " <tr>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["ExamPassedThree"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "" + dr["SubjectThree"].ToString() + "</td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["PassingYearThree"].ToString() + " </td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "" + dr["MaxMarksThree"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "" + dr["MarksObtainedThree"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "" + dr["PercentageThree"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["UniversityBoardThree"].ToString() + " </td>";
        //        str += " </tr>";
        //        str += " <tr>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["ExamPassedFour"].ToString() + " </td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += "" + dr["SubjectFour"].ToString() + " </td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["PassingYearFour"].ToString() + " </td>";
        //        str += "   <td style=\"border: 1px solid #ddd;\">";
        //        str += "" + dr["MaxMarksFour"].ToString() + " </td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">";
        //        str += "" + dr["MarksObtainedFour"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += "" + dr["PercentageFour"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">";
        //        str += " " + dr["UniversityBoardFour"].ToString() + " </td>";
        //        str += " </tr>";
        //        str += "</table>";
        //        str += " <h3>Experience Details: </h3>";
        //        str += " <table>";
        //        str += "  <tr>";
        //        str += "   <td style=\"width: 130px; border: 1px solid #000;\">";
        //        str += "     <b>Position Held</b>";
        //        str += "  </td>";
        //        str += "  <td style=\"width: 70px; border: 1px solid #000;\">";
        //        str += "      <b>Period From</b>";
        //        str += "   </td>";
        //        str += "  <td style=\"width: 70px; border: 1px solid #000;\">";
        //        str += "   <b>Period To</b>";
        //        str += " </td>";
        //        str += "  <td style=\"width: 70px; border: 1px solid #000;\">";
        //        str += "     <b>Gross Salary</b>";
        //        str += "  </td>";
        //        str += "  <td style=\"width: 160px; border: 1px solid #000;\">";
        //        str += "      <b>Responsibilities</b>";
        //        str += "   </td>";
        //        str += " <td style=\"width: 140px; border: 1px solid #000;\">";
        //        str += "    <b>Reasons for leaving the job</b>";
        //        str += " </td>";
        //        str += " <td style=\"width: 80px; border: 1px solid #000;\">";
        //        str += "   <b>Total Experience</b>";
        //        str += " </td>";
        //        str += " </tr>";
        //        str += " <tr>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">" + dr["Position"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["PFrom"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["PTo"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["GSalary"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["Responsibilities"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["Reasons"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["Experience"].ToString() + "</td>";
        //        str += " </tr>";
        //        str += " <tr>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["PositionOne"].ToString() + "</td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">" + dr["PFromOne"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["PToOne"].ToString() + "</td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">" + dr["GSalaryOne"].ToString() + "</td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">" + dr["ResponsibilitiesOne"].ToString() + "</td>";
        //        str += "  <td style=\"border: 1px solid #ddd;\">" + dr["ReasonsOne"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["ExperienceOne"].ToString() + "</td>";
        //        str += " </tr>";
        //        str += "  <tr>";
        //        str += "   <td style=\"border: 1px solid #ddd;\">" + dr["PositionTwo"].ToString() + "</td>";
        //        str += "   <td style=\"border: 1px solid #ddd;\">" + dr["PFromTwo"].ToString() + "</td>";
        //        str += "   <td style=\"border: 1px solid #ddd;\">" + dr["PToTwo"].ToString() + "</td>";
        //        str += "   <td style=\"border: 1px solid #ddd;\">" + dr["GSalaryTwo"].ToString() + "</td>";
        //        str += "   <td style=\"border: 1px solid #ddd;\">" + dr["ResponsibilitiesTwo"].ToString() + "</td>";
        //        str += "   <td style=\"border: 1px solid #ddd;\">" + dr["ReasonsTwo"].ToString() + "</td>";
        //        str += "   <td style=\"border: 1px solid #ddd;\">" + dr["ExperienceTwo"].ToString() + "</td>";
        //        str += " </tr>";
        //        str += "</table>";
        //        str += " <h3>Drivers  Details: </h3>";
        //        str += " <table>";
        //        str += "  <tr>";
        //        str += " <td style=\"width: 130px; border: 1px solid #000;\">";
        //        str += "  <b>Driving License No</b>";
        //        str += "  </td>";
        //        str += " <td style=\"width: 150px; border: 1px solid #000;\">";
        //        str += "   <b>License Validity</b>";
        //        str += " </td>";
        //        str += "  <td style=\"width: 150px; border: 1px solid #000;\">";
        //        str += "   <b>Period To</b>";
        //        str += " </td>";
        //        str += " <td style=\"width: 150px; border: 1px solid #000;\">";
        //        str += " <b>Driving License Class</b>";
        //        str += " </td>";
        //        str += " <td style=\"width: 160px; border: 1px solid #000;\">";
        //        str += "  <b>License Issuing authority</b>";
        //        str += " </td>";
        //        str += "   </tr>";
        //        str += "<tr>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["LicenseNo"].ToString() + "</td>";
        //        str += "<td style=\"border: 1px solid #ddd;\">" + dr["LicenseValidity"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["LicensePeriodTo"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["LicenseClass"].ToString() + "</td>";
        //        str += " <td style=\"border: 1px solid #ddd;\">" + dr["LicenseAuthority"].ToString() + "</td>";
        //        str += " </tr>";
        //        str += " </table><br><hr/>";

        //    }
        //    ltrDetails.Text = str;
        //}

    }

    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_GridAll();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }
    //protected void btnExportPDF_Click(object sender, EventArgs e)
    //{
    //    Response.ContentType = "application/pdf";
    //    Response.AddHeader("content-disposition", "attachment;filename=Applications.pdf");
    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //    StringWriter sw = new StringWriter();
    //    HtmlTextWriter hw = new HtmlTextWriter(sw);
    //    Grid.AllowPaging = false;
    //    Grid.DataBind();
    //    Grid.RenderControl(hw);
    //    StringReader sr = new StringReader(sw.ToString());
    //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
    //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
    //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
    //    pdfDoc.Open();
    //    htmlparser.Parse(sr);
    //    pdfDoc.Close();
    //    Response.Write(pdfDoc);
    //    Response.End();

    //}


    protected string GetUrl(string imagepath)
    {
        string[] splits = Request.Url.AbsoluteUri.Split('/');
        if (splits.Length >= 2)
        {
            string url = splits[0] + "//";
            for (int i = 2; i < splits.Length - 1; i++)
            {
                url += splits[i];
                url += "/";
            }
            return url + imagepath;
        }
        return imagepath;
    }
 
}