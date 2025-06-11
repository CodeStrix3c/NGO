using System;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using Microsoft.VisualBasic;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Resources;
using System.IO;

public partial class Secure_popups_SaveImage : System.Web.UI.Page
{
    protected DataAccessLayer DAL;
    protected UtilFunctions UTIL;
    protected void Page_Load(object sender, EventArgs e)
    {
        DAL = new DataAccessLayer();
        UTIL = new UtilFunctions();
        string _path = Request.QueryString["FileName"].ToString();
        int i = 0;
        string[] filename = _path.Split('\\');
        string file = "";
        for (i = filename.Length - 1; i < filename.Length; i++)
        {
             file = filename[i];
        }
        string Extension = UTIL.GetFileExtension(file);
        Extension = Extension.ToUpper();

        string strGUID = Guid.NewGuid().ToString() + Extension;

        string storagePath = Server.MapPath("../Upload/") + strGUID;
        Bitmap oImg;
        try
        {
            oImg = new Bitmap(_path);

            if (Extension.Equals(".JPEG") || Extension.Equals(".JPG"))
            {
                oImg.Save(storagePath, ImageFormat.Jpeg);
            }
            if (Extension.Equals(".GIF"))
            {
                oImg.Save(storagePath, ImageFormat.Gif);
            }
            if (Extension.Equals(".BMP"))
            {
                oImg.Save(storagePath, ImageFormat.Bmp);
            }
            oImg.Dispose();
            Response.Expires = -1;
            Response.Write(storagePath);
        }
        catch (Exception exc)
        {
            Response.Expires = -1;
            Response.Write("Failure");
        }
    }

