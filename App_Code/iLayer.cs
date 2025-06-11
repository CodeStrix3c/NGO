using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data.Common;
public class iLayer
{
    protected ReeLogic Utility;

    #region "Main Links"
    public DataSet FE_Category_Get()
    {
        return Utility.ReturnFields("SELECT * FROM MenuCategory ORDER BY ID ASC");
    }
    public DataSet FE_DiscussionMain_Get(int varID)
    {
        return Utility.ReturnFields("SELECT * FROM MenuSubCategory WHERE  CatID = " + varID);
    }
    #endregion

    #region "Students Registration"
    public DataSet GetStudentRegistrationById(int Id)
    {
        return Utility.ReturnFields("SELECT * FROM StudentRegistrations Where Id=" + Id);
    }

    #endregion

    #region "Result"
    public DataSet GetResult()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Result";
        return Utility.ReturnFields(theSQL);

    }

    public string DeleteResultByID(int ID)
    {
        return Utility.DeleteData("DELETE FROM Result  WHERE ID=" + ID);
    }

    public string Result_UnPublish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Result SET";
        theSQL += " IsPublished='" + 0 + "'";
        theSQL += " WHERE Id=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public string Result_Publish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Result SET";
        theSQL += " IsPublished='" + 1 + "'";
        theSQL += " WHERE Id=" + varID;

        return Utility.UpdateData(theSQL);
    }

    public DataSet GetResultByRollNo(string titleRollNo)
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Result Where Title=" + titleRollNo;
        return Utility.ReturnFields(theSQL);

    }
    #endregion

    #region "Banner"
    public DataSet GetAllBanners()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Banner ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetTopTenBanners()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Banner ORDER BY ID DESC LIMIT 10";
        return Utility.ReturnFields(theSQL);
    }

    public DataSet GetBannersById(int Id)
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Banner where Id=" + Id;
        return Utility.ReturnFields(theSQL);
    }
    #endregion

    #region "Insert And Update Methods"
    public string InsertData(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public string UpdateData(string theSQL)
    {
        return Utility.UpdateData(theSQL);
    }
    #endregion

    #region "Main Menu Category"
    public DataSet GetMenuCategory()
    {
        return Utility.ReturnFields("SELECT * FROM MenuCategory Order By ID Asc");
    }
    public DataSet GetFourMenuCategory()
    {
        return Utility.ReturnFields("SELECT * FROM MenuCategory Order By ID Asc Limit 4");
    }
    public string DeleteMenuCategory(int ID)
    {
        return Utility.DeleteData("DELETE FROM MenuCategory WHERE ID=" + ID);
    }
    public DataSet GetMenuCategoryByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM MenuCategory WHERE ID=" + ID);
    }
    #endregion

    #region "Sub Category"
    public DataSet GetMenuSubCategoryByCatID(int CatID)
    {
        return Utility.ReturnFields("SELECT * FROM MenuSubCategory  Where CatID=" + CatID + " ORDER BY ID ASC");
    }
    public string DeleteMenuSubCategory(int ID)
    {
        return Utility.DeleteData("DELETE FROM MenuSubCategory WHERE ID=" + ID);
    }
    public DataSet GetMenuSubCategoryByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM MenuSubCategory WHERE ID=" + ID);
    }

    public DataSet GetMenuDetailsByCatSubID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM MenuDetails WHERE SubCatId=" + ID);
    }
   
    public void DeleteMenuDetailsByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM MenuDetails WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM MenuDetails WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }


    public DataSet GetMenuDetailsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM MenuDetails WHERE ID=" + ID);
    }
    #endregion

    #region "Financials"
    public DataSet GetFinancials_BE()
    {
        return Utility.ReturnFields("SELECT * FROM Financials Order By Id Desc");
    }
    public void DeleteFinancialsByID(int PhotoID, string Path, string SPath)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Financials WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            string iSPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ForeignFunds"].ToString();
                    File.Delete(iPath);
                    iSPath = SPath + dr["DomesticFunds"].ToString();
                    File.Delete(iSPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM Financials WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetFinancials_FE()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Financials ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }

    #endregion

    #region "Right Links Category"
    public DataSet GetRightLinksCategory()
    {
        return Utility.ReturnFields("SELECT * FROM RightLinksCategory Order By ID Asc");
    }
    public DataSet GetRightLinksCategoryByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM RightLinksCategory WHERE ID=" + ID);
    }
    public string DeleteRightLinksCategory(int ID)
    {
        return Utility.DeleteData("DELETE FROM RightLinksCategory WHERE ID=" + ID);
    }
    public DataSet GetRightLinksDetailsByCatSubID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM RightLinksDetails WHERE CatId=" + ID);
    }
    public void DeleteRightLinksDetailsByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM RightLinksDetails WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM RightLinksDetails WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }
    public DataSet GetRightLinksDetailsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM RightLinksDetails WHERE ID=" + ID);
    }
  
    #endregion

    #region Photos
    public DataSet GetPhotosByAlbumID(int AlbumID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "SELECT Photos2.PhotoID As PhotoID, Photos2.AlbumID As AlbumID,Photos2.Caption As Caption,Photos2.BytesOrginal,Photos2.BytesFull,Photos2.BytesPoster,Photos2.BytesThumb,";
        theSQL += "Photos2.BytesOrginalSize,Photos2.BytesPosterSize,Photos2.BytesThumbSize,Photos2.BytesFullSize";
        theSQL += " FROM Photos2 LEFT JOIN Albums ON Albums.AlbumID=Photos2.AlbumID WHERE";
        theSQL += " Photos2.AlbumID=" + AlbumID + " AND Albums.IsPublic=True";
        return  Utility.ReturnFields(theSQL);
    }

    public DataSet GetTopTenPhotos()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Photos2  ORDER BY PhotoID DESC Limit 20";
        return Utility.ReturnFields(theSQL);

    }

    public DataSet GetAlbums()
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "SELECT Photos2.BytesThumb,Albums.AlbumID,Albums.Caption,Albums.IsPublic,Count(Photos2.PhotoID) AS NumberOfPhotos";
        theSQL += " FROM Albums LEFT JOIN Photos2 ON Albums.AlbumID=Photos2.AlbumID WHERE ";
        theSQL += " Albums.IsPublic=True OR Albums.IsPublic=True";
        theSQL += " GROUP BY Albums.AlbumID,Albums.Caption,Albums.IsPublic";
        theSQL += " ORDER BY Albums.AlbumID  DESC";
        return Utility.ReturnFields(theSQL);
      
    }
    #endregion

    #region "Home Page"
    public DataSet GetHomeData()
    {
        return Utility.ReturnFields("SELECT * FROM Home Order By Id ASC");
    }
    public DataSet GetHomeData_FE()
    {
        return Utility.ReturnFields("SELECT * FROM Home Order By Id ASC LIMIT 3");
    }
    public void DeleteHomeDetailsByID(int PhotoID)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "DELETE FROM Home WHERE ID=" + PhotoID;
        Utility.DeleteData(theSQL);
    }

    public DataSet GetHomeDeatilsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Home WHERE ID=" + ID);
    }
    #endregion

    #region "About US"
    public DataSet GetAboutUS()
    {
        return Utility.ReturnFields("SELECT * FROM AboutUs WHERE IsActive=True");
    }
    public string InsertAboutUs(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public string UpdateAboutUs(string theSQL)
    {
        return Utility.UpdateData(theSQL);
    }
    #endregion

    #region "Shehjar"
    public DataSet GetAboutShehjar()
    {
        return Utility.ReturnFields("SELECT * FROM AboutShehjar WHERE IsActive=True");
    }

    public DataSet GetShehjarCategory()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM ShehjarCategory ORDER BY ID ASC";
        return Utility.ReturnFields(theSQL);
    }

    public void DeleteShehjarCategoryByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM ShehjarCategory WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM ShehjarCategory WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetShehjarCategoryByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM ShehjarCategory WHERE ID=" + ID);
    }

    #endregion

    #region "Video"
    public DataSet GetAllSubject()
    {
        return Utility.ReturnFields("SELECT ID,Title FROM VideoCategory ORDER BY ID DESC");
    }
    public string InsertVideos(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public DataSet GetVideos()
    {
        return Utility.ReturnFields("SELECT  Videos.ID as ID,Videos.SpeakerID as SpeakerID,Videos.Title as Title,Videos.VideoName as VideoName, " +
        " Videos.Description as Description,Speakers.SName as SName, VideoCategory.Title as Subject" +
        " FROM ((Videos  LEFT JOIN Speakers ON Speakers.ID=Videos.SpeakerID)" +
        " INNER JOIN VideoCategory ON Videos.SubjectID=VideoCategory.ID) ");
    }
    public DataSet GetVideosBySpeakerID(int subjectId)
    {
        return Utility.ReturnFields("SELECT  Videos.ID as ID,Videos.SpeakerID as SpeakerID,Videos.Title as Title,Videos.VideoName as VideoName, " +
        " Videos.Description as Description,Speakers.SName as SName, VideoCategory.Title as Subject" +
        " FROM ((Videos  LEFT JOIN Speakers ON Speakers.ID=Videos.SpeakerID)" +
        " INNER JOIN VideoCategory ON Videos.SubjectID=VideoCategory.ID)" +
        " Where Videos.SubjectID=" + subjectId);
    }
    public DataSet GetVideoByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Videos WHERE ID=" + ID);
    }
    public string DeleteVideo(int ID)
    {
        return Utility.DeleteData("DELETE FROM Videos WHERE ID=" + ID);
    }
    public DataSet GetVideoForPlayByID(int ID)
    {
        return Utility.ReturnFields("SELECT VideoName FROM Videos WHERE ID=" + ID);
    }
    public DataSet GetTopOneVideo()
    {
        return Utility.ReturnFields("SELECT VideoName FROM Videos ORDER BY ID DESC Limit 10");
    }
    #endregion

    #region "Video Subject"
    public string InsertVideoSubject(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public DataSet GetVideoSubject()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM VideoCategory";
        return Utility.ReturnFields(theSQL);

    }
    public string DeleteVideoSubjectByID(int ID)
    {
        return Utility.DeleteData("DELETE FROM VideoCategory  WHERE ID=" + ID);
    }
    public DataSet GetVideoSubjectByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM VideoCategory WHERE ID=" + ID);
    }
    public DataSet GetAllVideoSubjectIds()
    {
        return Utility.ReturnFields("SELECT ID,Title FROM VideoCategory  ORDER BY ID DESC");
    }
    #endregion

    #region Audios
    public string InsertAudios(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public DataSet GetAudios()
    {
            return Utility.ReturnFields("SELECT Audios.ID as ID,Audios.SpeakerID as SpeakerID,Audios.Title as Title,Audios.AudioName as AudioName, " +
            " AudioCategory.Title as Subject, " +
            " Audios.Description as Description,Speakers.SName as SName FROM ((Audios  INNER JOIN Speakers ON Speakers.ID=Audios.SpeakerID) " +
            " INNER JOIN AudioCategory ON Audios.SubjectID=AudioCategory.ID) ");
    }
    public DataSet GetAudiosBySubjectID(int subjectID)
    {
        return Utility.ReturnFields("SELECT Audios.ID as ID,Audios.SpeakerID as SpeakerID,Audios.Title as Title,Audios.AudioName as AudioName, " +
       " AudioCategory.Title as Subject, " +
       " Audios.Description as Description,Speakers.SName as SName " +
       " FROM ((Audios  INNER JOIN Speakers ON Speakers.ID=Audios.SpeakerID) INNER JOIN  AudioCategory ON Audios.SubjectID=AudioCategory.ID)" +
       " Where SubjectID=" + subjectID);
    }
    public DataSet GetAudiosByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Audios WHERE ID=" + ID);
    }
    public string DeleteAudio(int ID)
    {
        return Utility.DeleteData("DELETE FROM Audios WHERE ID=" + ID);
    }
    public DataSet GetAudioForPlayByID(int ID)
    {
        return Utility.ReturnFields("SELECT AudioName FROM Audios WHERE ID=" + ID);
    }

    public DataSet GetTopFourAudio()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Audios ORDER BY ID DESC Limit 4";
        return Utility.ReturnFields(theSQL);

    }

    #endregion

    #region "Audio Subject"
    public string InsertAudioSubject(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public DataSet GetAudioSubject()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM AudioCategory";
        return Utility.ReturnFields(theSQL);

    }

    public string DeleteAudioSubjectByID(int ID)
    {
        return Utility.DeleteData("DELETE FROM AudioCategory  WHERE ID=" + ID);
    }
    public DataSet GetAudioSubjectByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM AudioCategory WHERE ID=" + ID);
    }
    public DataSet GetAllAudioSubjectIds()
    {
        return Utility.ReturnFields("SELECT ID,Title FROM AudioCategory  ORDER BY ID DESC");
    }
    #endregion

    #region "Registration for jobs"
    //public DataSet GetRegistration()
    //{
    //    string theSQL = "";
    //    theSQL = "SELECT * FROM Registration ORDER BY ID DESC";
    //    return Utility.ReturnFields(theSQL);
    //}

    public DataSet GetNewRegistration()
    {
        return Utility.ReturnFields("SELECT Registration.PreferenceDistOne ,Registration.PreferenceDistTwo ,Registration.PreferenceDistThree , Jobs.Title as PostName,Registration.Id as ID,Registration.IsActive,Registration.Name as Name,Registration.PostalCode,Registration.CreatedDate as CreatedDate," +
        " Registration.MobileNo as MobileNo, " +
        " Registration.Email as Email,Registration.FileUrl as FileUrl, Registration.SigUrl FROM (Registration  INNER JOIN Jobs ON Jobs.ID=Registration.PostId) Where IsActive=1 ORDER BY Registration.Id DESC ");
    }
    public string NewRegis_UnPublish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Registration SET";
        theSQL += " IsActive='" + 0 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public DataSet GetNewRegistrationByID(int Id)
    {
        return Utility.ReturnFields("SELECT Registration.PreferenceDistOne ,Registration.PreferenceDistTwo ,Registration.PreferenceDistThree , Jobs.Title as PostName,Registration.Id as ID,Registration.Name as Name,Registration.PostalCode,Registration.CreatedDate as CreatedDate," +
        " Registration.MobileNo as MobileNo, Registration.Gender,Registration.MaritalStatus,Registration.DOB,Registration.Parentage,Registration.AlternateNo, " +
        " Registration.Address,Registration.District,Registration.State,Registration.PinCode," +
        " Registration.PAddress,Registration.PDistrict,Registration.PState,Registration.PPinCode," +

        " Registration.ExamPassed,Registration.Subject,Registration.PassingYear," +
        " Registration.MaxMarks,Registration.MarksObtained,Registration.Percentage,Registration.UniversityBoard,"+

        " Registration.ExamPassedOne,Registration.SubjectOne,Registration.PassingYearOne," +
        " Registration.MaxMarksOne,Registration.MarksObtainedOne,Registration.PercentageOne,Registration.UniversityBoardOne," +

        " Registration.ExamPassedTwo,Registration.SubjectTwo,Registration.PassingYearTwo," +
        " Registration.MaxMarksTwo,Registration.MarksObtainedTwo,Registration.PercentageTwo,Registration.UniversityBoardTwo," +

        " Registration.ExamPassedThree,Registration.SubjectThree,Registration.PassingYearThree," +
        " Registration.MaxMarksThree,Registration.MarksObtainedThree,Registration.PercentageThree,Registration.UniversityBoardThree," +

        " Registration.ExamPassedFour,Registration.SubjectFour,Registration.PassingYearFour," +
        " Registration.MaxMarksFour,Registration.MarksObtainedFour,Registration.PercentageFour,Registration.UniversityBoardFour," +

        " Registration.Position,Registration.PFrom,Registration.PTo,Registration.GSalary,Registration.Responsibilities,Registration.Reasons,Registration.Experience," +

        " Registration.PositionOne,Registration.PFromOne,Registration.PToOne,Registration.GSalaryOne,Registration.ResponsibilitiesOne,Registration.ReasonsOne,Registration.ExperienceOne," +

        " Registration.PositionTwo,Registration.PFromTwo,Registration.PToTwo,Registration.GSalaryTwo,Registration.ResponsibilitiesTwo,Registration.ReasonsTwo,Registration.ExperienceTwo," +

        " Registration.LicenseNo,Registration.LicenseValidity,Registration.LicensePeriodTo," +
        " Registration.LicenseClass,Registration.LicenseAuthority," +
        " Registration.Email as Email,Registration.FileUrl as FileUrl, Registration.SigUrl FROM (Registration  INNER JOIN Jobs ON Jobs.ID=Registration.PostId) Where Registration.ID=" + Id);
    }
    public DataSet GetRegistration()
    {
        return Utility.ReturnFields("SELECT Jobs.Title as PostName,Registration.Id as ID,Registration.Name as Name,Registration.PostalCode,Registration.CreatedDate as CreatedDate," +
        " Registration.MobileNo as MobileNo, " +
        " Registration.ExamPassed, Registration.MaxMarks, Registration.MarksObtained as MarksObtained, " +
        " Registration.ExamPassedOne, Registration.MaxMarksOne,Registration.MarksObtainedOne, " +
        " Registration.ExamPassedTwo, Registration.MaxMarksTwo,Registration.MarksObtainedTwo, " +
        " Registration.ExamPassedThree, Registration.MaxMarksThree,Registration.MarksObtainedThree," +
        " Registration.ExamPassedFour, Registration.MaxMarksFour,Registration.MarksObtainedFour," +
        " Registration.Position, Registration.PositionOne,Registration.PositionTwo, " +
        " Registration.Experience, Registration.ExperienceOne,Registration.ExperienceTwo, " +
        " Registration.Email as Email,Registration.FileUrl as FileUrl FROM (Registration  INNER JOIN Jobs ON Jobs.ID=Registration.PostId) Where IsActive=0 ORDER BY Registration.Id DESC ");
       
    }


    public DataSet GetNewRegistrationForPDF_FE()
    {
        return Utility.ReturnFields("SELECT Registration.PreferenceDistOne ,Registration.PreferenceDistTwo ,Registration.PreferenceDistThree , Jobs.Title as PostName,Registration.Id as ID,Registration.Name as Name,Registration.PostalCode,Registration.CreatedDate as CreatedDate," +
        " Registration.MobileNo as MobileNo, Registration.Gender,Registration.MaritalStatus,Registration.DOB,Registration.Parentage,Registration.AlternateNo, " +
        " Registration.Address,Registration.District,Registration.State,Registration.PinCode," +
        " Registration.PAddress,Registration.PDistrict,Registration.PState,Registration.PPinCode," +

        " Registration.ExamPassed,Registration.Subject,Registration.PassingYear," +
        " Registration.MaxMarks,Registration.MarksObtained,Registration.Percentage,Registration.UniversityBoard," +

        " Registration.ExamPassedOne,Registration.SubjectOne,Registration.PassingYearOne," +
        " Registration.MaxMarksOne,Registration.MarksObtainedOne,Registration.PercentageOne,Registration.UniversityBoardOne," +

        " Registration.ExamPassedTwo,Registration.SubjectTwo,Registration.PassingYearTwo," +
        " Registration.MaxMarksTwo,Registration.MarksObtainedTwo,Registration.PercentageTwo,Registration.UniversityBoardTwo," +

        " Registration.ExamPassedThree,Registration.SubjectThree,Registration.PassingYearThree," +
        " Registration.MaxMarksThree,Registration.MarksObtainedThree,Registration.PercentageThree,Registration.UniversityBoardThree," +

        " Registration.ExamPassedFour,Registration.SubjectFour,Registration.PassingYearFour," +
        " Registration.MaxMarksFour,Registration.MarksObtainedFour,Registration.PercentageFour,Registration.UniversityBoardFour," +

        " Registration.Position,Registration.PFrom,Registration.PTo,Registration.GSalary,Registration.Responsibilities,Registration.Reasons,Registration.Experience," +

        " Registration.PositionOne,Registration.PFromOne,Registration.PToOne,Registration.GSalaryOne,Registration.ResponsibilitiesOne,Registration.ReasonsOne,Registration.ExperienceOne," +

        " Registration.PositionTwo,Registration.PFromTwo,Registration.PToTwo,Registration.GSalaryTwo,Registration.ResponsibilitiesTwo,Registration.ReasonsTwo,Registration.ExperienceTwo," +

        " Registration.LicenseNo,Registration.LicenseValidity,Registration.LicensePeriodTo," +
        " Registration.LicenseClass,Registration.LicenseAuthority," +
        " Registration.Email as Email,Registration.FileUrl as FileUrl, Registration.SigUrl FROM Registration  INNER JOIN Jobs ON Jobs.ID=Registration.PostId");
    }


    public DataSet GetRegistrationByPostID(int PostId)
    {
        return Utility.ReturnFields("SELECT Jobs.Title as PostName,Registration.Id as ID,Registration.Name as Name,Registration.PostalCode,Registration.CreatedDate as CreatedDate," +
        " Registration.MobileNo as MobileNo, " +
        " Registration.Email as Email,Registration.FileUrl as FileUrl FROM (Registration  INNER JOIN Jobs ON Jobs.ID=Registration.PostId) Where Registration.IsActive=0 AND Registration.PostId=" + PostId + " ORDER BY Registration.Id DESC");
    }
    public DataSet GetRegistrationByPostID(string PostalCode)
    {
        return Utility.ReturnFields("SELECT Jobs.Title as PostName,Registration.Id as ID,Registration.Name as Name,Registration.PostalCode,Registration.CreatedDate as CreatedDate," +
        " Registration.MobileNo as MobileNo, " +
        " Registration.Email as Email,Registration.FileUrl as FileUrl FROM (Registration  INNER JOIN Jobs ON Jobs.ID=Registration.PostId) Where PostalCode=" + PostalCode + " ORDER BY Registration.Id DESC");

    }
    public DataSet GetRegistrationByPostIDAndPostCode(int PostId, string PostalCode)
    {
        return Utility.ReturnFields("SELECT Jobs.Title as PostName,Registration.Id as ID,Registration.Name as Name,Registration.PostalCode,Registration.CreatedDate as CreatedDate," +
        " Registration.MobileNo as MobileNo, " +
        " Registration.Email as Email,Registration.FileUrl as FileUrl FROM (Registration  INNER JOIN Jobs ON Jobs.ID=Registration.PostId) Where PostId=" + PostId + " AND PostalCode=" + PostalCode + " ORDER BY Registration.Id DESC");

    }

    public void DeleteRegistrationByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Registration WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["FileUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM Registration WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }
    #endregion

    #region "News Letters"
    public DataSet GetMonthIssue()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM MonthIssue ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetTOP100MonthIssue_FE()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM MonthIssue ORDER BY ID DESC LIMIT 100";
        return Utility.ReturnFields(theSQL);
    }
    public void DeleteMonthIssueByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM MonthIssue WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["Url"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM MonthIssue WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }
    #endregion

    #region "Downloads"
    public DataSet GetDownloadCategory()
    {
        return Utility.ReturnFields("SELECT * FROM DownloadCategory Order By ID Asc");
    }
    public string DeleteDownloadCategory(int ID)
    {
        return Utility.DeleteData("DELETE FROM DownloadCategory WHERE ID=" + ID);
    }
    public DataSet GetDownloadCategoryByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM DownloadCategory WHERE ID=" + ID);
    }
    public DataSet GetDownloads()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Downloads ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetDownloads_FEPage()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Downloads ORDER BY ID DESC LIMIT 12";
        return Utility.ReturnFields(theSQL);
    }
    public void DeleteDownloadsByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Downloads WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["Url"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM Downloads WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetDownloads_FE()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Downloads ORDER BY ID DESC LIMIT 5";
        return Utility.ReturnFields(theSQL);
    }

    public DataSet GetDownloadsByCatId_FE(int CatId)
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Downloads Where CatId=" + CatId + " ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    #endregion

    #region "Blog"
    public DataSet GetBlog()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Blog ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);

    }
    public string DeleteBlog(int ID)
    {
        return Utility.DeleteData("DELETE FROM Blog WHERE ID=" + ID);
    }
    public DataSet GetBlogByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Blog WHERE ID=" + ID);
    }
    #endregion

    #region "Terms And Conditions"
    public DataSet GetTerms()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Terms ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);

    }
    public string DeleteTerms(int ID)
    {
        return Utility.DeleteData("DELETE FROM Terms WHERE ID=" + ID);
    }
    public DataSet GetTermsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Terms WHERE ID=" + ID);
    }
    #endregion


    #region "Blog Comments"
    public DataSet GetBlogCommentsByBlogId(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM BlogComments WHERE BlogId=" + ID + " ORDER BY ID DESC");
    }
    public string DeleteBlogComments(int ID)
    {
        return Utility.DeleteData("DELETE FROM BlogComments WHERE ID=" + ID);
    }
    #endregion

    #region "Feed Back" 
    public DataSet GetFeedback()
    {
        return Utility.ReturnFields("SELECT * FROM  Feedback ORDER BY ID DESC");
    }
    public string DeleteFeedback(int ID)
    {
        return Utility.DeleteData("DELETE FROM Feedback WHERE ID=" + ID);
    }
    #endregion

    #region "Donation Contact Deatils"
    public DataSet GetDonationDeatils()
    {
        return Utility.ReturnFields("SELECT * FROM  Donation ORDER BY ID DESC");
    }
    public string DeleteDonationDeatils(int ID)
    {
        return Utility.DeleteData("DELETE FROM Donation WHERE ID=" + ID);
    }
    #endregion

    #region "Online Registration Deatils"

    public string InsertRegistration(string theSQL)
    {
        return Utility.InsertRegistration(theSQL);
    }

    public int Registration_Exists(string email)
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
            myCommand.CommandText = "SELECT Id FROM OnlineRegistration WHERE jform_Email = '" + email + "'";

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
    public DataSet GetOnlineRegistration()
    {
        return Utility.ReturnFields("SELECT * FROM  OnlineRegistration ORDER BY ID DESC");
    }

    public DataSet GetOnlineRegistrationById(int Id)
    {
        return Utility.ReturnFields("SELECT * FROM  OnlineRegistration Where Id=" + Id);
    }
    public string DeleteOnlineRegistration(int ID)
    {
        return Utility.DeleteData("DELETE FROM OnlineRegistration WHERE ID=" + ID);
    }
    #endregion

    #region "User Contact Deatils"
    public DataSet GetContactDeatils()
    {
        return Utility.ReturnFields("SELECT * FROM  ContactDeatils ORDER BY ID DESC");
    }
    public string DeleteContactDeatils(int ID)
    {
        return Utility.DeleteData("DELETE FROM ContactDeatils WHERE ID=" + ID);
    }
    #endregion

    #region "Sponsor Child"
    public DataSet GetSponsorChild()
    {
        return Utility.ReturnFields("SELECT * FROM  SponsorChild ORDER BY ID DESC");
    }
    public string DeleteSponsorChild(int ID)
    {
        return Utility.DeleteData("DELETE FROM SponsorChild WHERE ID=" + ID);
    }
    #endregion

    #region "Information"
    public DataSet GetInformation()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Information Where TypeId=1 ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetInformationByTypeId(int TypeId)
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Information Where TypeId=" + TypeId + " ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public string DeleteInformationByID(int ID)
    {
        return Utility.DeleteData("DELETE FROM Information WHERE ID=" + ID);
    }
    public string Information_UnPublish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Information SET";
        theSQL += " IsPublished='" + 0 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public string Information_Publish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Information SET";
        theSQL += " IsPublished='" + 1 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public DataSet GetInformationByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Information WHERE ID=" + ID);
    }
    public DataSet GetInformationPublished()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Information Where TypeId=1 AND IsPublished=" + 1 + " ORDER BY ID DESC LIMIT 1";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetInformationPublishedforPage2()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Information Where TypeId=2 AND IsPublished=" + 1 + " ORDER BY ID DESC LIMIT 1";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetInformationPublishedforPage3()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Information Where TypeId=3 AND IsPublished=" + 1 + " ORDER BY ID DESC LIMIT 1";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetInformationPublishedforPage4()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Information Where TypeId=4 AND IsPublished=" + 1 + " ORDER BY ID DESC LIMIT 1";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetInformationPublishedforPage5()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Information Where TypeId=5 AND IsPublished=" + 1 + " ORDER BY ID DESC LIMIT 1";
        return Utility.ReturnFields(theSQL);
    }
    #endregion

    #region "Ticker"
    public DataSet GetTicker()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Ticker ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public string DeleteTickerByID(int ID)
    {
        return Utility.DeleteData("DELETE FROM Ticker WHERE ID=" + ID);
    }

    public string Ticker_UnPublish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Ticker SET";
        theSQL += " IsPublished='" + 0 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public string Ticker_Publish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Ticker SET";
        theSQL += " IsPublished='" + 1 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }

    public DataSet GetTickerByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Ticker WHERE ID=" + ID);
    }

    public DataSet GetTopTenTicker()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Ticker Where IsPublished=" + 1 + " ORDER BY ID DESC Limit 10";
        return Utility.ReturnFields(theSQL);
    }
    #endregion

    #region "Postal Codes"
    public DataSet GetPostalCode()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM PostalCode ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public string DeletePostalCodeByID(int ID)
    {
        return Utility.DeleteData("DELETE FROM PostalCode WHERE ID=" + ID);
    }
    public string PostalCode_UnPublish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE PostalCode SET";
        theSQL += " IsPublished='" + 0 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public string PostalCode_Publish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE PostalCode SET";
        theSQL += " IsPublished='" + 1 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public DataSet GetPostalCodeByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM PostalCode WHERE ID=" + ID);
    }
    public DataSet GetLatestPostalCode()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM PostalCode Where IsPublished=" + 1 + " ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    #endregion

    #region "JOBS"
    public DataSet GetJobs()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Jobs ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public string DeleteJobsByID(int ID)
    {
        return Utility.DeleteData("DELETE FROM Jobs WHERE ID=" + ID);
    }
    public string Jobs_UnPublish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Jobs SET";
        theSQL += " IsPublished='" + 0 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public string Jobs_Publish(int varID)
    {
        string theSQL = "";
        theSQL = " UPDATE Jobs SET";
        theSQL += " IsPublished='" + 1 + "'";
        theSQL += " WHERE ID=" + varID;

        return Utility.UpdateData(theSQL);
    }
    public DataSet GetJobsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Jobs WHERE ID=" + ID);
    }
    public DataSet GetLatestJobs()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Jobs Where IsPublished=" + 1 + " ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }

    public DataSet GetLatestJobs_BE()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Jobs ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }

    private int _ID;
    private int _postID;
    private string _PostCode;
    private string _mobileNo;
    private string _EmailID;
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

    public int PostId
    {
        get
        {
            return _postID;
        }
        set
        {
            _postID = value;
        }
    }
    public string PostCode
    {
        get
        {
            return _PostCode;
        }
        set
        {
            _PostCode = value;
        }
    }

    public string mobileNo
    {
        get
        {
            return _mobileNo;
        }
        set
        {
            _mobileNo = value;
        }
    }
    public string EmailId
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
  
    public bool IsValidMember()
    {
        string chk = Utility.ReturnField("Registration", "MobileNo", "MobileNo='" + _mobileNo + "' AND Email='" + _EmailID + "' AND PostId="+_postID+" ");
        string chkemail = Utility.ReturnField("Registration", "Email", "MobileNo='" + _mobileNo + "' AND Email='" + _EmailID + "' AND PostId=" + _postID + "");
        if (chk == _mobileNo && chkemail == _EmailID)
        {
            return false;
        }
        else
        {
           // ID = Convert.ToInt32(chk);
            //PostCode = Utility.ReturnField("Registration", "PostalCode", "ID=" + ID);
            return true;
        }
    }

    #endregion

    #region "Careers"
    public DataSet GetCareers()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Careers ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public void DeleteCareersByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Careers WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM Careers WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetCareersByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Careers WHERE ID=" + ID);
    }
    #endregion

    #region "Partners"
    public DataSet GetPartners()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Partners ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }

    public void DeletePartnersByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Partners WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM Partners WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetPartnersByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Partners WHERE ID=" + ID);
    }

    public DataSet Gettop5Partners()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Partners ORDER BY ID DESC LIMIT 5";
        return Utility.ReturnFields(theSQL);
    }
    #endregion

    #region "Board Memebrs"
    public DataSet GetBoardMembers()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM BoardMembers ORDER BY ID ASC";
        return Utility.ReturnFields(theSQL);
    }

    public void DeleteBoardMembersByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM BoardMembers WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM BoardMembers WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetBoardMembersByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM BoardMembers WHERE ID=" + ID);
    }

    #endregion

    #region "Annual Report"
    public DataSet GetAnnualReport()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM AnnualReport ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public void DeleteAnnualReportByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM AnnualReport WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["Url"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM AnnualReport WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetAnnualReportTop50()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM AnnualReport ORDER BY ID DESC LIMIT 50";
        return Utility.ReturnFields(theSQL);
    }
    #endregion

    #region "Core Competencies"
    public DataSet GetCoreCompetencies()
    {
        return Utility.ReturnFields("SELECT * FROM CoreCompetencies Order By ID Asc");
    }

    public DataSet GetCoreCompetenciesByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM CoreCompetencies WHERE ID=" + ID);
    }
    public string DeleteCoreCompetencies(int ID)
    {
        return Utility.DeleteData("DELETE FROM CoreCompetencies WHERE ID=" + ID);
    }
    public DataSet GetCompetenciesDetailsByCatID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM CompetenciesDetails WHERE CatId=" + ID);
    }
    public void DeleteCompetenciesDetailsByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM CompetenciesDetails WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM CompetenciesDetails WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetCompetenciesDetailsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM CompetenciesDetails WHERE ID=" + ID);
    }

    #endregion

    #region "Speakers"
    public string InsertSpeakers(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public DataSet GetSpeakers()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Speakers WHERE IsActive=True ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);

    }
    public DataSet GetAllSpeakers()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Speakers WHERE IsActive=True ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);

    }
    public DataSet GetSpeakersByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Speakers WHERE ID=" + ID);
    }
    #endregion

    #region "News"
    public string InsertNews(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public DataSet GetNews()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM News ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);

    }
    public DataSet GetTopTenNews()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM News ORDER BY ID DESC Limit 3";
        return Utility.ReturnFields(theSQL);

    }
    public void DeleteNewsByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM News WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);
                   
                }
                catch { }
            }
            theSQL = "DELETE FROM News WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }
   
    public DataSet GetNewsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM News WHERE ID=" + ID);
    }
    public string UpdateNews(string theSQL)
    {
        return Utility.UpdateData(theSQL);
    }

    public DataSet GetNewsTop50()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM News ORDER BY ID DESC LIMIT 50";
        return Utility.ReturnFields(theSQL);

    }
    #endregion

    #region "Ongoing Projects"
    public DataSet GetProjects()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Projects ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);
    }

    public void DeleteProjectsByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Projects WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM Projects WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }

    public DataSet GetProjectsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Projects WHERE ID=" + ID);
    }
    public DataSet GetTopSixProjects()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Projects ORDER BY ID DESC LIMIT 20";
        return Utility.ReturnFields(theSQL);
    }

    #endregion

    #region "Events"
    public string InsertEvents(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public DataSet GetEvents()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Events ORDER BY ID DESC";
        return Utility.ReturnFields(theSQL);

    }
    public DataSet GetTopTenEvents()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Events ORDER BY ID DESC Limit 1";
        return Utility.ReturnFields(theSQL);

    }

    public void DeleteEventByID(int PhotoID, string Path)
    {
        ReeLogic Utility = new ReeLogic();
        string theSQL = "";
        theSQL = "SELECT * FROM Events WHERE ID=" + PhotoID;
        DataSet ds = Utility.ReturnFields(theSQL);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;
            int i = 0;
            string iPath = "";
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                try
                {
                    iPath = Path + dr["ImageUrl"].ToString();
                    File.Delete(iPath);

                }
                catch { }
            }
            theSQL = "DELETE FROM Events WHERE ID=" + PhotoID;
            Utility.DeleteData(theSQL);
        }
    }
    //public string DeleteEventByID(int ID)
    //{
    //    return Utility.DeleteData("DELETE FROM Events  WHERE ID=" + ID);
    //}
    public DataSet GetEventByID(int ID)
    {
        return Utility.ReturnFields("SELECT * FROM Events WHERE ID=" + ID);
    }
    public string UpdateEvent(string theSQL)
    {
        return Utility.UpdateData(theSQL);
    }
    public DataSet GetEventByEventDate(string EventDate)
    {
        return Utility.ReturnFields("SELECT * FROM Events WHERE EventDate=" + "'" + EventDate + "'");
    }

    public DataSet GetTop50Events()
    {
        string theSQL = "";
        theSQL = "SELECT * FROM Events ORDER BY ID DESC Limit 50";
        return Utility.ReturnFields(theSQL);

    }
    #endregion

    #region "Contact"
    public DataSet GetContactUs()
    {
        return Utility.ReturnFields("SELECT * From Contacts  WHERE IsActive=True ORDER BY ID ASC");
    }
    public string InsertContact(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    public DataSet GetContactUsByID(int ID)
    {
        return Utility.ReturnFields("SELECT * From Contacts WHERE ID=" + ID);
    }
    public string EditContact(string theSQL)
    {
        return Utility.UpdateData(theSQL);
    }
    public string DeleteContact(int ID)
    {
        return Utility.DeleteData("DELETE From Contacts WHERE ID=" + ID);
    }

    public DataSet GetContactUsTopOne()
    {
        return Utility.ReturnFields("SELECT * From Contacts  WHERE IsActive=True ORDER BY ID ASC LIMIT 1");
    }
    #endregion

    #region "Constructor"
    public iLayer()
	{
        Utility = new ReeLogic();

    }
    #endregion

    #region "Group"
    public DataTable GetGroup2()
    {
        DataSet ds = Utility.ReturnFields("SELECT * FROM Groups ORDER BY Code ASC");
        DataTable dtOne = new DataTable();
        dtOne.Columns.Add("ID");
        dtOne.Columns.Add("Code");
        DataRow drow, dr;
        drow = dtOne.NewRow();
        drow["ID"] = "-1";
        drow["Code"] = "--Select One--";
        dtOne.Rows.Add(drow);
        int i = 0;
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];
                drow = dtOne.NewRow();
                drow["ID"] = dr["ID"].ToString();
                drow["Code"] = dr["Code"].ToString();
                dtOne.Rows.Add(drow);
            }

        }
        return dtOne;
    }
    public DataSet GetGroup()
    {
        return Utility.ReturnFields("SELECT * FROM Groups ORDER BY Code ASC");
    }
    public string InsertGroup(string Title, string Description, string Code)
    {
        string result = "";
        result = Utility.ReturnField("Groups", "ID","Code='" + Code + "'");
        if (result == "")
        {
            result = Utility.InsertData("INSERT INTO Groups(Title,Description,Code,CreatedDate,ModifiedDate) VALUES('" + Title + "','" +Description +"','"+Code +"','"+ReturnDate() +"','"+ReturnDate()+"')");
        }
        else
        {
            result = "Group Already Present";
        }
        return result;
    }
    public string UpdateGroup(int ID, string Title,string Description,string Code)
    {
        string result = "";
        result = Utility.ReturnField("Groups", "ID","Code='"+Code +"' AND ID<>" + ID);
        if (result == "")
        {
            return Utility.UpdateData("UPDATE Groups SET Title='" + Title + "',Description='"+Description +"',Code='"+Code +"',ModifiedDate='"+ReturnDate()+"' WHERE ID=" + ID);
        }
        else
        {
            return "Group Already Present";
        }
    }
    public string DeleteGroup(int ID)
    {
        string result = "";
        result = Utility.ReturnField("GroupStatus", "ID", "Group_ID=" + ID);
        if (result == "")
        {
            return Utility.DeleteData("DELETE FROM Groups WHERE ID=" + ID);
        }
        else
        {
            return "Group Cannot be deleted because its alloted";

        }
    }
    public DataSet GetGroupStatus(int User_ID)
    {
        string theSQL = "";
        theSQL = "SELECT GroupStatus.*,Groups.Code";
        theSQL += " FROM GroupStatus ";
        theSQL += " LEFT JOIN Groups ON Groups.ID=GroupStatus.Group_ID";
        theSQL += " WHERE GroupStatus.User_ID="+User_ID;
        theSQL += " ORDER BY GroupStatus.ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetGroupStatus()
    {
        string theSQL = "";
        theSQL = "SELECT GroupStatus.*,Groups.Code";
        theSQL += " FROM GroupStatus ";
        theSQL += " LEFT JOIN Groups ON Groups.ID=GroupStatus.Group_ID";
        theSQL += " WHERE GroupStatus.IsActive=True";
        theSQL += " ORDER BY GroupStatus.ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public string  DeleteGroupStatus(int ID)
    {
        string theSQL = "DELETE FROM GroupStatus WHERE ID="+ ID;
        return Utility.DeleteData(theSQL);
    }
    public DataSet GetGroupStatusByID(int ID)
    {
        string theSQL = "";
        theSQL = "SELECT GroupStatus.*,Groups.Code";
        theSQL += " FROM GroupStatus ";
        theSQL += " INNER JOIN Groups ON Groups.ID=GroupStatus.Group_ID";
        theSQL += " WHERE GroupStatus.IsActive=True";
        theSQL += " AND GroupStatus.ID=" + ID;
        theSQL += " ORDER BY GroupStatus.ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetGroupStatusByCode(string Code)
    {
        string theSQL = "";
        theSQL = "SELECT GroupStatus.*,Groups.Code";
        theSQL += " FROM GroupStatus ";
        theSQL += " INNER JOIN Groups ON Groups.ID=GroupStatus.Group_ID";
        theSQL += " WHERE GroupStatus.IsActive=True";
        theSQL += " AND Groups.Code = '" + Code +"'";
        theSQL += " ORDER BY GroupStatus.ID DESC";
        return Utility.ReturnFields(theSQL);
    }
    public DataSet GetGroupStatusByGroup(int ID)
    {
        string theSQL = "";
        theSQL = "SELECT GroupStatus.*,Groups.Code";
        theSQL += " FROM GroupStatus ";
        theSQL += " INNER JOIN Groups ON Groups.ID=GroupStatus.Group_ID";
        theSQL += " WHERE GroupStatus.IsActive=True";
        theSQL += " AND GroupStatus.Group_ID=" + ID;
        theSQL += " ORDER BY GroupStatus.ID ASC";
        return Utility.ReturnFields(theSQL);
    
    }
     #endregion
   
    #region "Enquiry"
    public DataSet GetEnquiry()
    {
        return Utility.ReturnFields("SELECT * FROM Enquiry WHERE isActive=True ORDER BY ID DESC");
    }
    public string DeleteEnquiry(int ID)
    {
        return Utility.DeleteData("DELETE FROM Enquiry WHERE ID=" + ID);
    }
    public string InsertEnquiry(string theSQL)
    {
        return Utility.InsertData(theSQL);
    }
    #endregion
  
    #region "Users"
    public DataSet GetNewUsers()
    {
        return Utility.ReturnFields("SELECT * FROM Users WHERE RoleID<>9 AND IsBlock=True AND IsActive=False");
    }
    public DataSet GetActiveUsers()
    {
        return Utility.ReturnFields("SELECT * FROM Users WHERE RoleID<>9 AND IsBlock=False AND IsActive=True");
    }
    public DataSet GetInActiveUsers()
    {
        return Utility.ReturnFields("SELECT * FROM Users WHERE RoleID<>9 AND IsBlock=False AND IsActive=False");
    }
    #endregion

    #region "Manage Group"
    public string InsertUserGroup(int Group_ID, int User_ID)
    {
        string theSQL = "";
        theSQL = Utility.ReturnField("Group_Manage", "ID", "Group_ID=" + Group_ID + " AND User_ID=" + User_ID);
        if (theSQL == "")
        {
            theSQL = "INSERT INTO Group_Manage(Group_ID,User_ID,iDate) VALUES(";
            theSQL += Group_ID + ",";
            theSQL += User_ID + ",";
            theSQL += "'" + ReturnDate() + "'";
            theSQL += ")";
            return Utility.InsertData(theSQL);
        }
        else 
        {
            return "Group Already Assigned To Same User";
        }

    }
    public string DeleteUserGroup(int ID)
    {
        string theSQL = "";
        theSQL = "UPDATE Group_Manage SET IsActive=False WHERE ID=" + ID;
        return Utility.UpdateData(theSQL);
    }
    public DataSet GetUserGroup()
    {
        string theSQL = "";
        theSQL  = " SELECT Users.FullName,Groups.Code,Group_Manage.*";
        theSQL += " FROM (Group_Manage INNER JOIN Users ON Group_Manage.User_ID = Users.ID) INNER JOIN Groups ON Group_Manage.Group_ID = Groups.ID";
        theSQL += " WHERE Group_Manage.IsActive=True";
        return Utility.ReturnFields(theSQL);

    }
    public DataSet GetMyGroup(int User_ID)
    {
        string theSQL = "";
        theSQL = " SELECT Groups.*";
        theSQL += " FROM Group_Manage INNER JOIN Groups ON Group_Manage.Group_ID = Groups.ID";
        theSQL += " WHERE Group_Manage.User_ID="+User_ID;
        return Utility.ReturnFields(theSQL);
    }

    #endregion

    #region Helper Function"
    public string GetDocExtension(string strPictureName)
    {
        if (strPictureName.ToUpper().EndsWith(".DOC"))
            return ".DOC";
        else if (strPictureName.ToUpper().EndsWith(".DOCX"))
            return ".DOCX";
        else if (strPictureName.ToUpper().EndsWith(".PDF"))
            return ".PDF";
        else if (strPictureName.ToUpper().EndsWith(".PPT"))
            return ".PPT";
        else if (strPictureName.ToUpper().EndsWith(".PPTX"))
            return ".PPTX";
        else if (strPictureName.ToUpper().EndsWith(".XLS"))
            return ".XLS";
        else if (strPictureName.ToUpper().EndsWith(".XLSX"))
            return ".XLSX";
        else
            return "";
    }
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
    public string ReturnDate()
    {
        string returnDate;
        switch (AppConfiguration.ConnectionStringSettings().ProviderName.ToLower())
        {
            case "mysql.data.mysqlclient":
                returnDate = DateTime.Now.ToString("yyyy-MM-dd");
                break;
            case "system.data.oledb":
                returnDate = DateTime.Now.ToString("yyyy-MM-dd");
                break;
            case "system.data.odbc":
                returnDate = DateTime.Now.ToString("yyyy-MM-dd");
                break;
            default:
                throw new NotSupportedException("The provider " + AppConfiguration.ConnectionStringSettings().ProviderName + " not supporter");
        }
        return returnDate;
    }
    #endregion

}
