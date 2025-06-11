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


public partial class Secure_Add_Issue : System.Web.UI.Page
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
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        #region  Attachment
        string strGUID = Guid.NewGuid().ToString();
        string filename = Addfile.FileName.ToString();
        string[] filearray = new string[2];
        filearray = filename.Split('.');
        string SaveLocation = Server.MapPath("~\\Upload/Issue") + "\\" + strGUID + "_" + Addfile.FileName;
        Addfile.PostedFile.SaveAs(SaveLocation);
        string AttachmentName = strGUID + "_" + Addfile.FileName.ToString();
        #endregion

        string theSQL = "";
        theSQL += "INSERT INTO MonthIssue(Title,Url,CreatedDate,IsPublic) VALUES(";
        theSQL += "'" + txtName.Text.Replace("'", "''") + "',";
        theSQL += "'" + AttachmentName.Replace("'", "''") + "',";
        theSQL += "'" + obj.ReturnDate() + "',";
        theSQL += true;
        theSQL += ")";
        MsgBox.Show(obj.InsertNews(theSQL));
        txtName.Text = "";
        Bind_GridAll();

    }
    private void Bind_GridAll()
    {

        DataSet ds = obj.GetMonthIssue();
        Grid.DataSource = ds;
        Grid.DataBind();
    }

    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_GridAll();
    }
    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex.ToString());
        string PhotoID = Grid.DataKeys[index].Value.ToString();
        string Path = Server.MapPath("../Upload/Issue/");
        obj.DeleteMonthIssueByID(Convert.ToInt32(PhotoID), Path);
        MsgBox.Show("Delete Successfully");
        Bind_GridAll();

    }
    protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = Grid.DataSource as DataTable;
        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);
            Grid.DataSource = dataView;
            Grid.DataBind();
        }
        else
        {
            Bind_GridAll();
        }
    }
    protected string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;
        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "ASC";
                break;

            case SortDirection.Descending:
                newSortDirection = "DESC";
                break;
        }

        return newSortDirection;
    }
    public string getPhotos(object varPhoto)
    {
        string varphotos = varPhoto.ToString();
        string varReturn;
        if (varphotos.ToString().EndsWith("PDF"))
        {
            varReturn = "../Images/pdficon.png";
        }
        else if (varphotos.ToString().EndsWith("pdf"))
        {
            varReturn = "../Images/pdficon.png";
        }
        else if (varphotos.ToString().EndsWith("DOC"))
        {
            varReturn = "../Images/docx-win-icon.png";
        }
        else if (varphotos.ToString().EndsWith("doc"))
        {
            varReturn = "../Images/docx-win-icon.png";
        }
        else if (varphotos.ToString().EndsWith("DOCX"))
        {
            varReturn = "../Images/docx-win-icon.png";
        }
        else if (varphotos.ToString().EndsWith("docx"))
        {
            varReturn = "../Images/docx-win-icon.png";
        }
        else if (varphotos.ToString().EndsWith("txt"))
        {
            varReturn = "../Images/notepad-icon.png";
        }
        else if (varphotos.ToString().EndsWith("TXT"))
        {
            varReturn = "../Images/notepad-icon.png";
        }
        else
        {
            varReturn = "";
        }
        return varReturn;
    }
    public string FileURL(object varfileUrl)
    {
        return "../Upload/Issue/" + varfileUrl.ToString();
    }
}