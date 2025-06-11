using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Net.Mail;
using System.ComponentModel.Design;
using System.Text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Data.Common;

public partial class Secure_Add_Financials : System.Web.UI.Page
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

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        #region  Foregin Funds Attachment

        #region  Domestic Funds Attachment
        string strGUID1 = Guid.NewGuid().ToString();
        string filename1 = Ofile.FileName.ToString();
        string[] filearray1 = new string[2];
        filearray1 = filename1.Split('.');
        string SaveLocation1 = Server.MapPath("~\\Upload") + "\\" + strGUID1 + "_" + Ofile.FileName;
        Ofile.PostedFile.SaveAs(SaveLocation1);
        string Domesticfunds = strGUID1 + "_" + Ofile.FileName.ToString();
        #endregion


        string strGUID = Guid.NewGuid().ToString();
        string filename = upLoadLargeImage.FileName.ToString();
        string[] filearray = new string[2];
        filearray = filename.Split('.');
        string SaveLocation = Server.MapPath("~\\Upload") + "\\" + strGUID + "_" + upLoadLargeImage.FileName;
        upLoadLargeImage.PostedFile.SaveAs(SaveLocation);
        string ForeignFunds = strGUID + "_" + upLoadLargeImage.FileName.ToString();
        #endregion

        string theSQL = "";
        theSQL += "INSERT INTO  Financials(Title,ForeignFunds,DomesticFunds,CreatedDate) VALUES(";
        theSQL += "'" + txtTitle.Text.Replace("'", "''") + "',";
        theSQL += "'" + Domesticfunds.Replace("'", "''") + "',";
        theSQL += "'" + ForeignFunds.Replace("'", "''") + "',";
        theSQL += "'" + obj.ReturnDate() + "'";
        theSQL += ")";
        MsgBox.Show(obj.InsertNews(theSQL));
        Bind_Grid();
        txtTitle.Text = "";

    }

    private void Bind_Grid()
    {
        DataSet ds = obj.GetFinancials_BE();
        Grid.DataSource = ds;
        Grid.DataBind();
    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string Index = e.NewPageIndex.ToString();
        Grid.PageIndex = Convert.ToInt32(Index);
        Bind_Grid();
    }
    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex.ToString());
        string PhotoID = Grid.DataKeys[index].Value.ToString();
        string Path = Server.MapPath("../Upload/");
        string SPath = Server.MapPath("../Upload/");
        obj.DeleteFinancialsByID(Convert.ToInt32(PhotoID), Path, SPath);
        MsgBox.Show("Delete Successfully");
        Bind_Grid();
    }
    protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = Grid.DataSource as DataTable;
        //DataTable dataTable = obj.GetUsers().Tables[0];
        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);
            Grid.DataSource = dataView;
            Grid.DataBind();
        }
        else
        {
            Bind_Grid();
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

    public string FileURL(object varfileUrl)
    {
        return "../Upload/" + varfileUrl.ToString();
    }
}