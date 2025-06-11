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
using System.Web.UI.Adapters;
using System.Configuration;
using System.Net.Mail;
using System.ComponentModel.Design;
using System.Text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Data.Common;
using System.Data.Odbc;


public class PhotoManage
{
    public PhotoManage()
    {
    }
    public static string GetPhoto(PhotoSize size)
    {
        string path = "";
        switch (size)
        {
            case PhotoSize.Small:
                path += "placeholder-100.jpg";
                break;
            case PhotoSize.Medium:
                path += "placeholder-200.jpg";
                break;
            case PhotoSize.Large:
                path += "placeholder-600.jpg";
                break;
            default:
                path += "placeholder-600.jpg";
                break;
        }
        return path;
    }
    

    public static string GetPhoto(int photoid, PhotoSize size)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        string tableField = "";
        DbProviderFactory myFac = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
        string my = myFac.ToString();
        string Odbc = "";
        string Oledb = "";
        if (my == "System.Data.Odbc.OdbcFactory")
        {
            Odbc = "Limit 1";
        }
        else
        {
            Oledb = "Top 1";
        }
        theSQL = "SELECT " + Oledb;

        if (size.ToString() == "Small")
        {
            theSQL += " BytesThumb FROM Photos2";
            tableField = "BytesThumb";
        }
        else if (size.ToString() == "Medium")
        {
            theSQL += " BytesPoster FROM Photos2 ";
            tableField = "BytesPoster";
        }
        else if (size.ToString().Equals("Large"))
        {
            theSQL += " BytesFull FROM Photos2";
            tableField = "BytesFull";
        }
        else
        {
            theSQL += " BytesOrginal FROM Photos2 ";
            tableField = "BytesOrginal";
        }
        theSQL += " LEFT JOIN Albums ON Albums.AlbumID = Photos2.AlbumID ";
        theSQL += " WHERE Photos2.PhotoID =" + photoid;
        theSQL += " ORDER BY Photos2.PhotoID DESC";
        //+ " AND Albums.IsPublic=True  ";
        theSQL += " " + Odbc;

        DataSet ds = Utility.ReturnFields(theSQL);


        DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
        DbConnection myConnection = myFactory.CreateConnection();
        myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
        object dbRead;
        try
        {
            //Opening the conection
            myConnection.Open();
            DbCommand myCommand = myConnection.CreateCommand();
            myCommand.CommandText = theSQL;

            //Setting the Connection for myCommand
            myCommand.Connection = myConnection;

            dbRead = myCommand.ExecuteScalar();
            return dbRead.ToString();
        }
        catch (Exception exc)
        {
            return null;
        }
        finally
        {
            //Closing the Connection
            myConnection.Close();
        }

    }
    public static string GetFirstPhoto(int albumid, PhotoSize size)
    {
        string theSQL = "";
        string tableField = "";
        DbProviderFactory myFac = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
        string my = myFac.ToString();
        string Odbc = "";
        string Oledb = "";
        if (my == "System.Data.Odbc.OdbcFactory")
        {
            Odbc = "Limit 1";
        }
        else
        {
            Oledb = "Top 1 ";
        }
        theSQL = "SELECT " + Oledb;
        if (size.ToString() == "Small")
        {
            theSQL += "  BytesThumb FROM Photos2 ";
            tableField = "BytesThumb";
        }
        else if (size.ToString() == "Medium")
        {
            theSQL += "  BytesPoster FROM Photos2";
            tableField = "BytesPoster";
        }
        else if (size.ToString().Equals("Large"))
        {
            theSQL += "  BytesFull FROM Photos2 ";
            tableField = "BytesFull";
        }
        else
        {
            theSQL += " BytesOrginal FROM Photos2";
            tableField = "BytesOrginal";
        }
        theSQL += " LEFT JOIN Albums ON Albums.AlbumID = Photos2.AlbumID";
        theSQL += " WHERE Albums.AlbumID=" + albumid;
        theSQL += " " + Odbc;
        DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
        DbConnection myConnection = myFactory.CreateConnection();
        myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
        object dbRead;
        try
        {
            //Opening the conection
            myConnection.Open();
            DbCommand myCommand = myConnection.CreateCommand();
            myCommand.CommandText = theSQL;

            //Setting the Connection for myCommand
            myCommand.Connection = myConnection;
            dbRead = myCommand.ExecuteScalar();
            return dbRead.ToString();
        }
        catch (Exception exc)
        {
            return null;
        }
        finally
        {
            //Closing the Connection
            myConnection.Close();

        }


    }
    public static List<Photo> GetPhotos(int AlbumID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "SELECT Photos2.PhotoID As PhotoID, Photos2.AlbumID As AlbumID,Photos2.Caption As Caption,Photos2.BytesOrginal,Photos2.BytesFull,Photos2.BytesPoster,Photos2.BytesThumb,";
        theSQL += "Photos2.BytesOrginalSize,Photos2.BytesPosterSize,Photos2.BytesThumbSize,Photos2.BytesFullSize";
        theSQL += " FROM Photos2 LEFT JOIN Albums ON Albums.AlbumID=Photos2.AlbumID WHERE";
        theSQL += " Photos2.AlbumID=" + AlbumID + " AND Albums.IsPublic=True";
        List<Photo> list = new List<Photo>();
        DataSet ds = Utility.ReturnFields(theSQL);
        int i = 0;
        DataRow dr;
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                Photo temp = new Photo(
                     Convert.ToInt32(dr["PhotoID"]),
                                 Convert.ToInt32(dr["AlbumID"]),
                                 Convert.ToString(dr["Caption"]));
                list.Add(temp);
            }
        }
        return (list);
       
    }
    public static List<Photo> GetAlbumPhotos(int AlbumID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "SELECT *";
        theSQL += " FROM Photos2 WHERE";
        theSQL += " Photos2.AlbumID=" + AlbumID;
        theSQL += "ORDER BY Photos2.AlbumID DESC";

        List<Photo> list = new List<Photo>();
        DataSet ds = Utility.ReturnFields(theSQL);
        int i = 0;
        DataRow dr;
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                Photo temp = new Photo(
                     Convert.ToInt32(dr["PhotoID"]),
                                 Convert.ToInt32(dr["AlbumID"]),
                                 Convert.ToString(dr["Caption"]));
                list.Add(temp);
            }
        }
        return (list);



    }


    public static void AddBanner(string Caption, string intro,string description, string originalImage)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = " INSERT INTO Banner(Title,Intro,Description,ImageUrl) VALUES(";
        theSQL += "'" + Caption + "',";
        theSQL += "'" + intro + "',";
        theSQL += "'" + description + "',";
        theSQL += "'" + originalImage + "'";
        theSQL += ")";
        Utility.InsertData(theSQL);
    }
    public static void RemoveBanner(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Banner WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                try
                {
                    dr = ds.Tables[0].Rows[i];
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM Banner WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }


    }
    public static void EditBanner(string Caption, int PhotoID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "UPDATE Banner SET";
        theSQL += " Title='" + Caption + "'";
        theSQL += " WHERE ID=" + PhotoID;
        Utility.UpdateData(theSQL);
    }

    public static DataSet GetPhotos2(int AlbumID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "SELECT Photos2.PhotoID As PhotoID, Photos2.AlbumID As AlbumID,Photos2.Caption As Caption,Photos2.BytesOrginal,Photos2.BytesFull,Photos2.BytesPoster,Photos2.BytesThumb,";
        theSQL += "Photos2.BytesOrginalSize,Photos2.BytesPosterSize,Photos2.BytesThumbSize,Photos2.BytesFullSize";
        theSQL += " FROM Photos2 LEFT JOIN Albums ON Albums.AlbumID=Photos2.AlbumID WHERE";
        theSQL += " Photos2.AlbumID=" + AlbumID + " AND Albums.IsPublic=True";

        DataSet ds = Utility.ReturnFields(theSQL);
        return (ds);



    }
    public static List<Photo> GetNewPhotos(int PhotoID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "SELECT Photos2.PhotoID As PhotoID, Photos2.AlbumID As AlbumID,Photos2.Caption As Caption,Photos2.BytesOrginal,Photos2.BytesFull,Photos2.BytesPoster,Photos2.BytesThumb,";
        theSQL += "Photos2.BytesOrginalSize,Photos2.BytesPosterSize,Photos2.BytesThumbSize,Photos2.BytesFullSize";
        theSQL += " FROM Photos2 LEFT JOIN Albums ON Albums.AlbumID=Photos2.AlbumID WHERE";
        theSQL += " Photos2.PhotoID=" + PhotoID + " AND Albums.IsPublic=True";
        theSQL += " ORDER BY Photos2.PhotoID DESC";
        List<Photo> list = new List<Photo>();
        DataSet ds = Utility.ReturnFields(theSQL);
        int i = 0;
        DataRow dr;
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                Photo temp = new Photo(
                    Convert.ToInt32(dr["PhotoID"]),
                                 Convert.ToInt32(dr["AlbumID"]),
                                dr["Caption"].ToString());
                list.Add(temp);
            }
        }
        return (list);
    }

  

    public static List<AlbumPhotos> GetPhotosByAlbumID(int AlbumID)
    {
        ReeLogic Utility = new ReeLogic();
        List<AlbumPhotos> listPhoto = new List<AlbumPhotos>();
        string theSQL = "SELECT PhotoID,AlbumID,Caption,BytesPoster,BytesThumb from Photos2 Where AlbumID=" + AlbumID;
        DataSet ds = Utility.ReturnFields(theSQL);
        DataRow dr;
        if (ds.Tables[0].Rows.Count > 0)
        {
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                AlbumPhotos tempPhoto = new AlbumPhotos(
                            Convert.ToInt32(dr["AlbumID"]),
                            Convert.ToInt32(dr["PhotoID"]),
                            Convert.ToString(dr["Caption"]),
                            Convert.ToString(dr["BytesPoster"]),
                            Convert.ToString(dr["BytesThumb"]));
                listPhoto.Add(tempPhoto);

            }
        }
        return (listPhoto);
    }

    //public static List<Photo> GetPhotos()
    //{
    //    return GetPhotos(GetRandomAlbumID());
    //}

    public static void DeleteSpeakers(int ID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Speakers where ID=" + ID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];


                iPath = Path + dr["Photo"].ToString();
                try
                {
                    File.Delete(iPath);
                }
                catch { }
              
            }
            theSQL = "DELETE FROM Speakers WHERE ID=" + ID;
            Utility.DeleteData(theSQL);
        }
    }


    public static void DeleteMembers(int ID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Members where ID=" + ID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];


                iPath = Path + dr["Photo"].ToString();
                try
                {
                    File.Delete(iPath);
                }
                catch { }

            }
            theSQL = "DELETE FROM Members WHERE ID=" + ID;
            Utility.DeleteData(theSQL);
        }
    }



    public static void AddPhoto(int AlbumID, string Caption, string originalImage, string smallImage)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = " INSERT INTO Photos2(AlbumID,Caption,BytesPoster,BytesThumb) VALUES(";
        theSQL += AlbumID + ",";
        theSQL += "'" + Caption + "',";
        theSQL += "'" + originalImage + "',";
        theSQL += "'" + smallImage + "'";
        theSQL += ")";
        Utility.InsertData(theSQL);

    }
   
    
    public static void RemovePhoto(int PhotoID,string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";// "DELETE FROM Photos2 WHERE PhotoID=" + PhotoID;
        theSQL = "SELECT * FROM Photos2 WHERE PhotoID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                try
                {
                    dr = ds.Tables[0].Rows[i];
                    iPath = Path + dr["BytesOrginal"].ToString();
                    File.Delete(iPath);
                    iPath = Path + dr["BytesFull"].ToString();
                    File.Delete(iPath);
                    iPath = Path + dr["BytesPoster"].ToString();
                    File.Delete(iPath);
                    iPath = Path + dr["BytesThumb"].ToString();
                    File.Delete(iPath);
                }
                catch { }
            }
            theSQL = "DELETE FROM Photos2 WHERE PhotoID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }


    }
    public static void EditPhoto(string Caption, int PhotoID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "UPDATE Photos2 SET";
        theSQL += " Caption='" + Caption + "'";
        theSQL += " WHERE PhotoID=" + PhotoID;
        Utility.UpdateData(theSQL);
    }
    public static List<Album> GetAlbums()
    {
        ReeLogic Utility = new ReeLogic();
        List<Album> list = new List<Album>();
        string theSQL = "SELECT Photos2.BytesThumb,Albums.AlbumID,Albums.Caption,Albums.IsPublic,Count(Photos2.PhotoID) AS NumberOfPhotos";
        theSQL += " FROM Albums LEFT JOIN Photos2 ON Albums.AlbumID=Photos2.AlbumID WHERE ";
        theSQL += " Albums.IsPublic=True OR Albums.IsPublic=True";
        theSQL += " GROUP BY Albums.AlbumID,Albums.Caption,Albums.IsPublic";
        theSQL += " ORDER BY Albums.AlbumID  DESC";
        DataSet ds = Utility.ReturnFields(theSQL);
        DataRow dr;
        if (ds.Tables[0].Rows.Count > 0)
        {
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                Album temp = new Album(
                            Convert.ToInt32(dr["AlbumID"]),
                            Convert.ToInt32(dr["NumberOfPhotos"]),
                          Convert.ToString(dr["Caption"]),
                            Convert.ToString(dr["BytesThumb"]),
                           Convert.ToBoolean(dr["IsPublic"]));
                list.Add(temp);

            }
        }
        return (list);
    }
    public static List<Album> GetAlbumsWithCategory()
    {
        ReeLogic Utility = new ReeLogic();
        List<Album> list = new List<Album>();
        string theSQL = "";
        theSQL = " SELECT Photos2.BytesThumb,Albums.AlbumID,Albums.Caption,Albums.IsPublic,Count(Photos2.PhotoID) AS NumberOfPhotos";
        theSQL += " FROM (Albums LEFT JOIN Photos2 ON (Albums.AlbumID = Photos2.AlbumID) AND (Albums.AlbumID = Photos2.AlbumID))";
        theSQL += " WHERE  Albums.IsPublic=True OR Albums.IsPublic=True GROUP BY Albums.AlbumID,Albums.Caption,Albums.IsPublic ORDER BY Albums.AlbumID DESC";
        DataSet ds = Utility.ReturnFields(theSQL);
        DataRow dr;
        if (ds.Tables[0].Rows.Count > 0)
        {
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                Album temp = new Album(
                            Convert.ToInt32(dr["AlbumID"]),
                            Convert.ToInt32(dr["NumberOfPhotos"]),
                          Convert.ToString(dr["Caption"]),
                           Convert.ToString(dr["BytesThumb"]),
                           Convert.ToBoolean(dr["IsPublic"]));
                list.Add(temp);

            }
        }
        return (list);
    }
    //public static List<Album> GetAlbums(int Category_ID)
    //{
    //    ReeLogic Utility = new ReeLogic();
    //    List<Album> list = new List<Album>();
    //    string theSQL = "SELECT Albums.AlbumID,Albums.Caption,Albums.IsPublic,Count(Photos2.PhotoID) AS NumberOfPhotos";
    //    theSQL += " FROM Albums LEFT JOIN Photos2 ON Albums.AlbumID=Photos2.AlbumID WHERE ";
    //    theSQL += " Albums.IsPublic=True And Albums.Category_ID=" + Category_ID;
    //    theSQL += " GROUP BY Albums.AlbumID,Albums.Caption,Albums.IsPublic";
    //    theSQL += " ORDER BY Albums.AlbumID  DESC";
    //    DataSet ds = Utility.ReturnFields(theSQL);
    //    DataRow dr;
    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        int i = 0;
    //        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
    //        {
    //            dr = ds.Tables[0].Rows[i];
    //            Album temp = new Album(
    //                        Convert.ToInt32(dr["AlbumID"]),
    //                        Convert.ToInt32(dr["NumberOfPhotos"]),
    //                      Convert.ToString(dr["Caption"]),
    //                       Convert.ToBoolean(dr["IsPublic"]));
    //            list.Add(temp);

    //        }
    //    }
    //    return (list);
    //}
    //public static DataSet GetAlbums2()
    //{
    //    ReeLogic Utility = new ReeLogic();
    //    string theSQL = "SELECT Albums.AlbumID,Albums.Caption,Albums.IsPublic,Count(Photos2.PhotoID) AS NumberOfPhotos";
    //    theSQL += " FROM Albums LEFT JOIN Photos2 ON Albums.AlbumID=Photos2.AlbumID WHERE ";
    //    theSQL += " Albums.IsPublic=True OR Albums.IsPublic=True";
    //    theSQL += " GROUP BY Albums.AlbumID,Albums.Caption,Albums.IsPublic ORDER BY Albums.AlbumID DESC";
    //    DataSet ds = Utility.ReturnFields(theSQL);

    //    return (ds);
    //}
    public static void AddAlbum(string Caption, bool IsPublic)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "INSERT INTO Albums(Caption,IsPublic) VALUES(";
        theSQL += "'" + Caption + "',";
        theSQL += IsPublic;
        theSQL += ")";
        Utility.InsertData(theSQL);
    }
    public static void RemoveAlbum(int AlbumID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";// "DELETE FROM Albums WHERE AlbumID=" + AlbumID;
        theSQL = "SELECT * FROM Photos2 WHERE AlbumID=" + AlbumID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                iPath = Path + dr["BytesOrginal"].ToString();
                File.Delete(iPath);
                iPath = Path + dr["BytesFull"].ToString();
                File.Delete(iPath);
                iPath = Path + dr["BytesPoster"].ToString();
                File.Delete(iPath);
                iPath = Path + dr["BytesThumb"].ToString();
                File.Delete(iPath);
            }
            theSQL = "DELETE FROM Photos2 WHERE AlbumID=" + AlbumID;
            Utility.DeleteData(theSQL);
        }
        theSQL = "DELETE FROM Albums WHERE AlbumID=" + AlbumID;
        Utility.DeleteData(theSQL);
    }
    public static void EditAlbum(string Caption, bool IsPublic, int AlbumID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "UPDATE Albums SET";
        theSQL += "Caption='" + Caption + "',";
        theSQL += "IsPublic='" + IsPublic + "'";
        theSQL += " WHERE AlbumID=" + AlbumID;
        Utility.UpdateData(theSQL);
    }

    private static byte[] ResizeImageFile(byte[] imageFile, int targetSize)
    {
        using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(new MemoryStream(imageFile)))
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
                    MemoryStream m = new MemoryStream();
                    newImage.Save(m, ImageFormat.Jpeg);
                    return m.GetBuffer();
                }
            }
        }
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
    public static ICollection ListUploadDirectory()
    {
        DirectoryInfo d = new DirectoryInfo(System.Web.HttpContext.Current.Server.MapPath("../Upload"));
        return d.GetFileSystemInfos("*.jpg");
    }
    public static void GetStaff(int StaffID)
    {

    }
}
