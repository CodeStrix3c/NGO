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


public partial class regis : System.Web.UI.Page
{

    protected iLayer obj;
    protected ReeLogic Utility;
    protected StudentRegistrationBLL oCategoryManger;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        oCategoryManger = new StudentRegistrationBLL();

    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string fname = Request.Form["fname"];
        string mname = Request.Form["mname"];
        string lname = Request.Form["lname"];
        string email = Request.Form["email"];

        string password = Request.Form["fname"]+DateTime.Now.Year;

        string contactno = Request.Form["contactNo"];
        string alternateNo = Request.Form["alternateNo"];
        string occupation = Request.Form["occupation"];
        string aboutBtw = Request.Form["bwt"];
        string houseAdd = Request.Form["shouse"];
        string streetAdd = Request.Form["street"];
        string tehsilAdd = Request.Form["stehsil"];
        string city = Request.Form["sCity"];
        string district = Request.Form["sDistrict"];
        string pincode = Request.Form["sPinCode"];
        string landMark = Request.Form["sLandMark"];
        string chouseAdd = Request.Form["Cshouse"];
        string cstreetAdd = Request.Form["Cstreet"];
        string ctehsilAdd = Request.Form["Ctehsil"];
        string ccity = Request.Form["CCity"];
        string cdistrict = Request.Form["CDistrict"];
        string cpincode = Request.Form["CPinCode"];
        string clandMark = Request.Form["CLandMark"];


        string oqualification = string.Empty; 
        if (ddloqualification.SelectedValue != "0")
        {
            oqualification = ddloqualification.SelectedItem.ToString();
        }

        string oCourse = string.Empty; 
        if (ddloCourse.SelectedValue != "0")
        {
            oCourse = ddloCourse.SelectedItem.ToString();
        }

        string oYear = txtoYear.Text;

        string oSkillTraning = Request.Form["oSkill"];
        string oCerificateCourse = Request.Form["oCertificate"];
        string oVolunteerism = Request.Form["oVolunteerism"];
        string oOrganizationOne = Request.Form["oOrganization1"];
        string oOrganizationTwo = Request.Form["oOrganization2"];
        string oOrganizationThree = Request.Form["oOrganization3"];
        string oPositionOne = Request.Form["oPosition1"];
        string oPositionTwo = Request.Form["oPosition2"];
        string oPositionThree = Request.Form["oPosition3"];
        string oPeriodFromOne = Request.Form["oPeriodFrom1"];
        string oPeriodFromTwo = Request.Form["oPeriodFrom2"];
        string oPeriodFromThree = Request.Form["oPeriodFrom3"];
        string oPeriodToOne = Request.Form["oPeriodTo1"];
        string oPeriodToTwo = Request.Form["oPeriodTo2"];
        string oPeriodToThree = Request.Form["oPeriodTo3"];
        string oGraduateScore = Request.Form["OGraduationScore"];
        string oPostGraduateScore = Request.Form["OPostGraduationScore"];
        string oDegreeScore = Request.Form["OotherDegreeScore"];
        string oSkillAcquired = Request.Form["OSkillacquired"];
        string oTechSkill = Request.Form["oTechSkills"];
        string oSocialMediaActivism = Request.Form["oSocialMediaActivism"];
        string osatisfiedEarnings = Request.Form["Osatisfied"];
        string oManageExpenses = Request.Form["OmanageExpenses"];
        string oExcessEarnings = Request.Form["OExcessearnings"];
        string oAge = Request.Form["OAge"];
        string oMarried = Request.Form["Omarried"];
        string oOnlyEarningHand = Request.Form["OOnlyEarnings"];
        string oFamilyOne = Request.Form["oFamilyOne"];
        string oFamilyTwo = Request.Form["oFamilyTwo"];
        string oFamilyThree = Request.Form["oFamilyThree"];
        string oFamilyFour = Request.Form["oFamilyFour"];
        string oFamilyFive = Request.Form["oFamilyFive"];
        string oFamilySix = Request.Form["oFamilySix"];
        string oHealthIssue = Request.Form["OhealthIssue"];
        string oWorkshop = Request.Form["oworkshop"];
        string payFee = string.Empty;
        payFee = Request.Form["OtherFee"];

