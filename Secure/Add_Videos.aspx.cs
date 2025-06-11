using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class App_Data_FazilKashmir_Ad_Default2 : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (!IsPostBack)
        {
            BindSubject();
            BindDropdown();
        }
    }

    protected void BindSubject()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.GetAllVideoSubjectIds();
            ddlSubject.DataSource = ds.Tables[0];
            ddlSubject.DataTextField = "Title";
            ddlSubject.DataValueField = "ID";
            ddlSubject.DataBind();
            ListItem li = new ListItem("--Select Subject--", "0");
            ddlSubject.Items.Insert(0, li);
        }
        catch { }

    }
    protected void BindDropdown()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.GetAllSpeakers();
            ddlSpeakers.DataSource = ds.Tables[0];
            ddlSpeakers.DataTextField = "SName";
            ddlSpeakers.DataValueField = "ID";
            ddlSpeakers.DataBind();
            ListItem li = new ListItem("--Select Speaker--", "0");
            ddlSpeakers.Items.Insert(0, li);
        }
        catch { }

    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
              
        string theSQL = "";
        theSQL += "INSERT INTO Videos(Title,SubjectID,SpeakerID,Description,VideoName,CreatedDate,IsActive) VALUES(";
        theSQL += "'" + txtTitle.Text.Replace("'", "''") + "',";
        theSQL += "'" + int.Parse(ddlSubject.SelectedValue.ToString().Replace("'", "''")) + "',";
        theSQL += "'" + int.Parse(ddlSpeakers.SelectedValue.ToString().Replace("'", "''")) + "',";
        theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
        theSQL += "'" + txtAddVideoUrl.Text.Replace("'", "''") + "',";
        theSQL += "'" + obj.ReturnDate() + "',";
        theSQL += true;
        theSQL += ")";
        MsgBox.Show(obj.InsertVideos(theSQL));
        ResetControls();
    }
    protected void ResetControls()
    {
        txtDescription.Text = "";
        txtTitle.Text = "";
    }
   
}
