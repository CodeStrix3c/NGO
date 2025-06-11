using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for StudentRegistrationBLL
/// </summary>
public class StudentRegistrationBLL
{
	public StudentRegistrationBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region "Private :: Variables here..."
    private int _Id;
    private string _emailid;
    private int _stdid;
    #endregion

    #region "Public :: Properties here..."

   
    public string emailid
    {
        get { return _emailid; }
        set { _emailid = value; }
    }
 
  
    #endregion

    public int GetStudentRegistration_Exists()
    {
        return StudentRegistration_DLL.GetStudentRegistration_Exists(_emailid);
    }

    public DataSet GetStudentRegistrations()
    {
        return StudentRegistration_DLL.GetStudentRegistrations();
    }

    public DataSet GetStudentRegistrationsbyId(int StudId)
    {
        return StudentRegistration_DLL.GetStudentRegistrationsbyId(StudId);
    }

    public int StudentRegistrations_Delete(int Id)
    {
        return StudentRegistration_DLL.StudentRegistrations_Delete(Id);
    }

}