        string cipherTextPassword = RijndaelSimple.Encrypt(Request.Form["password"]);

        string otherImg = UploadOtherImage(100, 200, 200);

        #region  Attachment Other CV
        string strAadharGUID = Guid.NewGuid().ToString();
        string fileAadharname = uploadOtherCV.FileName.ToString();
        string[] fileAadhararray = new string[2];
        fileAadhararray = fileAadharname.Split('.');
        string SaveAadharLocation = Server.MapPath("Upload") + "\\" + strAadharGUID + "_" + uploadOtherCV.FileName;
        uploadOtherCV.PostedFile.SaveAs(SaveAadharLocation);
        string otherscv = strAadharGUID + "_" + uploadOtherCV.FileName.ToString();
        #endregion

        string theSQL = "";
        theSQL += "INSERT INTO StudentRegistrations(firstName, middleName, lastname, emailid, Password, contactNo, AlternateNo, occupation, btw, jform_house_villa, jform_street_Village, "
        + " jform_tehsil_town, jform_City, jform_District, jform_PinCode, jform_Land_Mark, jform_CHouse_Villa, jform_CStreet_Village, jform_CTehsil_town, jform_CCity, jform_CDistrict,"
        + " jform_CPinCode, jform_CLand_Mark, OHighestQualification,OCourse,OYear,OSkillTraining,OCertificateCourse,OVolunteerism,ODepartment,OPosition,OPeriodFrom,"
        + " OPeriodTo,ODepartmentSecond,OPositionSecond,OPeriodFromSecond,OPeriodToSecond,ODepartmentThird,OPositionThird,OPeriodFromThird,OPeriodToThird,OGraduationScore,OPostGraduationScore,"
        + " OotherDegreeScore,OSkillAcquired,OTechSkills,OSocialMediaActivism,Oearnings,Oexpenses,OexcessEarnings,OAge,Omarried,OEarningHand,OFamilyOne,OFamilyTwo,OFamilyThree,OFamilyFour,"
        + " OFamilyFive,OFamilySix,OhealthIssue,OCVFileUrl,OImageUrl,OexpectFromWorkshop,FeePay,CreatedDate) VALUES(";
        theSQL += "'" + fname + "',";
        theSQL += "'" + mname + "',";
        theSQL += "'" + lname + "',";
        theSQL += "'" + email + "',";
        theSQL += "'" + cipherTextPassword + "',";
        theSQL += "'" + contactno + "',";
        theSQL += "'" + alternateNo + "',";
        theSQL += "'" + occupation + "',";
        theSQL += "'" + aboutBtw + "',";
        theSQL += "'" + houseAdd + "',";
        theSQL += "'" + streetAdd + "',";
        theSQL += "'" + tehsilAdd + "',";
        theSQL += "'" + city + "',";
        theSQL += "'" + district + "',";
        theSQL += "'" + pincode + "',";
        theSQL += "'" + landMark + "',";
        theSQL += "'" + chouseAdd + "',";
        theSQL += "'" + cstreetAdd + "',";
        theSQL += "'" + ctehsilAdd + "',";
        theSQL += "'" + ccity + "',";
        theSQL += "'" + cdistrict + "',";
        theSQL += "'" + cpincode + "',";
        theSQL += "'" + clandMark + "',";
        theSQL += "'" + oqualification + "',";
        theSQL += "'" + oCourse + "',";
        theSQL += "'" + oYear  + "',";
        theSQL += "'" + oSkillTraning + "',";
        theSQL += "'" + oCerificateCourse + "',";
        theSQL += "'" + oVolunteerism + "',";
        theSQL += "'" + oOrganizationOne + "',";
        theSQL += "'" + oPositionOne + "',";
        theSQL += "'" + oPeriodFromOne + "',";
        theSQL += "'" + oPeriodToOne + "',";
        theSQL += "'" + oOrganizationTwo + "',";
        theSQL += "'" + oPositionTwo + "',";
        theSQL += "'" + oPeriodFromTwo + "',";
        theSQL += "'" + oPeriodToTwo + "',";
        theSQL += "'" + oOrganizationThree + "',";
        theSQL += "'" + oPositionThree + "',";
        theSQL += "'" + oPeriodFromThree + "',";
        theSQL += "'" + oPeriodToThree + "',";
        theSQL += "'" + oGraduateScore + "',";
        theSQL += "'" + oPostGraduateScore + "',";
        theSQL += "'" + oDegreeScore + "',";
        theSQL += "'" + oSkillAcquired + "',";
        theSQL += "'" + oTechSkill + "',";
        theSQL += "'" + oSocialMediaActivism + "',";
        theSQL += "'" + osatisfiedEarnings + "',";
        theSQL += "'" + oManageExpenses + "',";
        theSQL += "'" + oExcessEarnings + "',";
        theSQL += "'" + oAge + "',";
        theSQL += "'" + oMarried + "',";
        theSQL += "'" + oOnlyEarningHand + "',";
        theSQL += "'" + oFamilyOne + "',";
        theSQL += "'" + oFamilyTwo + "',";
        theSQL += "'" + oFamilyThree + "',";
        theSQL += "'" + oFamilyFour + "',";
        theSQL += "'" + oFamilyFive + "',";
        theSQL += "'" + oFamilySix + "',";
        theSQL += "'" + oHealthIssue + "',";
            theSQL += "'" + otherscv + "',";
            theSQL += "'" + otherImg + "',";
        theSQL += "'" + oWorkshop + "',";
        theSQL += "'" + payFee + "',";
        theSQL += "'" + DateTime.Now.ToString("yyyy-MM-dd") + "'";
        theSQL += ")";

