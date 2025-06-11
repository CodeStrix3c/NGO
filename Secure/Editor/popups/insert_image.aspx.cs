using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Text;
using System.Data.OleDb;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.VisualBasic;

public partial class Secure_popups_insert_image : System.Web.UI.Page
{
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility = new ReeLogic();
        if (!IsPostBack)
        { }
        else
        { 
        }
    }
    protected void Submit1_ServerClick(object sender, EventArgs e)
    {
        if (imageurl.HasFile)
        {
            HttpPostedFile myFile = imageurl.PostedFile;
            int nFileLength = myFile.ContentLength;

            //Guid creates a unique identifier
            string strGUID = Guid.NewGuid().ToString();

            //Checking the extension of the file
            //only .Jpg, .JPEG,.bmp, .gif are allowed

            string strPicExtension = Utility.GetPictureExtension(imageurl.FileName);
            if (strPicExtension != "")
            {
                string strFileName = Path.GetFileName(imageurl.FileName);
                string strStoredFileName = strGUID + strPicExtension;
                try
                {
                    Bitmap Image = new Bitmap(myFile.InputStream);
                    string strPath =Server.MapPath("../../Upload/")+ strStoredFileName;
                    if (strPicExtension.Equals(".JPG") || strPicExtension.Equals(".JPEG"))
                    {
                        Image.Save(strPath, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                    if (strPicExtension.Equals(".GIF"))
                    {
                        Image.Save(strPath, System.Drawing.Imaging.ImageFormat.Gif);
                    }
                    if (strPicExtension.Equals(".BMP"))
                    {
                        Image.Save(strPath, System.Drawing.Imaging.ImageFormat.Bmp);
                    }
                    //MsgBox.Show(strPath);
                   // himageurl.Value = strPath;
                    himageurl.Value = "../Upload/" + strStoredFileName;

                    //himageurl.Value = strPath;
                    Image.Dispose();
                    imageurl.Enabled = false;
                    Submit1.Visible = false;
                    btnSubmit.Visible = true;
                }
                catch (Exception ecx)
                {

                }
            }
            else
            {
                MsgBox.Show("Invalid picture extension. Only .GIF, .JPG, .BMP are allowed");
                return;
            }
        }
    }
    
   
}
