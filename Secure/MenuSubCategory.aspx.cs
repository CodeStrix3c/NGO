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

public partial class Secure_MenuSubCategory : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (Request.QueryString["CatID"] == "" || Request.QueryString["CatID"] == null)
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
    protected void imgAdd_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string mediumImage = UploadImage(100, 1260, 400);

            string ImageThumb = UploadImage(100, 600, 400);

            string theSQL = "";
            theSQL += "INSERT INTO MenuSubCategory(CatID,Title,ImageUrl,ImageUrlLarge,CreatedDate,IsPublic) VALUES(";
            theSQL += "'" + Convert.ToInt32(Request.QueryString["CatID"]) + "',";
            theSQL += "'" + txtTitle.Text.Replace("'", "''") + "',";
            theSQL += "'" + mediumImage + "',";
            theSQL += "'" + ImageThumb + "',";
            theSQL += "'" + obj.ReturnDate() + "',";
            theSQL += true;
            theSQL += ")";
            MsgBox.Show(obj.InsertData(theSQL));
            txtTitle.Text = "";
            Bind_Grid();
        }
        catch (Exception exc)
        {

        }
    }
    private void Bind_Grid()
    {
        DataSet ds = obj.GetMenuSubCategoryByCatID(Convert.ToInt32(Request.QueryString["CatID"]));
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
        MsgBox.Show(obj.DeleteMenuSubCategory(Convert.ToInt32(Grid.DataKeys[e.RowIndex].Value)));
        Bind_Grid();
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
 
}