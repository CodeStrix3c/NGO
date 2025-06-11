using System;
using System.Data;
using System.IO;
using System.Text;
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
using System.Data.Common;

public partial class FazilKashmir_Ad_Edit_Speaker : System.Web.UI.Page
{

    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (Request.QueryString["ID"] == "" || Request.QueryString["ID"] == null)
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
    protected void Bind_Grid()
    {
        DataSet ds = obj.GetSpeakersByID(Convert.ToInt32(Request.QueryString["ID"]));
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                if (dr["Photo"].ToString() == "n/a")
                {
                }
                else
                {
                    hdnth1.Value = dr["Photo"].ToString();
                    of1.Text = "<img src='../Upload/" + dr["Photo"].ToString() + "' class='photo_198' style='border: 2px solid white; ' alt='' />";
                }
                txtName.Text = dr["SName"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtContactNo.Text = dr["ContactNo"].ToString();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }

    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string theSQL = "";
        string Path = Server.MapPath("../Upload/");
        if (Ofile.HasFile)
        {
            if (hdnth1.Value != "")
            {
                string iPath = "";
                iPath = Path + hdnth1.Value;
                File.Delete(iPath);
              
            }
            string thumbImage = "n/a";
            thumbImage = UploadImage1(180);
            string filename = Upload(-1, "Ofile");
            theSQL = " UPDATE Speakers SET";
            theSQL += " SName ='" + txtName.Text.Replace("'", "''") + "',";
            theSQL += " Address ='" + txtAddress.Text.Replace("'", "''") + "',";
            theSQL += " ContactNo ='" + txtContactNo.Text.Replace(",", "''") + "', ";
            theSQL += " Photo ='" + thumbImage + "'";
            theSQL += " WHERE ID =" + Convert.ToInt32(Request.QueryString["ID"]);
            Utility.UpdateData(theSQL);
        }

        theSQL = " UPDATE Speakers SET";
        theSQL += " SName ='" + txtName.Text.Replace("'", "''") + "',";
        theSQL += " Address ='" + txtAddress.Text.Replace("'", "''") + "',";
        theSQL += " ContactNo ='" + txtContactNo.Text.Replace(",", "''") + "',";
        theSQL += " CreatedDate ='" + obj.ReturnDate() + "'";
        theSQL += " WHERE ID =" + Convert.ToInt32(Request.QueryString["ID"]);
        theSQL = Utility.UpdateData(theSQL);
        if (theSQL == "Success")
        {
            Response.Redirect("View_Speaker.aspx");
        }
    }
    protected string Upload(int targetSize, string HtmlUpload)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = Ofile.PostedFile;
            string extension = "";
            if (HtmlUpload == "Ofile")
            {
                myFile = Ofile.PostedFile;
                filename = Ofile.FileName;
                extension = Utility.GetPictureExtension(Ofile.PostedFile.FileName).ToUpper();
            }

            int nFileLength = myFile.ContentLength;
            if (extension.Equals(""))
            {
                filename = "";
            }
            else
            {
                if (nFileLength > 0)
                {
                    using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(myFile.InputStream))
                    {
                        if (targetSize == -1)
                        {

                            //Guid creates a unique identifier
                            string strGUID = Guid.NewGuid().ToString();
                            //Checking the extension of the file
                            //only .Jpg, .JPEG,.bmp, .gif are allowed
                            string[] fi = filename.Split('.');
                            //Creating the unique filename so that there will be no conflict
                            filename = strGUID + extension;

                            //Storing the image
                            try
                            {
                                string storagePath = Server.MapPath("../Upload/") + filename;
                                if (extension == ".JPG")
                                {
                                    oldImage.Save(storagePath, ImageFormat.Jpeg);
                                }
                                else if (extension == ".JPEG")
                                {
                                    oldImage.Save(storagePath, ImageFormat.Jpeg);
                                }
                                else if (extension == ".PNG")
                                {
                                    oldImage.Save(storagePath, ImageFormat.Png);
                                }
                                else if (extension == ".GIF")
                                {
                                    oldImage.Save(storagePath, ImageFormat.Gif);
                                }
                                else if (extension == ".BMP")
                                {
                                    oldImage.Save(storagePath, ImageFormat.Bmp);
                                }
                            }
                            catch (Exception exc)
                            {
                                filename = "";
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            filename = "";
        }
        return (filename);
    }
    protected string UploadImage1(int targetSize)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = Ofile.PostedFile;
            int nFileLength = myFile.ContentLength;

            string extension = Utility.GetPictureExtension(Ofile.FileName).ToUpper();

            if (extension.Equals(""))
            {
                filename = "";
            }
            else
            {
                if (nFileLength > 0)
                {
                    using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(myFile.InputStream))
                    {
                        if (targetSize == -1)
                        {

                            //Guid creates a unique identifier
                            string strGUID = Guid.NewGuid().ToString();

                            //Checking the extension of the file
                            //only .Jpg, .JPEG,.bmp, .gif are allowed

                            //Creating the unique filename so that there will be no conflict
                            filename = strGUID + extension;

                            //Storing the image
                            try
                            {
                                string storagePath = Server.MapPath("../Upload/") + filename;
                                oldImage.Save(storagePath, ImageFormat.Jpeg);
                            }
                            catch (Exception exc)
                            {
                                filename = "";
                            }
                        }
                        else
                        {
                            Size newSize = CalculateDimensions(oldImage.Size, targetSize);
                            using (Bitmap newImage = new Bitmap(newSize.Width, newSize.Height, PixelFormat.Format24bppRgb))
                            {
                                using (Graphics canvas = Graphics.FromImage(newImage))
                                {
                                    canvas.SmoothingMode = SmoothingMode.AntiAlias;
                                    canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                                    canvas.PixelOffsetMode = PixelOffsetMode.HighQuality;
                                    canvas.DrawImage(oldImage, new Rectangle(new Point(0, 0), newSize));

                                    //Guid creates a unique identifier
                                    string strGUID = Guid.NewGuid().ToString();

                                    //Checking the extension of the file
                                    //only .Jpg, .JPEG,.bmp, .gif are allowed

                                    //Creating the unique filename so that there will be no conflict
                                    filename = strGUID + extension;

                                    //Storing the image
                                    try
                                    {
                                        string storagePath = Server.MapPath("../Upload/") + filename;
                                        newImage.Save(storagePath, ImageFormat.Jpeg);
                                    }
                                    catch (Exception exc)
                                    {
                                        filename = "";
                                    }
                                }
                            }
                        }

                    }
                }
                else
                {

                }
            }
        }
        catch (Exception ex)
        {
            filename = "";
        }
        return (filename);
    }
    private static Size CalculateDimensions(Size oldSize, int targetSize)
    {
        Size newSize = new Size();
        if (oldSize.Height > oldSize.Width)
        {
            newSize.Width = (int)(oldSize.Width * ((float)targetSize / (float)oldSize.Height));
            newSize.Height = targetSize;
        }
        else
        {
            newSize.Width = targetSize;
            newSize.Height = (int)(oldSize.Height * ((float)targetSize / (float)oldSize.Width));
        }
        return newSize;
    }

}