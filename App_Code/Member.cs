using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public class Member
{
    protected ReeLogic Utility;

    public Member()
	{
        Utility = new ReeLogic();
		
	}
    private int _ID;
    private int _RoleID;
    private string _FullName;
    private string _Address;
    private string _ContactNo;
    private string _EmailID;
    private string _Designation;
    private string _UserName;
    private string _Password;
    public int ID
    {
        get
        {
            return _ID;
        }
        set 
        {
            _ID = value;
        }
    }
    public int RoleID
    {
        get
        {
            return _RoleID;
        }
        set
        {
            _RoleID = value;
        }
    }
    public string UserName 
    {
        get 
        {
            return _UserName;
        }
        set 
        {
            _UserName = value;
        }
    }
    public string Password
    {
        get
        {
            return _Password;
        }
        set
        {
            _Password = value;
        }
    }
    public string FullName
    {
        get
        {
            return _FullName;
        }
        set
        {
            _FullName = value;
        }
    }
    public string Address
    {
        get
        {
            return _Address;
        }
        set
        {
            _Address = value;
        }
    }
    public string ContactNo
    {
        get
        {
            return _ContactNo;
        }
        set
        {
            _ContactNo = value;
        }
    }
    public string EmailID
    {
        get
        {
            return _EmailID;
        }
        set
        {
            _EmailID = value;
        }
    }
    public string Designation
    {
        get
        {
            return _Designation;
        }
        set
        {
            _Designation = value;
        }
    }

    public bool IsValidMember()
    {
        string chk = Utility.ReturnField("Users", "ID", "UserName='" + _UserName + "' AND UserPassword='" + _Password + "'");
        if (chk == "")
        {
            return false;
        }
        else 
        {
            ID=Convert.ToInt32(chk);
            RoleID =Convert.ToInt32(Utility.ReturnField("Users", "RoleID", "ID="+ID ));
            return true;
        }
    }

    public bool IsValidUser()
    {
        string chk = Utility.ReturnField("StudentRegistrations", "Id", "emailid='" + _EmailID + "' AND Password='" + _Password + "'");
        if (chk == "")
        {
            return false;
        }
        else
        {
            ID = Convert.ToInt32(chk);
            RoleID = Convert.ToInt32(Utility.ReturnField("StudentRegistrations", "RoleID", "Id=" + ID));
            return true;
        }
    }


    public DataSet GetDetails()
    {
        return Utility.ReturnFields("SELECT * FROM Users WHERE ID=" + _ID);
    }
    public string UpdateProfile()
    {
        string chk=Utility.ReturnField("Users","ID","UserName='"+UserName+"' AND ID<>"+ID);
        if (chk == "")
        {
            return Utility.UpdateData("UPDATE Users SET UserName='" + _UserName + "',UserPassword='" + _Password + "' WHERE ID=" + _ID + " AND IsActive=True");
        }
        else 
        {
            return "";
        }
    
    }
    public string Register()
    {
        string theSQL = "";
        theSQL = Utility.ReturnField("Users", "UserName", "UserName='" + _UserName + "'");
        if (theSQL =="")
        {
            theSQL = "INSERT INTO Users(FullName,Designation,ContactNo,Address,EmailID,RoleID,UserName,UserPassword) VALUES(";
            theSQL += "'" + _FullName + "',";
            theSQL += "'" + _Designation + "',";
            theSQL += "'" + _ContactNo + "',";
            theSQL += "'" + _Address + "',";
            theSQL += "'" + _EmailID + "',";
            theSQL += "'" + _RoleID + "',";
            theSQL += "'" + _UserName + "',";
            theSQL += "'" + _Password + "'";
            theSQL += ")";
            return Utility.InsertData(theSQL);
        
        }
        else 
        {
            return "Username already in use";
        }
    }
}