        oCategoryManger.emailid = email;
        int chkCategoryExists = oCategoryManger.GetStudentRegistration_Exists();
        if (chkCategoryExists > 0)
        {
            MsgBox.Show("Email Id with the same name already exists");
        }
        else
        {
            obj.InsertEvents(theSQL);
        }

       
        txtoYear.Text = "";

        ddloqualification.SelectedValue = "0";
        ddloCourse.SelectedValue = "0";
       

    }


    protected void btnSubmitForStudent_Click(object sender, EventArgs e)
    {
        string fname = Request.Form["fname"];
        string mname = Request.Form["mname"];
        string lname = Request.Form["lname"];
        string email = Request.Form["email"];

        string password = Request.Form["fname"] + DateTime.Now.Year;

        string contactno = Request.Form["contactNo"];
        string alternateNo = Request.Form["alternateNo"];
        string occupation = Request.Form["occupation"];
        string aboutBtw = Request.Form["bwt"];
        string houseAdd = Request.Form["shouse"];
        string streetAdd = Request.Form["street"];
        string tehsilAdd = Request.Form["stehsil"];
        string city = Request.Form["sCity"];
        string district = Request.Form["sDistrict"];
        string pincode = Request.Form["sPinCode"];
        string landMark = Request.Form["sLandMark"];
        string chouseAdd = Request.Form["Cshouse"];
        string cstreetAdd = Request.Form["Cstreet"];
        string ctehsilAdd = Request.Form["Ctehsil"];
        string ccity = Request.Form["CCity"];
        string cdistrict = Request.Form["CDistrict"];
        string cpincode = Request.Form["CPinCode"];
        string clandMark = Request.Form["CLandMark"];

        string squalification = string.Empty;
        if (ddlsqualification.SelectedValue != "0")
        {
            squalification = ddlsqualification.SelectedItem.ToString();
        }
        string scourse = string.Empty;
        if (ddlsCourse.SelectedValue != "0")
        {
            scourse = ddlsCourse.SelectedItem.ToString();
        }
        string syear = txtsYear.Text;


        string spersuingdegree = string.Empty;
        if (ddlspersuingdegree.SelectedValue != "0")
        {
            spersuingdegree = ddlspersuingdegree.SelectedItem.ToString();
        }

        string spersuingcourse = string.Empty;
        if (ddlspersuingCourse.SelectedValue != "0")
        {
            spersuingcourse = ddlspersuingCourse.SelectedItem.ToString();
        }

        string spersuingPeriodFrom = Request.Form["spFrom"];
        string spersuingPeriodTo = Request.Form["spTo"];

        string sGraduationScore = Request.Form["sGraduationScore"];
        string sPostGraduationScore = Request.Form["sPostGraduationScore"];
        string sAnyDegreeScore = Request.Form["sotherDegreeScore"];
        string sSkillAcquired = Request.Form["sSkillacquired"];
        string sTechSkill = Request.Form["sTechSkills"];
        string sSocialMediaActivism = Request.Form["sSocialMediaActivism"];
        string sInternshipWhere = Request.Form["sInternship"];
        string sJobTraning = Request.Form["sjobtraining"];
        string sVolunterism = Request.Form["sVolunteerism"];
        string sAwards = Request.Form["sAwards"];
        string sCertificateExcellence = Request.Form["sCertificate"];
        string sHonourary = Request.Form["sHonourary"];
        string sFelloship = Request.Form["sfellowship"];
        string sHowMuchPay = Request.Form["sIfnotpayannualy"];
        string sAnyScholorship = Request.Form["sanyscholorship"];
        string sManageFee = Request.Form["smanagefee"];

        string payFee = string.Empty;
        payFee = Request.Form["StudentFee"];


        string cipherTextPassword = RijndaelSimple.Encrypt(Request.Form["password"]);

        string studnetImg = UploadImage(100, 200, 200);

        #region  Attachment Student CV
        string strGUID = Guid.NewGuid().ToString();
        string filename = uploadStudentCV.FileName.ToString();
        string[] filearray = new string[2];
        filearray = filename.Split('.');
        string SaveLocation = Server.MapPath("Upload") + "\\" + strGUID + "_" + uploadStudentCV.FileName;
        uploadStudentCV.PostedFile.SaveAs(SaveLocation);
        string MarksCard = strGUID + "_" + uploadStudentCV.FileName.ToString();
        #endregion

        

        string theSQL = "";
        theSQL += "INSERT INTO StudentRegistrations(firstName, middleName, lastname, emailid, Password, contactNo, AlternateNo, occupation, btw, jform_house_villa, jform_street_Village, "
        + " jform_tehsil_town, jform_City, jform_District, jform_PinCode, jform_Land_Mark, jform_CHouse_Villa, jform_CStreet_Village, jform_CTehsil_town, jform_CCity, jform_CDistrict,"
        + " jform_CPinCode, jform_CLand_Mark, jform_SQualification,jform_SCourse,jform_SYear,jform_SPersuing_Degree,jform_SPCourse,jform_SPeriodFrom,jform_SPeriodTo,jform_SGraduationScore,jform_SPostGraduationScore, "
        + " jform_SOtherDegreeScore,jform_SSkillAcquired,jform_STechSkills,jform_SSocialMediaActivism,SInternship,SjobTraining,SVolunteerism,SAwards,SCertificateofExcellence,SHonourary, "
        + " Sfellowship,SPayAnnualy,SScholorship,SManageCourseFee ,OCVFileUrl,OImageUrl,FeePay,CreatedDate) VALUES(";
        theSQL += "'" + fname + "',";
        theSQL += "'" + mname + "',";
        theSQL += "'" + lname + "',";
        theSQL += "'" + email + "',";
        theSQL += "'" + cipherTextPassword + "',";
        theSQL += "'" + contactno + "',";
        theSQL += "'" + alternateNo + "',";
        theSQL += "'" + occupation + "',";
        theSQL += "'" + aboutBtw + "',";
        theSQL += "'" + houseAdd + "',";
        theSQL += "'" + streetAdd + "',";
        theSQL += "'" + tehsilAdd + "',";
        theSQL += "'" + city + "',";
        theSQL += "'" + district + "',";
        theSQL += "'" + pincode + "',";
        theSQL += "'" + landMark + "',";
        theSQL += "'" + chouseAdd + "',";
        theSQL += "'" + cstreetAdd + "',";
        theSQL += "'" + ctehsilAdd + "',";
        theSQL += "'" + ccity + "',";
        theSQL += "'" + cdistrict + "',";
        theSQL += "'" + cpincode + "',";
        theSQL += "'" + clandMark + "',";
        theSQL += "'" + squalification + "',";
        theSQL += "'" + scourse + "',";
        theSQL += "'" + syear + "',";
        theSQL += "'" + spersuingdegree + "',";
        theSQL += "'" + spersuingcourse + "',";
        theSQL += "'" + spersuingPeriodFrom + "',";
        theSQL += "'" + spersuingPeriodTo + "',";
        theSQL += "'" + sGraduationScore + "',";
        theSQL += "'" + sPostGraduationScore + "',";
        theSQL += "'" + sAnyDegreeScore + "',";
        theSQL += "'" + sSkillAcquired + "',";
        theSQL += "'" + sTechSkill + "',";
        theSQL += "'" + sSocialMediaActivism + "',";
        theSQL += "'" + sInternshipWhere + "',";
        theSQL += "'" + sJobTraning + "',";
        theSQL += "'" + sVolunterism + "',";
        theSQL += "'" + sAwards + "',";
        theSQL += "'" + sCertificateExcellence + "',";
        theSQL += "'" + sHonourary + "',";
        theSQL += "'" + sFelloship + "',";
        theSQL += "'" + sHowMuchPay + "',";
        theSQL += "'" + sAnyScholorship + "',";
        theSQL += "'" + sManageFee + "',";
        theSQL += "'" + MarksCard + "',";
        theSQL += "'" + studnetImg + "',";
        theSQL += "'" + payFee + "',";
        theSQL += "'" + DateTime.Now.ToString("yyyy-MM-dd") + "'";
        theSQL += ")";

        oCategoryManger.emailid = email;
        int chkCategoryExists = oCategoryManger.GetStudentRegistration_Exists();
        if (chkCategoryExists > 0)
        {
            MsgBox.Show("Email Id with the same name already exists");
        }
        else
        {
            obj.InsertEvents(theSQL);
        }

        txtsYear.Text = "";
        txtoYear.Text = "";

        ddlspersuingdegree.SelectedValue = "0";
        ddlsCourse.SelectedValue = "0";

        ddloqualification.SelectedValue = "0";
        ddloCourse.SelectedValue = "0";
    }


    protected string UploadOtherImage(int targetSize, int Width, int Height)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = uploadOtherImage.PostedFile;
            int nFileLength = myFile.ContentLength;

            string extension = Utility.GetPictureExtension(uploadOtherImage.FileName).ToUpper();

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
                            string storagePath = Server.MapPath("Upload/") + filename;
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
                                    string storagePath = Server.MapPath("Upload/") + filename;
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
    protected string UploadImage(int targetSize, int Width, int Height)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = uploadStudentImage.PostedFile;
            int nFileLength = myFile.ContentLength;

            string extension = Utility.GetPictureExtension(uploadStudentImage.FileName).ToUpper();

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
                            string storagePath = Server.MapPath("Upload/") + filename;
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
                                    string storagePath = Server.MapPath("Upload/") + filename;
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