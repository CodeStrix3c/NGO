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


public partial class Applyform : System.Web.UI.Page
{
   protected iLayer obj;
    public int QueryString__ID = 0;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();

        if (Request.QueryString["Id"] == "" || Request.QueryString["Id"] == null || Request.QueryString["cn"] == "" || Request.QueryString["cn"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            QueryString__ID = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (!IsPostBack)
            {
                Bind_Grid();
            }
        }

    }

    private void Bind_Grid()
    {
        DataSet ds = obj.GetPostalCode();
        //ddlPostalCode.DataSource = ds.Tables[0];
        //ddlPostalCode.DataTextField = "PCode";
        //ddlPostalCode.DataValueField = "ID";
        //ddlPostalCode.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        obj.PostId = Convert.ToInt32(QueryString__ID);
        obj.EmailId = Request.Form["jform_Email"];
        obj.mobileNo = Request.Form["jform_Mobile"];

            if (obj.IsValidMember())
            {

                

                string Photograph = UploadImage(100, 200, 250);
                string sig = UploadSigImage(100, 200, 100);

                string theSQL = "";
                theSQL += "INSERT INTO Registration(PostId,PreferenceDistOne,PreferenceDistTwo,PreferenceDistThree,Name,Gender,MaritalStatus,DOB,Parentage,Email,MobileNo,AlternateNo,Address,District,State,PinCode,PAddress,PDistrict,PState,PPinCode,ExamPassed,Subject,PassingYear,MaxMarks,MarksObtained,Percentage,UniversityBoard,ExamPassedOne,SubjectOne,PassingYearOne,MaxMarksOne,MarksObtainedOne,PercentageOne,UniversityBoardOne,ExamPassedTwo,SubjectTwo,PassingYearTwo,MaxMarksTwo,MarksObtainedTwo,PercentageTwo,UniversityBoardTwo,ExamPassedThree,SubjectThree,PassingYearThree,MaxMarksThree,MarksObtainedThree,PercentageThree,UniversityBoardThree,ExamPassedFour,SubjectFour,PassingYearFour,MaxMarksFour,MarksObtainedFour,PercentageFour,UniversityBoardFour,Position,PFrom,PTo,GSalary,Responsibilities,Reasons,Experience,PositionOne,PFromOne,PToOne,GSalaryOne,ResponsibilitiesOne,ReasonsOne,ExperienceOne,PositionTwo,PFromTwo,PToTwo,GSalaryTwo,ResponsibilitiesTwo,ReasonsTwo,ExperienceTwo,LicenseNo,LicenseValidity,LicensePeriodTo,LicenseClass,LicenseAuthority,FileUrl,SigUrl,CreatedDate,IsActive) VALUES(";
                theSQL += "'" + Convert.ToInt32(QueryString__ID) + "',";
                theSQL += "'" + Request.Form["Pdistrictone"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["PdistrictTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["PdistrictThree"].Replace("'", "''") + "',";

                theSQL += "'" + Request.Form["jform_firstName"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["Gender"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["MaritalStatus"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_Date_of_Birth"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PfirstName"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_Email"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_Mobile"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_AlternateContact"].Replace("'", "''") + "',";

                theSQL += "'" + Request.Form["jform_Street_Name"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_District"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_State"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PinCode"].Replace("'", "''") + "',";


                theSQL += "'" + Request.Form["jform_Street_NameOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_DistrictOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_StateOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PinCodeOne"].Replace("'", "''") + "',";


                theSQL += "'" + Request.Form["jform_ExaminationPassed"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_Subject"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_yearOfPassing"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMaxMarks"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMarksObtained"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_Percent"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGUniversityBoard"].Replace("'", "''") + "',";

                theSQL += "'" + Request.Form["jform_ExaminationPassedOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_SubjectOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_yearOfPassingOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMaxMarksOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMarksObtainedOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PercentOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGUniversityBoardOne"].Replace("'", "''") + "',";

                theSQL += "'" + Request.Form["jform_ExaminationPassedTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_SubjectTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_yearOfPassingTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMaxMarksTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMarksObtainedTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PercentTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGUniversityBoardTwo"].Replace("'", "''") + "',";

                theSQL += "'" + Request.Form["jform_ExaminationPassedThree"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_SubjectThree"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_yearOfPassingThree"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMaxMarksThree"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMarksObtainedThree"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PercentThree"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGUniversityBoardThree"].Replace("'", "''") + "',";


                theSQL += "'" + Request.Form["jform_ExaminationPassedFour"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_SubjectFour"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_yearOfPassingFour"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMaxMarksFour"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGMarksObtainedFour"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PercentFour"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PGUniversityBoardFour"].Replace("'", "''") + "',";


                theSQL += "'" + Request.Form["jform_PositionHeld"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PeriodFrom"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PeriodTo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_GSalary"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_Responsibilities"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_Reasons"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_TExperience"].Replace("'", "''") + "',";

                theSQL += "'" + Request.Form["jform_PositionHeldOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PeriodFromOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PeriodToOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_GSalaryOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_ResponsibilitiesOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_ReasonsOne"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_TExperienceOne"].Replace("'", "''") + "',";

                theSQL += "'" + Request.Form["jform_PositionHeldTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PeriodFromTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_PeriodToTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_GSalaryTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_ResponsibilitiesTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_ReasonsTwo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_TExperienceTwo"].Replace("'", "''") + "',";


                theSQL += "'" + Request.Form["jform_LicenseNo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_LicenseValidity"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_LicensePeriodTo"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_LicenseClass"].Replace("'", "''") + "',";
                theSQL += "'" + Request.Form["jform_LicenseAuthority"].Replace("'", "''") + "',";
                theSQL += "'" + Photograph.Replace("'", "''") + "',";
                theSQL += "'" + sig.Replace("'", "''") + "',";
                theSQL += "'" + obj.ReturnDate() + "',";
                theSQL += true;
                theSQL += ")";

                obj.InsertData(theSQL);
                bool varReturn = false;
                varReturn = Send_Email();
                if (varReturn)
                {
                }
               

                MsgBox.Show("Thank You very much. We have received your application for the post.");
               

                //ltrMesg.Text = "Thank You very much!" + "<br>" + "We have received your application for the post.";
            }
            else
            {
                MsgBox.Show("You have already applied for this post");
            }
       
    }




    #region "Public :: E-Mail Methods here..."
    public bool Send_Email()
    {
        bool varEmailSent = false;


        string varFromDisplayName = string.Empty;
        string varToDisplayName = string.Empty;
        string varFromEmail = string.Empty;
        string varToEmail = string.Empty;
        string varSubject = string.Empty;
        string varBody = string.Empty;
        string varToBcc = string.Empty;
        string varToCC = string.Empty;
        string varName = string.Empty;
        string varPhone = string.Empty;
        string varPostCode = string.Empty;
        string varEmailDetails = string.Empty;
        string varErrorMessage_Email = string.Empty;

        varSubject = "Ehsaase-e-Insaniyat Trust";
        varFromDisplayName = ConfigurationManager.AppSettings["FromDisplayName"];
        varToDisplayName = ConfigurationManager.AppSettings["ToDisplayName"];
        varName = Request.Form["jform_firstName"].Replace("'", "''");
        // varPhone = txtContactNo.Text.Trim().Replace("'", "''");
        varFromEmail = "arifsahara@gmail.com"; //"hr@helpfoundation.co";
       // varPostCode = ddlPostalCode.SelectedItem.Text.Trim().Replace("'", "''");
        varToEmail = Request.Form["jform_Email"].Replace("'", "''");

        // ltrMesg.Text = "Thank You very much!" + "<br>" + "We have received your application for the post.";
        // ltrEMsg.Text = "Thank You very much!" + "<br>" + "We have received your application for the post. In case shortlisted, you will be contacted soon. Please check your email regularly." + "<br><br>" + "Warm Regards" + "<br><br>" + "Team HR" + "<br>" + "Ehsaase-e-Insaniyat Trust, J&K";

        varBody = "Thanks for showing interest in our organization. We have received your online application. Please stay connected with us at https://ehsaaseinsaniyattrust.org to keep yourself updated about the recruitment process.  We also publish job advertisements on Facebook at https://www.facebook.com/eeitrust2019/" + "<br><br>" + "Warm Regards" + "<br><br>" + "Team HR" + "<br>" + "Ehsaase-e-Insaniyat Trust, J&K";

        varEmailDetails = "<B>" + " Dear : " + varName + "<BR><BR>" + "<B>" + varBody + "<BR>";

        varEmailSent = MailHelper.SendMailMessage(varFromDisplayName, varToDisplayName, varFromEmail, varToEmail, varToBcc, varToCC, varSubject, varEmailDetails.ToString());

        return varEmailSent;
    }
    #endregion



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

    protected string UploadSigImage(int targetSize, int Width, int Height)
    {
        string filename = "";
        try
        {
            HttpPostedFile myFile = uploadSignature.PostedFile;
            int nFileLength = myFile.ContentLength;

            string extension = Utility.GetPictureExtension(uploadSignature.FileName).ToUpper();

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