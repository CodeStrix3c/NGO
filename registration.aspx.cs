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


public partial class registration : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility = new ReeLogic();
        obj = new iLayer();

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string firstName = Request.Form["jform_firstName"];
        string middleName = Request.Form["jform_middleName"];
        string Surname = Request.Form["jform_Surname"];
        string Gender = Request.Form["Gender"];
        string MaritalStatus = Request.Form["MaritalStatus"];
        string DOB = Request.Form["jform_Date_of_Birth"];

        string pfirstName = Request.Form["jform_PfirstName"];
        string pmiddleName = Request.Form["jform_PmiddleName"];
        string pSurname = Request.Form["jform_PSurname"];

        string jform_Street_Name = Request.Form["jform_Street_Name"];
        string jform_Village = Request.Form["jform_Village"];
        string jform_City = Request.Form["jform_City"];
        string jform_District = Request.Form["jform_District"];
        string jform_State = Request.Form["jform_State"];
        string jform_PinCode = Request.Form["jform_PinCode"];

        string jform_CStreet_Name = Request.Form["jform_CStreet_Name"];
        string jform_CVillage = Request.Form["jform_CVillage"];
        string jform_CCity = Request.Form["jform_CCity"];
        string jform_CDistrict = Request.Form["jform_CDistrict"];
        string jform_CState = Request.Form["jform_CState"];
        string jform_CPinCode = Request.Form["jform_CPinCode"];

        string jform_PoliceStation = Request.Form["jform_PoliceStation"];
        string jform_AadharNo = Request.Form["jform_AadharNo"];
        string jform_VoterIDNo = Request.Form["jform_VoterIDNo"];

        string jform_Email = Request.Form["jform_Email"];
        string jform_Mobile = Request.Form["jform_Mobile"];
        string jform_AlternateContact = Request.Form["jform_AlternateContact"];

        string jform_PGUniversity = Request.Form["jform_PGUniversity"];
        string jform_PGYear = Request.Form["jform_PGYear"];
        string jform_PGMaxMarks = Request.Form["jform_PGMaxMarks"];
        string jform_PGMarksObtained = Request.Form["jform_PGMarksObtained"];
        string jform_PGGrade = Request.Form["jform_PGGrade"];

        string jform_GUniversity = Request.Form["jform_GUniversity"];
        string jform_GYear = Request.Form["jform_GYear"];
        string jform_GMaxMarks = Request.Form["jform_GMaxMarks"];
        string jform_GMarksObtained = Request.Form["jform_GMarksObtained"];
        string jform_GGrade = Request.Form["jform_GGrade"];

        string any_Bank_Exam = Request.Form["any_Bank_Exam"];
        string BankExam = Request.Form["BankExam"];

        string any_Bank_Earlier = Request.Form["any_Bank_Earlier"];
        string Bank_Earlier = Request.Form["Bank_Earlier"];

        string jform_applying = Request.Form["jform_applying"];

        string jform_dateDiffrence = Request.Form["dobDiffrence"];

        var val = int.Parse(jform_dateDiffrence);

        if (val <= 35)
        {
            int varemail = obj.Registration_Exists(jform_Email);
            if (varemail > 0)
            {
                lblmessage.Text = "You are already registered";
               // Response.Redirect("Default.aspx");
            }
            else
            {
                if (uploadPhotograph.HasFile)
                {

                    #region  Attachment
                    string strGUID = Guid.NewGuid().ToString();
                    string filename = uploadMarksCard.FileName.ToString();
                    string[] filearray = new string[2];
                    filearray = filename.Split('.');
                    string SaveLocation = Server.MapPath("Upload") + "\\" + strGUID + "_" + uploadMarksCard.FileName;
                    uploadMarksCard.PostedFile.SaveAs(SaveLocation);
                    string MarksCard = strGUID + "_" + uploadMarksCard.FileName.ToString();
                    #endregion
                    #region  Attachment
                    string strAadharGUID = Guid.NewGuid().ToString();
                    string fileAadharname = uploadAadhar.FileName.ToString();
                    string[] fileAadhararray = new string[2];
                    fileAadhararray = fileAadharname.Split('.');
                    string SaveAadharLocation = Server.MapPath("Upload") + "\\" + strAadharGUID + "_" + uploadAadhar.FileName;
                    uploadAadhar.PostedFile.SaveAs(SaveAadharLocation);
                    string AadharNo = strAadharGUID + "_" + uploadAadhar.FileName.ToString();
                    #endregion

                    string Photograph = UploadImage(100, 200, 200);

                    string theSQL = "";
                    theSQL += "INSERT INTO OnlineRegistration(firstName,middleName,Surname,Gender,MaritalStatus,DOB,pfirstName,pmiddleName,pSurname,jform_Street_Name,jform_Village,jform_City,jform_District,jform_State,jform_PinCode,jform_PoliceStation,jform_AadharNo,jform_VoterIDNo,jform_CStreet_Name,jform_CVillage,jform_CCity,jform_CDistrict,jform_CState,jform_CPinCode,jform_Email,jform_Mobile,jform_AlternateContact,jform_PGUniversity,jform_PGYear,jform_PGMaxMarks,jform_PGMarksObtained,jform_PGGrade,jform_GUniversity,jform_GYear,jform_GMaxMarks,jform_GMarksObtained,jform_GGrade,any_Bank_Exam,BankExam,any_Bank_Earlier,Bank_Earlier,jform_applying,MarksCard,AadharNo,Photograph,CreatedDate) VALUES(";
                    theSQL += "'" + firstName.Replace("'", "''") + "',";
                    theSQL += "'" + middleName.Replace("'", "''") + "',";
                    theSQL += "'" + Surname.Replace("'", "''") + "',";
                    theSQL += "'" + Gender.Replace("'", "''") + "',";
                    theSQL += "'" + MaritalStatus.Replace("'", "''") + "',";
                    theSQL += "'" + DOB.Replace("'", "''") + "',";
                    theSQL += "'" + pfirstName.Replace("'", "''") + "',";
                    theSQL += "'" + pmiddleName.Replace("'", "''") + "',";
                    theSQL += "'" + pSurname.Replace("'", "''") + "',";
                    theSQL += "'" + jform_Street_Name.Replace("'", "''") + "',";
                    theSQL += "'" + jform_Village.Replace("'", "''") + "',";
                    theSQL += "'" + jform_City.Replace("'", "''") + "',";
                    theSQL += "'" + jform_District.Replace("'", "''") + "',";
                    theSQL += "'" + jform_State.Replace("'", "''") + "',";
                    theSQL += "'" + jform_PinCode.Replace("'", "''") + "',";

                    theSQL += "'" + jform_PoliceStation.Replace("'", "''") + "',";
                    theSQL += "'" + jform_AadharNo.Replace("'", "''") + "',";
                    theSQL += "'" + jform_VoterIDNo.Replace("'", "''") + "',";

                    theSQL += "'" + jform_CStreet_Name.Replace("'", "''") + "',";
                    theSQL += "'" + jform_CVillage.Replace("'", "''") + "',";
                    theSQL += "'" + jform_CCity.Replace("'", "''") + "',";
                    theSQL += "'" + jform_CDistrict.Replace("'", "''") + "',";
                    theSQL += "'" + jform_CState.Replace("'", "''") + "',";
                    theSQL += "'" + jform_CPinCode.Replace("'", "''") + "',";

                    theSQL += "'" + jform_Email.Replace("'", "''") + "',";
                    theSQL += "'" + jform_Mobile.Replace("'", "''") + "',";
                    theSQL += "'" + jform_AlternateContact.Replace("'", "''") + "',";
                    theSQL += "'" + jform_PGUniversity.Replace("'", "''") + "',";
                    theSQL += "'" + jform_PGYear.Replace("'", "''") + "',";
                    theSQL += "'" + jform_PGMaxMarks.Replace("'", "''") + "',";
                    theSQL += "'" + jform_PGMarksObtained.Replace("'", "''") + "',";
                    theSQL += "'" + jform_PGGrade.Replace("'", "''") + "',";
                    theSQL += "'" + jform_GUniversity.Replace("'", "''") + "',";
                    theSQL += "'" + jform_GYear.Replace("'", "''") + "',";
                    theSQL += "'" + jform_GMaxMarks.Replace("'", "''") + "',";
                    theSQL += "'" + jform_GMarksObtained.Replace("'", "''") + "',";
                    theSQL += "'" + jform_GGrade.Replace("'", "''") + "',";
                    theSQL += "'" + any_Bank_Exam.Replace("'", "''") + "',";
                    if (BankExam != null)
                    {
                        theSQL += "'" + BankExam.Replace("'", "''") + "',";
                    }
                    else
                    {
                        theSQL += "'" + "NA" + "',";
                    }

                    theSQL += "'" + any_Bank_Earlier.Replace("'", "''") + "',";

                    if (Bank_Earlier != null)
                    {
                        theSQL += "'" + Bank_Earlier.Replace("'", "''") + "',";
                    }
                    else
                    {
                        theSQL += "'" + "NA" + "',";
                    }
                    theSQL += "'" + jform_applying.Replace("'", "''") + "',";
                    theSQL += "'" + MarksCard.Replace("'", "''") + "',";
                    theSQL += "'" + AadharNo.Replace("'", "''") + "',";
                    theSQL += "'" + Photograph.Replace("'", "''") + "',";
                    theSQL += "'" + obj.ReturnDate() + "'";
                    theSQL += ")";

                    MsgBox.Show(obj.InsertRegistration(theSQL));
                    lblmessage.Text = "";
                }
                else
                {
                    MsgBox.Show("Please Upload Your Photograph");
                    lblmessage.Text = "";
                }
            }

        }
        else
        {
            MsgBox.Show("Sorry Your are not eligible! your age is more than 35 Years");
            lblmessage.Text = "";
        }


    }

    protected string UploadImage(int targetSize, int Width, int Height)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = uploadPhotograph.PostedFile;
            int nFileLength = myFile.ContentLength;

            string extension = Utility.GetPictureExtension(uploadPhotograph.FileName).ToUpper();

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