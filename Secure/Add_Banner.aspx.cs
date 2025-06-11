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


public partial class Secure_Add_Banner : System.Web.UI.Page
{
    protected ReeLogic Utility;
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        Ofile.Focus();
        obj = new iLayer();
        Utility = new ReeLogic();
        if (!IsPostBack)
        {
            Bind_Grid();
        }
    }
    protected void Bind_Grid()
    {
        DataSet ds = obj.GetAllBanners();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void imgAdd_Click(object sender, ImageClickEventArgs e)
    {

        string mediumImage = UploadImage(1, 1260, 400);
        string theSQL = "";
        theSQL += "INSERT INTO Banner(Title,Intro,Description,ImageUrl) VALUES(";
        theSQL += "'" + caption.Value.Replace("'", "''") + "',";
        theSQL += "'" + txtIntro.Text.Replace("'", "''") + "',";
        theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
        theSQL += "'" + mediumImage.Replace("'", "''") + "'";
        theSQL += ")";
        MsgBox.Show(obj.InsertData(theSQL));
        caption.Value = "";
        txtIntro.Text = "";
        txtDescription.Text = "";
        Bind_Grid();
     
    }
    protected void GridView1_PageIndexChanged(object sender, GridViewPageEventArgs e)
    {
        int index = e.NewPageIndex;
        GridView1.PageIndex = index;
        Bind_Grid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Bind_Grid();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex.ToString());
        string PhotoID = GridView1.DataKeys[index].Value.ToString();
        string Path = Server.MapPath("../Upload/");
        PhotoManage.RemoveBanner(Convert.ToInt32(PhotoID), Path);
        GridView1.EditIndex = -1;
        Bind_Grid();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex.ToString());
        string PhotoID = GridView1.DataKeys[index].Value.ToString();
        string Caption = ((TextBox)(GridView1.Rows[index].FindControl("txtCaption"))).Text.Replace("'", "''");
        PhotoManage.EditBanner(Caption, Convert.ToInt32(PhotoID));
        GridView1.EditIndex = -1;
        Bind_Grid();

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        Bind_Grid();
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
                            Size newSize = CalculateDimensions(oldImage.Size, Width, Height);
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
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        if (((Byte[])e.Values["ImageUrl"]).Length == 0) e.Cancel = true;
    }
    public string getPhotos(object varPhoto)
    {
        string varphotos = varPhoto.ToString();
        string varReturn;
        if (string.IsNullOrEmpty(varPhoto.ToString()))
        {
            varReturn = "../Upload/NoPhoto.jpg";
        }
        else
        {
            varReturn = "../Upload/" + varphotos;
        }
        return varReturn;
    }
}