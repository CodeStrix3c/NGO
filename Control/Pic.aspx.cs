using System.Collections;
using System.ComponentModel;
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
using System.Data.Odbc;
public partial class Control_Pic : System.Web.UI.Page
{
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility = new ReeLogic();
        PhotoSize size;
        switch (Request.QueryString["Size"])
        {
            case "S":
                size = PhotoSize.Small;
                break;
            case "M":
                size = PhotoSize.Medium;
                break;
            case "L":
                size = PhotoSize.Large;
                break;
            default:
                size = PhotoSize.Original;
                break;
        }
        // Setup the PhotoID Parameter
        Int32 id = -1;
        string filename = "";
        if (Request.QueryString["PhotoID"] != null && Request.QueryString["PhotoID"] != "")
        {
            id = Convert.ToInt32(Request.QueryString["PhotoID"]);
            filename = PhotoManage.GetPhoto(id, size);
        }
        else
        {
            id = Convert.ToInt32(Request.QueryString["AlbumID"]);
            filename = PhotoManage.GetFirstPhoto(id, size);
        }
        // Get the photo from the database, if nothing is returned, get the default "placeholder" photo
        if (filename == null || filename == "")
        {
            filename = PhotoManage.GetPhoto(size);
            string Path = "Upload/" + filename;
            img.ImageUrl = Path;
        }
        else
        {

            string Path = "Upload/" + filename;
            img.ImageUrl = Path;
        }
    }
}
