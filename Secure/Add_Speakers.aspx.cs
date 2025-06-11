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

public partial class FazilKashmir_Ad_Add_Speakers : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        #region "Images"
        string file1 = UploadImage1(180);
        string O1 = Upload(-1, "Ofile");
        if (file1 == "")
        {
            O1 = "n/a";
            //file1 = "n/a";
        }
        #endregion
        try
        {
            string theSQL = "";
            theSQL += "INSERT INTO Speakers (SName,Address,ContactNo,Photo,CreatedDate,IsPublished,IsActive) VALUES(";
            theSQL += "'" + txtName.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtAddress.Text.Replace("'", "''") + "',";
            theSQL += "'" + txtContactNo.Text.Replace("'", "''") + "',";
            theSQL += "'" + file1.Replace("'", "''") + "',";
            theSQL += "'" + obj.ReturnDate() + "',";
            theSQL += "'" + true + "',";
            theSQL += true;
            theSQL += ")";
            MsgBox.Show(obj.InsertSpeakers(theSQL));
            Reset();
        }
        catch { }
    }

    protected void Reset()
    {
        txtAddress.Text = "";
        txtName.Text = "";
        txtContactNo.Text = "";
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