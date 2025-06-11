using System;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for StudentRegistration_DLL
/// </summary>
public class StudentRegistration_DLL
{
	public StudentRegistration_DLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int GetStudentRegistration_Exists(string emailId)
    {
        int chkInsert = 0;
        DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
        DbConnection myConnection = myFactory.CreateConnection();
        myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
        try
        {
            //Opening the conection
            myConnection.Open();

            DbCommand myCommand = myConnection.CreateCommand();
            myCommand.CommandText = "SELECT id FROM StudentRegistrations WHERE emailid = '" + emailId + "'";

            //Setting the Connection for myCommand
            myCommand.Connection = myConnection;

            chkInsert = Convert.ToInt32(myCommand.ExecuteScalar());
        }
        catch (Exception exc)
        {

        }
        finally
        {
            //Closing the Connection
            myConnection.Close();
        }
        return chkInsert;
    }

    public static DataSet GetStudentRegistrations()
    {
        DataSet myDataSet = new DataSet();

        DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
        DbConnection myConnection = myFactory.CreateConnection();
        myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
        try
        {
            //Opening the conection
            myConnection.Open();

            DbCommand myCommand = myConnection.CreateCommand();
            myCommand.CommandText = "SELECT StudentPayment.Id, StudentPayment.studId, StudentPayment.dorderid,StudentPayment.dccavenuerefno,StudentPayment.dtrackingid,StudentPayment.dbankrefno,StudentPayment.dpaymode,StudentPayment.dcardname,StudentPayment.dorderdate, StudentPayment.damount, StudentRegistrations.firstName, StudentRegistrations.middleName, StudentRegistrations.lastname  FROM StudentPayment INNER JOIN StudentRegistrations ON StudentRegistrations.Id = StudentPayment.studId ORDER BY StudentPayment.Id Desc";
            //Setting the Connection for myCommand
            myCommand.Connection = myConnection;

            DbDataAdapter myDataAdapter = myFactory.CreateDataAdapter();
            myDataAdapter.SelectCommand = myCommand;

            myDataAdapter.Fill(myDataSet);
        }
        catch (Exception exc)
        {

        }
        finally
        {
            //Closing the Connection
            myConnection.Close();
        }
        return myDataSet;
    }

    public static DataSet GetStudentRegistrationsbyId(int stId)
    {
        DataSet myDataSet = new DataSet();

        DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
        DbConnection myConnection = myFactory.CreateConnection();
        myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
        try
        {
            //Opening the conection
            myConnection.Open();

            DbCommand myCommand = myConnection.CreateCommand();
            myCommand.CommandText = "SELECT *  FROM StudentRegistrations Where Id=" + stId;
            //Setting the Connection for myCommand
            myCommand.Connection = myConnection;

            DbDataAdapter myDataAdapter = myFactory.CreateDataAdapter();
            myDataAdapter.SelectCommand = myCommand;

            myDataAdapter.Fill(myDataSet);
        }
        catch (Exception exc)
        {

        }
        finally
        {
            //Closing the Connection
            myConnection.Close();
        }
        return myDataSet;
    }

    public static int StudentRegistrations_Delete(int Id)
    {
        int chkDelete = 0;

        DbProviderFactory myFactory = DbProviderFactories.GetFactory(AppConfiguration.ConnectionStringSettings().ProviderName);
        DbConnection myConnection = myFactory.CreateConnection();
        myConnection.ConnectionString = AppConfiguration.ConnectionStringSettings().ConnectionString;
        try
        {
            //Opening the conection
            myConnection.Open();


            //Sub Category
            DbCommand myCommand2 = myConnection.CreateCommand();
            myCommand2.Connection = myConnection;
            myCommand2.CommandText = "DELETE FROM StudentPayment WHERE Id=" + Id;
            chkDelete = myCommand2.ExecuteNonQuery();


        }
        catch (Exception exc)
        {
            chkDelete = 0;
        }
        finally
        {
            //Closing the Connection
            myConnection.Close();
        }
        return chkDelete;
    }
}