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
public partial class Secure_ShowImage : System.Web.UI.Page
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
            Bitmap oImg;
            string Path = Server.MapPath("../Upload/") + filename;
            oImg = new Bitmap(Path);
            oImg.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            oImg.Dispose();
        }
        else
        {

            Bitmap oImg;
            string Path = Server.MapPath("../Upload/") + filename;

            oImg = new Bitmap(Path);
            oImg.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            oImg.Dispose();
        }
    }
    public class Photo
    {

        private int _id;
        private int _albumid;
        private string _caption;

        public int PhotoID
        {
            get
            {
                return _id;
            }
        }
        public int AlbumID
        {
            get
            {
                return _albumid;
            }
        }
        public string Caption
        {
            get
            {
                return _caption;
            }
        }

        public Photo(int id, int albumid, string caption)
        {
            _id = id;
            _albumid = albumid;
            _caption = caption;
        }

    }
    public class Album
    {

        private int _id;
        private int _count;
        private string _caption;
        private bool _ispublic;

        public int AlbumID { get { return _id; } }
        public int Count { get { return _count; } }
        public string Caption { get { return _caption; } }
        public bool IsPublic { get { return _ispublic; } }

        public Album(int id, int count, string caption, bool ispublic)
        {
            _id = id;
            _count = count;
            _caption = caption;
            _ispublic = ispublic;
        }

    }
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
            //+ " AND Albums.IsPublic=True  ";
            theSQL +=" " + Odbc;

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
            theSQL +=" LEFT JOIN Albums ON Albums.AlbumID = Photos2.AlbumID";
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
            theSQL += " Photos2.AlbumID=" + AlbumID + " AND Albums.IsPublic=True"; ;
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
        public static List<Photo> GetNewPhotos(int PhotoID)
        {
            ReeLogic Utility = new ReeLogic();
            string theSQL = "SELECT Photos2.PhotoID As PhotoID, Photos2.AlbumID As AlbumID,Photos2.Caption As Caption,Photos2.BytesOrginal,Photos2.BytesFull,Photos2.BytesPoster,Photos2.BytesThumb,";
            theSQL += "Photos2.BytesOrginalSize,Photos2.BytesPosterSize,Photos2.BytesThumbSize,Photos2.BytesFullSize";
            theSQL += " FROM Photos2 LEFT JOIN Albums ON Albums.AlbumID=Photos2.AlbumID WHERE";
            theSQL += " Photos2.PhotoID=" + PhotoID + " AND Albums.IsPublic=True";
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
        public static List<Photo> GetPhotos()
        {
            return GetPhotos(GetRandomAlbumID());
        }
        public static void AddPhoto(int AlbumID, string Caption, string originalImage, string largeImage, string mediumImage, string smallImage)
        {
            ReeLogic Utility = new ReeLogic();
            string theSQL = " INSERT INTO Photos2(AlbumID,Caption,BytesOrginal,BytesFull,BytesPoster,BytesThumb,BytesOrginalSize,BytesFullSize,BytesPosterSize,BytesThumbSize) VALUES(";
            theSQL += AlbumID + ",";
            theSQL += "'" + Caption + "',";
            theSQL += "'" + originalImage + "',";
            theSQL += "'" + largeImage + "',";
            theSQL += "'" + mediumImage + "',";
            theSQL += "'" + smallImage + "',";
            theSQL += "'" + originalImage + "',";
            theSQL += "'" + originalImage + "',";
            theSQL += "'" + originalImage + "',";
            theSQL += "'" + originalImage + "'";
            theSQL += ")";
            Utility.InsertData(theSQL);

        }

        public static void RemovePhoto(int PhotoID)
        {
            ReeLogic Utility = new ReeLogic();
            string theSQL = "DELETE FROM Photos2 WHERE PhotoID=" + PhotoID;
            Utility.DeleteData(theSQL);
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
            string theSQL = "SELECT Albums.AlbumID,Albums.Caption,Albums.IsPublic,Count(Photos2.PhotoID) AS NumberOfPhotos";
            theSQL += " FROM Albums LEFT JOIN Photos2 ON Albums.AlbumID=Photos2.AlbumID WHERE ";
            theSQL += " Albums.IsPublic=True OR Albums.IsPublic=True";
            theSQL += " GROUP BY Albums.AlbumID,Albums.Caption,Albums.IsPublic";
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
                               Convert.ToBoolean(dr["IsPublic"]));
                    list.Add(temp);

                }
            }
            return (list);
        }
        public static void AddAlbum(string Caption, bool IsPublic)
        {
            ReeLogic Utility = new ReeLogic();
            string theSQL = "INSERT INTO Albums(Caption,IsPublic) VALUES(";
            theSQL += "'" + Caption + "',";
            theSQL += IsPublic;
            theSQL += ")";

            Utility.InsertData(theSQL);
        }
        public static void RemoveAlbum(int AlbumID)
        {
            ReeLogic Utility = new ReeLogic();
            string theSQL = "DELETE FROM Albums WHERE AlbumID=" + AlbumID;
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
        public static int GetRandomAlbumID()
        {
            ReeLogic Utility = new ReeLogic();
            string theSQL = "Select Albums.AlbumID FROM Albums LEFT JOIN Photos2 ON Albums.AlbumID = Photos2.AlbumID";
            theSQL += " WHERE Albums.IsPublic=True";
            theSQL += " GROUP BY";
            theSQL += " Albums.AlbumID,Albums.Caption,Albums.IsPublic";
            List<Album> list = new List<Album>();
            DataSet ds = Utility.ReturnFields(theSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr;
                int i = 0;
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    dr = ds.Tables[0].Rows[i];
                    Album temp = new Album((int)dr["AlbumID"], 0, "", false);
                    list.Add(temp);
                }
            }
            try
            {
                Random r = new Random();
                return list[r.Next(list.Count)].AlbumID;
            }
            catch
            {
                return -1;
            }
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
    public enum PhotoSize
    {
        Small = 1,		// 100px
        Medium = 2,		// 198px
        Large = 3,		// 600px
        Original = 4	// Original Size
    }
    public class ReeLogic
    {
        public DbDataReader reader;
        public ReeLogic()
        {
        }
        public string ConnectionString()
        {
            return ConfigurationManager.AppSettings["Personal"];
        }
        private Random random = new Random();
        public string GenerateImageText()
        {
            string s = "";
            for (int i = 0; i < 6; i++)
                s = String.Concat(s, this.random.Next(10).ToString());
            return s;
        }
        public string ReturnField(string theTable, string theField, string theCond)
        {
            string theSQL = "";
            theSQL = "SELECT " + theField + " From " + theTable;
            if (theCond.Trim() != "")
                theSQL += " WHERE " + theCond + ";";
            DataSet ds = new DataSet();
            DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
            DbConnection myConnection = myFactory.CreateConnection();
            myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
            try
            {
                //Opening the conection
                myConnection.Open();

                DbCommand myCommand = myConnection.CreateCommand();
                myCommand.CommandText = theSQL;

                //Setting the Connection for myCommand
                myCommand.Connection = myConnection;

                DbDataAdapter myDataAdapter = myFactory.CreateDataAdapter();
                myDataAdapter.SelectCommand = myCommand;

                myDataAdapter.Fill(ds, "GetField");
            }
            catch (Exception exc)
            {

            }
            finally
            {
                //Closing the Connection
                myConnection.Close();
            }
            if (ds.Tables["GetField"].Rows.Count > 0)
                return ds.Tables["GetField"].Rows[0][0].ToString();
            else
                return "";
        }
        public DataSet ReturnFields(string theSQL)
        {

            DataSet ds = new DataSet();
            DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
            DbConnection myConnection = myFactory.CreateConnection();
            myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
            try
            {
                //Opening the conection
                myConnection.Open();

                DbCommand myCommand = myConnection.CreateCommand();
                myCommand.CommandText = theSQL;

                //Setting the Connection for myCommand
                myCommand.Connection = myConnection;

                DbDataAdapter myDataAdapter = myFactory.CreateDataAdapter();
                myDataAdapter.SelectCommand = myCommand;

                myDataAdapter.Fill(ds);
            }
            catch (Exception exc)
            {

            }
            finally
            {
                //Closing the Connection
                myConnection.Close();
            }
            return ds;
        }
        public string InsertData(string theSQL)
        {
            ////theSQL.Replace("\r\n","<br/>");
            //myConn.Open();
            //OdbcCommand cmd = new OdbcCommand(theSQL, myConn);
            //try
            //{
            //    cmd.ExecuteNonQuery();
            //    cmd = null;
            //    myConn.Close();
            //    return "Success"; // Means everything is all right
            //}
            //catch (Exception exed)
            //{
            //    cmd = null;
            //    myConn.Close();
            //    return "";//Means error
            //}

            int chkInsert = 0;
            string result = "Success";
            DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
            DbConnection myConnection = myFactory.CreateConnection();
            myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
            try
            {
                //Opening the conection
                myConnection.Open();

                DbCommand myCommand = myConnection.CreateCommand();
                myCommand.CommandText = theSQL;

                //Setting the Connection for myCommand
                myCommand.Connection = myConnection;

                chkInsert = myCommand.ExecuteNonQuery();
            }
            catch (Exception exc)
            {
                result = "";
            }
            finally
            {
                //Closing the Connection
                myConnection.Close();
            }
            return result;

        }
        public string UpdateData(string theSQL)
        {
            string result = "Success";
            int chkUpdate = 0;
            DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
            DbConnection myConnection = myFactory.CreateConnection();
            myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
            try
            {
                //Opening the conection
                myConnection.Open();

                DbCommand myCommand = myConnection.CreateCommand();
                myCommand.CommandText = theSQL;

                //Setting the Connection for myCommand
                myCommand.Connection = myConnection;
                chkUpdate = myCommand.ExecuteNonQuery();
            }
            catch (Exception exc)
            {
                result = "Error" + exc.Message.ToString();
            }
            finally
            {
                //Closing the Connection
                myConnection.Close();
            }
            return result;
        }
        public string DeleteData(string theSQL)
        {
            string result = "Success";
            int chkDelete = 0;
            DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
            DbConnection myConnection = myFactory.CreateConnection();
            myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
            try
            {
                //Opening the conection
                myConnection.Open();

                DbCommand myCommand = myConnection.CreateCommand();
                myCommand.CommandText = theSQL;

                //Setting the Connection for myCommand
                myCommand.Connection = myConnection;
                chkDelete = myCommand.ExecuteNonQuery();
            }
            catch (Exception exc)
            {
                result = "Error" + exc.Message.ToString();
            }
            finally
            {
                //Closing the Connection
                myConnection.Close();
            }
            return result;

        }
        public string Encrypt(string Input)
        {
            try
            {
                Byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(Input);
                string encryptedInput = Convert.ToBase64String(b);
                return encryptedInput;
            }
            catch (Exception exc)
            {
                return "";
            }
        }
        public string Decrypt(string Input)
        {
            try
            {
                Byte[] b = Convert.FromBase64String(Input);
                string decryptedConnectionString = System.Text.ASCIIEncoding.ASCII.GetString(b);
                return decryptedConnectionString;
            }
            catch (Exception exc)
            {
                return "";
            }
        }
        public string GetPictureExtension(string strPictureName)
        {
            if (strPictureName.ToUpper().EndsWith(".JPG"))
                return ".JPG";

            else if (strPictureName.ToUpper().EndsWith(".JPEG"))
                return ".JPEG";

            else if (strPictureName.ToUpper().EndsWith(".GIF"))
                return ".GIF";

            else if (strPictureName.ToUpper().EndsWith(".BMP"))
                return ".BMP";

            else
                return "";
        }
        public string GetDocExtension(string strPictureName)
        {
            if (strPictureName.ToUpper().EndsWith(".DOC"))
                return ".DOC";
            if (strPictureName.ToUpper().EndsWith(".DOC"))
                return ".DOC";

            else if (strPictureName.ToUpper().EndsWith(".TXT"))
                return ".TXT";

            else if (strPictureName.ToUpper().EndsWith(".PDF"))
                return ".PDF";

            else
                return "";
        }
        public string ReturnUploadFolder()
        {
            //return Convert.ToString(ConfigurationManager.AppSettings["ImagePath"]);
            return "../Upload/";
        }
    }//End of the CLASS

    #region AppConfiguration
    public class AppConfiguration
    {
        public static ConnectionStringSettings ConnectionStringSettings()
        {
            string connectionStringKey = ConfigurationManager.AppSettings.Get("DefaultConnectionString");
            return ConfigurationManager.ConnectionStrings[connectionStringKey];
        }
    }
    #endregion
    #region DalHeper
    public class DalHelpers
    {

        //// <summary>
        //// Formats the name of Command parameters based on the type of data provider used in the application.
        //// </summary>
        //// <param name="paramName">The name of the parameter passed to the Command object.</param>
        //// <returns>Something like @parameterName for SQL Server and ? for a Microsoft Access database.</returns>
        //// <exception cref="NotSupportedException">Thrown when the current provider type is not SqlClient or OleDb.</exception>

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
    }
    #endregion
    public class MsgBox
    {
        private static Hashtable m_executingPages = new Hashtable();
        public MsgBox()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static void Show(string sMessage)
        {
            // If this is the first time a page has called this method then
            if (!m_executingPages.Contains(HttpContext.Current.Handler))
            {
                // Attempt to cast HttpHandler as a Page.
                Page executingPage = HttpContext.Current.Handler as Page;
                if (executingPage != null)
                {
                    // Create a Queue to hold one or more messages.
                    Queue messageQueue = new Queue();
                    // Add our message to the Queue
                    messageQueue.Enqueue(sMessage);
                    // Add our message queue to the hash table. Use our page reference
                    // (IHttpHandler) as the key.
                    m_executingPages.Add(HttpContext.Current.Handler, messageQueue);
                    // Wire up Unload event so that we can inject 
                    // some JavaScript for the alerts.
                    executingPage.Unload += new EventHandler(ExecutingPage_Unload);
                }
            }
            else
            {
                // If were here then the method has allready been 
                // called from the executing Page.
                // We have allready created a message queue and stored a
                // reference to it in our hastable. 
                Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];
                // Add our message to the Queue
                queue.Enqueue(sMessage);
            }
        }

        // Our page has finished rendering so lets output the
        // JavaScript to produce the alert's
        private static void ExecutingPage_Unload(object sender, EventArgs e)
        {
            // Get our message queue from the hashtable
            Queue queue = (Queue)m_executingPages[HttpContext.Current.Handler];
            if (queue != null)
            {
                StringBuilder sb = new StringBuilder();
                // How many messages have been registered?
                int iMsgCount = queue.Count;
                // Use StringBuilder to build up our client slide JavaScript.
                sb.Append("<script language='javascript'>");
                // Loop round registered messages
                string sMsg;
                while (iMsgCount-- > 0)
                {
                    sMsg = (string)queue.Dequeue();
                    sMsg = sMsg.Replace("\n", "\\n");
                    sMsg = sMsg.Replace("\"", "'");
                    sb.Append(@"alert( """ + sMsg + @""" );");
                }
                // Close our JS
                sb.Append(@"</script>");
                // Were done, so remove our page reference from the hashtable
                m_executingPages.Remove(HttpContext.Current.Handler);
                // Write the JavaScript to the end of the response stream.
                HttpContext.Current.Response.Write(sb.ToString());
            }
        }
    }
}