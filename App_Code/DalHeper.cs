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


#region DalHeper
public class DalHelpers
{

    public static string ReturnCommandParamName(string paramName)
    {
        string returnValue = String.Empty;

        switch (AppConfiguration.ConnectionStringSettings().ProviderName.ToLower())
        {
            case "system.data.sqlclient":
                returnValue = "@" + paramName;
                break;
            case "system.data.oledb":
                returnValue = "?";
                break;
            default:
                throw new NotSupportedException("The provider " + AppConfiguration.ConnectionStringSettings().ProviderName + " not supporter");
        }
        return returnValue;
    }
    public static string ReturnDate()
    {
        string returnDate;
        switch (AppConfiguration.ConnectionStringSettings().ProviderName.ToLower())
        {
            case "system.data.sqlclient":
                returnDate = DateTime.Now.ToShortDateString();
                break;
            case "system.data.oledb":
                returnDate = DateTime.Now.ToShortDateString();
                break;
            case "system.data.odbc":
                returnDate = DateTime.Now.ToString("yyyy-MM-dd");
                break;
            default:
                throw new NotSupportedException("The provider " + AppConfiguration.ConnectionStringSettings().ProviderName + " not supporter");
        }
        return returnDate;
    }

    public static string UploadFile(FileUpload PhotoUpload, int Dim, string StoragePath)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = PhotoUpload.PostedFile;
            int nFileLength = myFile.ContentLength;

            //Checking the extension of the file. Only .Jpg, .JPEG,.bmp, .gif are allowed
            string extension = GetPictureExtension(PhotoUpload.FileName).ToUpper();

            if (extension.Equals(""))
            {

            }
            else
            {
                if (nFileLength > 0)
                {

                    //Using automatically calls the dispose function to dispose the objects that are being used
                    //by the Image, Bitmap, Graphics objects
                    using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(myFile.InputStream))
                    {
                        Size newSize = CalculateDimensions(oldImage.Size, Dim);
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

                                //Creating the unique filename so that there will be no conflict
                                filename = strGUID + extension;

                                //Storing the image
                                try
                                {
                                    StoragePath = StoragePath + filename;
                                    newImage.Save(StoragePath, ImageFormat.Jpeg);
                                }
                                catch (Exception exc)
                                {
                                    filename = "";
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
    public static string GetPictureExtension(string strPictureName)
    {
        if (strPictureName.ToUpper().EndsWith(".JPG"))
            return ".JPG";

        else if (strPictureName.ToUpper().EndsWith(".JPEG"))
            return ".JPEG";

        else if (strPictureName.ToUpper().EndsWith(".GIF"))
            return ".GIF";

        else if (strPictureName.ToUpper().EndsWith(".BMP"))
            return ".BMP";
        else if (strPictureName.ToUpper().EndsWith(".PNG"))
            return ".png";
        else
            return "";
    }

    public static Size CalculateDimensions(Size oldSize, int targetSize)
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

#endregion
