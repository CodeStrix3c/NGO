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


public partial class Secure_Add_Downloads : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility = new ReeLogic();
        obj = new iLayer();
        if (!IsPostBack)
        {
            Bind_Category();
            Bind_GridAll();
        }
    }
    private void Bind_Category()
    {
       try
        {
            DataSet ds = obj.GetDownloadCategory();
            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataTextField = "Title";
            ddlCategory.DataValueField = "ID";
            ddlCategory.DataBind();
            ListItem li = new ListItem("--Select Category--", "0");
            ddlCategory.Items.Insert(0, li);
        }
        catch { }
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        #region  Attachment
        string strGUID = Guid.NewGuid().ToString();
        string filename = Addfile.FileName.ToString();
        string[] filearray = new string[2];
        filearray = filename.Split('.');
        string SaveLocation = Server.MapPath("~\\Upload") + "\\" + strGUID + "_" + Addfile.FileName;
        Addfile.PostedFile.SaveAs(SaveLocation);
        string AttachmentName = strGUID + "_" + Addfile.FileName.ToString();
        #endregion

        string mediumImage = UploadImage(1, 300, 200);
        string theSQL = "";
        theSQL += "INSERT INTO Downloads(CatId,Title,ImageUrl,Url,CreatedDate,IsPublic) VALUES(";
        theSQL += "'" + int.Parse(ddlCategory.SelectedValue.ToString().Replace("'", "''")) + "',";
        theSQL += "'" + txtName.Text.Replace("'", "''") + "',";
        theSQL += "'" + mediumImage.Replace("'", "''") + "',";
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

        DataSet ds = obj.GetDownloads();
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
        string Path = Server.MapPath("../Upload/");
        obj.DeleteDownloadsByID(Convert.ToInt32(PhotoID), Path);
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
        return "../Upload/" + varfileUrl.ToString();
    }

    protected string UploadImage(int targetSize, int Width, int Height)
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