    #region DataAccessLayer
    public class DataAccessLayer
    {
        protected UtilFunctions Util;
        protected HttpSessionState Session;
        protected HttpServerUtility Server;
        protected HttpRequest Request;
        protected HttpResponse Response;
        protected OleDbConnection myConn;
        protected OleDbDataAdapter myAdap;
        public enum FieldTypes { Text, Number, Date, Memo }
        public DataAccessLayer()
        {
            Session = HttpContext.Current.Session;
            Server = HttpContext.Current.Server;
            Request = HttpContext.Current.Request;
            Response = HttpContext.Current.Response;
            string connectionString = DecryptConnectionString();
            myConn = new OleDbConnection(connectionString);
        }
        private string DecryptConnectionString()
        {
            Byte[] b = Convert.FromBase64String(ReturnConnectionString());
            string decryptedConnectionString = System.Text.ASCIIEncoding.ASCII.GetString(b);
            return decryptedConnectionString;
        }
        public string ReturnConnectionString()
        {
            return ConfigurationManager.AppSettings["ConnectionString"];
        }
        public string ReturnUploadFolder()
        {
            return ConfigurationManager.AppSettings["UploadedPath"];
        }
        public bool FillDropDownList(ListItemCollection Items, string sqlStr, string itemField, string valueField)
        {
            myConn.Open();
            int recNo = 0;
            OleDbCommand command = new OleDbCommand(sqlStr, myConn);
            OleDbDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                recNo = recNo + 1;
                Items.Add(new ListItem(reader[itemField].ToString(), reader[valueField].ToString()));
            }
            reader.Close();
            myConn.Close();
            if (recNo == 0)
                return false;
            else
                return true;
        }
        public DataSet FillDataSet(string theSQL, string tabName)
        {
            myAdap = new OleDbDataAdapter(theSQL, myConn);
            DataSet ds = new DataSet();
            try
            {
                myAdap.Fill(ds, tabName);
            }
            catch (Exception exc)
            {
            }
            return ds;
        }
        public string ReturnField(string theTable, string theField, string theCond)
        {
            string theSQL = "";
            theSQL = "SELECT " + theField + " From " + theTable;
            if (theCond.Trim() != "")
                theSQL += " WHERE " + theCond + ";";
            myAdap = new OleDbDataAdapter(theSQL, myConn);
            DataSet ds = new DataSet();
            myAdap.Fill(ds, "GetField");

            if (ds.Tables["GetField"].Rows.Count > 0)
                return ds.Tables["GetField"].Rows[0][0].ToString();
            else
                return "";
        }
        public DataSet ReturnFields(string theSQL)
        {
            myConn.Open();
            myAdap = new OleDbDataAdapter(theSQL, myConn);
            DataSet ds = new DataSet();
            try
            {
                myAdap.Fill(ds);
                myConn.Close();
            }
            catch (Exception exc)
            {
                myConn.Close();
            }
            return ds;
        }
        public string InsertData(string theSQL)
        {
            myConn.Open();
            OleDbCommand cmd = new OleDbCommand(theSQL, myConn);
            try
            {
                cmd.ExecuteNonQuery();
                cmd = null;
                myConn.Close();
                return "Success"; // Means everything is all right
            }
            catch (Exception exed)
            {
                cmd = null;
                myConn.Close();
                return exed.ToString();//Means error
            }
        }
        public string InsertData2(string theSQL)
        {
            myConn.Open();
            OleDbCommand cmd = new OleDbCommand(theSQL, myConn);
            try
            {
                cmd.ExecuteNonQuery();
                cmd = null;
                return "Success"; // Means everything is all right
            }
            catch (Exception exed)
            {
                cmd = null;
                myConn.Close();
                return "";//Means error
            }
        }
        public string DeleteData(string theSQL)
        {
            myConn.Open();
            OleDbCommand cmd = new OleDbCommand(theSQL, myConn);
            try
            {
                cmd.ExecuteNonQuery();
                cmd = null;
                myConn.Close();
                return "Success"; // Means everything is all right
            }
            catch (Exception exc)
            {
                cmd = null;
                myConn.Close();
                return "Error: " + exc.Message.ToString();//Means error
            }

        }
        public string UpdateData(string theSQL)
        {
            myConn.Open();
            OleDbCommand cmd = new OleDbCommand(theSQL, myConn);
            try
            {
                cmd.ExecuteNonQuery();
                cmd = null;
                myConn.Close();
                return "Success"; // Means everything is all right
            }
            catch (Exception exc)
            {
                cmd = null;
                myConn.Close();
                return "Error: " + exc.Message.ToString();//Means error
            }
        }
        public string GetParam(string ParamName)
        {
            string Param = Request.QueryString[ParamName];
            if (Param == null)
                Param = Request.Form[ParamName];
            if (Param == null)
                return "";
            else
                return Param;
        }
        public bool IsUserLoggedIn(string eMail)
        {
            if (eMail == "a")
            {
                return false;
            }
            else
            {
                return true;
            }

        }//End of Method CHECK IF LOGGED IN OR NOT
        public void CloseConn()
        {
            if (myConn.State == ConnectionState.Open)
                myConn.Close();
        }
    }
    #endregion

    #region UtilFunctions
    public class UtilFunctions
    {
        protected DataAccessLayer DAL;
        public UtilFunctions()
        {
            DAL = new DataAccessLayer();
        }

        public string ReturnDBLocation()
        {
            string DBLocation = ConfigurationManager.AppSettings["ConnectionString"];
            DBLocation = DBLocation.Replace("Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=Pass@word1;Data Source=", "");
            DBLocation = DBLocation.Replace(";Persist Security Info=False", "");
            DBLocation = DBLocation + ";Jet OLEDB:Database Password=Pass@word1";
            return DBLocation;
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
        public string setPageTitle(string Input)
        {
            string theSQL = "SELECT * FROM Personalization";
            string rtString = "";
            DataSet ds = DAL.ReturnFields(theSQL);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    dr = ds.Tables[0].Rows[i];
                    rtString = ":: " + dr["pageTitle"].ToString() + " :: " + Input;
                }
            }
            else
            {
                rtString = ":: Rien's International :: " + Input;
            }
            return rtString;
        }
        public string setProjectName()
        {
            string name = DAL.ReturnField("Personalization", "projectName", "");
            if (name.Equals(""))
            {
                return "Rien's International";
            }
            else
            {
                return name;
            }
        }
        public bool CheckPositiveInteger(string qString)
        {
            bool isNumber = true;
            if (qString.Length < 10 && qString.Length > 0)
            {
                for (int i = 0; i < qString.Length; i++)
                {
                    if (!char.IsNumber(qString, i))
                    {
                        isNumber = false;
                        break;
                    }
                }
            }
            else
                isNumber = false;
            return isNumber;
        }
        public string CheckSearchKeyword(string qString)
        {
            if (qString.Length >= 3)
            {
                return "";
            }
            else
            {
                return "Queries must contain 3 or more characters";

            }
        }
        public string GetFileExtension(string filename)
        {

            if (filename.ToUpper().EndsWith(".JPG"))
                return ".JPG";

            else if (filename.ToUpper().EndsWith(".JPEG"))
                return ".JPEG";

            else if (filename.ToUpper().EndsWith(".GIF"))
                return ".GIF";

            else if (filename.ToUpper().EndsWith(".BMP"))
                return ".BMP";

            else if (filename.ToUpper().EndsWith(".PDF"))
                return ".pdf";

            else if (filename.ToUpper().EndsWith(".DOC"))
                return ".doc";

            else if (filename.ToUpper().EndsWith(".DOCX"))
                return ".docx";

            else if (filename.ToUpper().EndsWith(".TXT"))
                return ".txt";

            else if (filename.ToUpper().EndsWith(".RTF"))
                return ".rtf";
            else
                return "";
        }
        public string Get_Month_Name(int monthId)
        {
            string monthName = "";
            switch (monthId)
            {
                case 1:
                    monthName = "Jan";
                    break;
                case 2:
                    monthName = "Feb";
                    break;
                case 3:
                    monthName = "Mar";
                    break;
                case 4:
                    monthName = "Apr";
                    break;
                case 5:
                    monthName = "May";
                    break;
                case 6:
                    monthName = "June";
                    break;
                case 7:
                    monthName = "July";
                    break;
                case 8:
                    monthName = "Aug";
                    break;
                case 9:
                    monthName = "Sep";
                    break;
                case 10:
                    monthName = "Oct";
                    break;
                case 11:
                    return "Nov";
                    break;
                case 12:
                    monthName = "Dec";
                    break;
            }
            return monthName;
        }
    }
    #endregion

    #region MyMessageBox
    public class MyMessageBox
    {
        public MyMessageBox()
        {
        }
        protected static Hashtable handlerPages = new Hashtable();
        /// <summary>
        /// This displays the message that is of your concern
        /// </summary>
        /// <param name="Message">Message: The string that will be displayed</param>
        public void Show(string Message)
        {
            if (!(handlerPages.Contains(HttpContext.Current.Handler)))
            {
                Page currentPage = (Page)HttpContext.Current.Handler;
                if (!((currentPage == null)))
                {
                    Queue messageQueue = new Queue();
                    messageQueue.Enqueue(Message);
                    handlerPages.Add(HttpContext.Current.Handler, messageQueue);
                    currentPage.Unload += new EventHandler(CurrentPageUnload);
                }
            }
            else
            {
                Queue queue = ((Queue)(handlerPages[HttpContext.Current.Handler]));
                queue.Enqueue(Message);
            }
        }
        private void CurrentPageUnload(object sender, EventArgs e)
        {
            Queue queue = ((Queue)(handlerPages[HttpContext.Current.Handler]));
            if (queue != null)
            {
                StringBuilder builder = new StringBuilder();
                int iMsgCount = queue.Count;
                builder.Append("<script language='javascript'>");
                string sMsg;
                while ((iMsgCount > 0))
                {
                    iMsgCount = iMsgCount - 1;
                    sMsg = System.Convert.ToString(queue.Dequeue());
                    sMsg = sMsg.Replace("\"", "'");
                    builder.Append("alert( \"" + sMsg + "\" );");
                }
                builder.Append("</script>");
                handlerPages.Remove(HttpContext.Current.Handler);
                HttpContext.Current.Response.Write(builder.ToString());
            }
        }
    }
    #endregion
}
