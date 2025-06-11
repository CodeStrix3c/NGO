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


public partial class Secure_Edit_MenuSubCategory : System.Web.UI.Page
{
    protected iLayer obj;
    protected static int varID;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (Request.QueryString["ID"] == "" || Request.QueryString["ID"] == null || Request.QueryString["CatID"] == "" || Request.QueryString["CatID"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            varID = Convert.ToInt32(Request.QueryString["CatID"]);
            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }
    }
    protected void Bind_Grid()
    {
        DataSet ds = obj.GetMenuSubCategoryByID(Convert.ToInt32(Request.QueryString["ID"]));
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                txtTitle.Text = dr["Title"].ToString();
                kidsPhoto.ImageUrl = "../Upload/" + ds.Tables[0].Rows[0]["ImageUrl"].ToString();
                Image1.ImageUrl = "../Upload/" + ds.Tables[0].Rows[0]["ImageUrlLarge"].ToString();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (uploadImg.HasFile)
        {
           //string mediumImage = UploadImage(100, 1260, 400);
            string ImageThumb = UploadThumbImage(100, 600, 400);
            string theSQL = "";
            theSQL = " UPDATE MenuSubCategory SET";
            theSQL += " Title='" + txtTitle.Text.Replace("'", "''") + "',";
            //theSQL += " ImageUrl='" + mediumImage.Replace("'", "''") + "',";
            theSQL += " ImageUrlLarge='" + ImageThumb.Replace("'", "''") + "'";
            theSQL += " WHERE ID=" + Convert.ToInt32(Request.QueryString["ID"]);
            theSQL = obj.UpdateData(theSQL);
            if (theSQL == "Success")
            {
               // Response.Redirect("MenuSubCategory.aspx?CatID=" + varID);
            }
        }
        if (Ofile.HasFile)
        {
            string mediumImage = UploadImage(100, 1260, 400);
            //string ImageThumb = UploadThumbImage(100, 600, 400);

            string theSQL = "";
            theSQL = " UPDATE MenuSubCategory SET";
            theSQL += " Title='" + txtTitle.Text.Replace("'", "''") + "',";
            theSQL += " ImageUrl='" + mediumImage.Replace("'", "''") + "'";
            // theSQL += " ImageUrlLarge='" + ImageThumb.Replace("'", "''") + "'";
            theSQL += " WHERE ID=" + Convert.ToInt32(Request.QueryString["ID"]);
            theSQL = obj.UpdateData(theSQL);
            if (theSQL == "Success")
            {
               // Response.Redirect("MenuSubCategory.aspx?CatID=" + varID);
            }
        }
        else
        {
            string theSQL = "";
            theSQL = " UPDATE MenuSubCategory SET";
            theSQL += " Title='" + txtTitle.Text.Replace("'", "''") + "'";
            theSQL += " WHERE ID=" + Convert.ToInt32(Request.QueryString["ID"]);
            theSQL = obj.UpdateData(theSQL);
            if (theSQL == "Success")
            {
                Response.Redirect("MenuSubCategory.aspx?CatID=" + varID);
            }
        }
        Response.Redirect("MenuSubCategory.aspx?CatID=" + varID);
    }

    protected string UploadImage(int targetSize, int Width, int Height)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = Ofile.PostedFile;
            int nFileLength = myFile.ContentLength;

            string extension = Utility.GetPictureExtension(Ofile.FileName).ToUpper();

         
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
                            /// Can be used for Static Width and Height
                            //Size newSize = CalculateDimensions(oldImage.Size, Width, Height);
                            Size newSize = CalculateDimensions(oldImage.Size, Width);
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
        catch (Exception ex)
        {
            filename = "";
        }
        return (filename);
    }
    protected string UploadImage(int targetSize)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = Ofile.PostedFile;
            int nFileLength = myFile.ContentLength;

            string extension = Utility.GetPictureExtension(Ofile.FileName).ToUpper();

            if (extension.Equals(""))
            {

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
                            /// Can be used for Static Width and Height
                            //Size newSize = CalculateDimensions(oldImage.Size, Width, Height);
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

    protected string UploadThumbImage(int targetSize, int Width, int Height)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = uploadImg.PostedFile;
            int nFileLength = myFile.ContentLength;

            string extension = Utility.GetPictureExtension(uploadImg.FileName).ToUpper();

           
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
                            /// Can be used for Static Width and Height
                            //Size newSize = CalculateDimensions(oldImage.Size, Width, Height);
                            Size newSize = CalculateDimensions(oldImage.Size, Width);
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
        catch (Exception ex)
        {
            filename = "";
        }
        return (filename);
    }

    public bool Abort()
    {
        return false;
    }

    /// <summary>
    /// Method is used to return auto Size as per width supplied
    /// </summary>
    /// <param name="oldSize">Old Size</param>
    /// <param name="targetSize">Target Width Size</param>
    /// <returns>Size</returns>
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

    /// <summary>
    /// Method is used to return Static Size as per Width and Height supplied
    /// </summary>
    /// <param name="oldSize">Old Size</param>
    /// <param name="width">Width</param>
    /// <param name="height">Height</param>
    /// <returns>Size</returns>
    private static Size CalculateDimensions(Size oldSize, int width, int height)
    {
        Size newSize = new Size();
        newSize.Height = height;
        newSize.Width = width;
        return newSize;
    }
}