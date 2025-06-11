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
        for (int i = 0; i < 9; i++)
            s = String.Concat(s, this.random.Next(10).ToString());
        return s;
    }
    private int RandomNumber(int size)
    {
        string s = "";
        for (int i = 0; i < size; i++)
            s = String.Concat(s, this.random.Next(10).ToString());
        return Convert.ToInt32(s);
    }
    public string RandomString(int size,bool lowerCase)
    {
        char ch;
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch);
        }
        if (lowerCase)
        {
            return builder.ToString().ToLower();
        }
        else 
        {
            return builder.ToString();
        }
    }
    public string GetPassword()
    {
        StringBuilder builder = new StringBuilder();
        builder.Append(RandomString(4, true));
        builder.Append(RandomNumber(4));
        builder.Append(RandomString(2, true));
        return builder.ToString();
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
        else if (strPictureName.ToUpper().EndsWith(".DOCX"))
            return ".DOCX";

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
    public string CompareDates(DateTime Start_Date, DateTime End_Date)
    {
        DateTime dt1 = new DateTime(2006, 01, 24);
        DateTime dt2 = new DateTime(2006, 01, 23);
        string result = "";
        if (DateTime.Compare(Start_Date, End_Date) < 0) 
        { 
            //Console.WriteLine("second date is larger than the first date");
            result = "";
        }
        else if (DateTime.Compare(Start_Date, End_Date) == 0)
        {
            //Console.WriteLine("second date is same as first date"); 
            result = "";
        } 
        else 
        { 
           // Console.WriteLine("second date is smaller than the first date"); 
            result = "End Date Is Smaller than Start Date";
        }
        return result;
    }
    public string CheckHour(string _iHour)
    {
        string result = "";
        switch (_iHour)
        {
            case "1": result = "";
                break;
            case "2": result = "";
                break;
            case "3": result = "";
                break;
            case "4": result = "";
                break;
            case "5": result = "";
                break;
            case "6": result = "";
                break;
            case "7": result = "";
                break;
            case "8": result = "";
                break;
            case "9": result = "";
                break;
            case "10": result = "";
                break;
            case "11": result = "";
                break;
            case "12": result = "";
                break;
            default: result = "Invalid time";
                break;
        }
        return result;
    }
    public string CheckMinute(string _Minute)
    {
        string result = "";
        switch (_Minute)
        {
            case "1": result = "";
                break;
            case "2": result = "";
                    break;
            case "3": result = "";
                break;
            case "4": result = "";
                break;
            case "5": result = "";
                break;
            case "6": result = "";
                break;
            case "7": result = "";
                break;
            case "8": result = "";
                break;
            case "9": result = "";
                break;
            case "10": result = "";
                break;
            case "11": result = "";
                break;
            case "12": result = "";
                break;
            case "13": result = "";
                break;
            case "14": result = "";
                break;
            case "15": result = "";
                break;
            case "16": result = "";
                break;
            case "17": result = "";
                break;
            case "18": result = "";
                break;
            case "19": result = "";
                break;
            case "20": result = "";
                break;
            case "21": result = "";
                break;
            case "22": result = "";
                break;
            case "23": result = "";
                break;
            case "24": result = "";
                break;
            case "25": result = "";
                break;
            case "26": result = "";
                    break;
            case "27": result = "";
                break;
            case "28": result = "";
                break;
            case "29": result = "";
                break;
            case "30": result = "";
                break;
            case "31": result = "";
                break;
            case "32": result = "";
                break;
            case "33": result = "";
                break;
            case "34": result = "";
                break;
            case "35": result = "";
                break;
            case "36": result = "";
                break;
            case "37": result = "";
                break;
            case "38": result = "";
                break;
            case "39": result = "";
                break;
            case "40": result = "";
                break;
            case "41": result = "";
                break;
            case "42": result = "";
                break;
            case "43": result = "";
                break;
            case "44": result = "";
                break;
            case "45": result = "";
                break;
            case "46": result = "";
                break;
            case "47": result = "";
                break;
            case "48": result = "";
                break;
            case "49": result = "";
                break;
            case "50": result = "";
                break;
            case "51": result = "";
                break;
            case "52": result = "";
                break;
            case "53": result = "";
                break;
            case "54": result = "";
                break;
            case "55": result = "";
                break;
            case "56": result = "";
                break;
            case "57": result = "";
                break;
            case "58": result = "";
                break;
            case "59": result = "";
                break;
            default: result = "Invalid time";
                break;
        }
        return result;
    }

    public string InsertRegistration(string theSQL)
    {
        int chkInsert = 0;
        string result = "Thank You ! You have successfully submitted your application, we shall get back to you shortly";
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

    #region Helper Function"
    public string getLimitedWords(string str, int NumberOfWords, int TotalLength)
    {
        string[] Words = str.Split(' ');
        string _return = string.Empty;

        if (Words.Length <= NumberOfWords)
        {
            _return = str;
        }
        else
        {
            for (int i = 0; i < NumberOfWords; i++)
            {
                if (_return.Length < TotalLength)
                {
                    _return += Words.GetValue(i).ToString() + " ";
                }
                else
                {
                    break;
                }
            }
        }
        return _return.ToString();
    }
    public string ReturnDate(DateTime iDate)
    {
        string returnDate;
        switch (AppConfiguration.ConnectionStringSettings().ProviderName.ToLower())
        {
            case "system.data.sqlclient":
                returnDate = iDate.ToShortDateString();
                break;
            case "system.data.oledb":
                returnDate = iDate.ToShortDateString();
                break;
            case "system.data.odbc":
                returnDate = iDate.ToString("yyyy-MM-dd");
                break;
            default:
                throw new NotSupportedException("The provider " + AppConfiguration.ConnectionStringSettings().ProviderName + " not supporter");
        }
        return returnDate;
    }
    public string ReturnMonth(int i_Month)
    {
        string result = "";
        switch (i_Month)
        {
            case 1: result = "January"; break;
            case 2: result = "Febraury"; break;
            case 3: result = "March"; break;
            case 4: result = "April"; break;
            case 5: result = "May"; break;
            case 6: result = "June"; break;
            case 7: result = "July"; break;
            case 8: result = "August"; break;
            case 9: result = "September"; break;
            case 10: result = "October"; break;
            case 11: result = "November"; break;
            case 12: result = "December"; break;
        
        }
        return result;
    }
    #endregion
}//End of the CLASS
