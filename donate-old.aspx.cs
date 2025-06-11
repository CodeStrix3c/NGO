using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class donate : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (!IsPostBack)
        {
            lblCName.Text = Request.QueryString["cn"];
            if (GeneratedText == null)
                TryNew();
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (GeneratedText.ToUpper() == TxtCpatcha.Text.Trim().ToUpper())
        {
            try
            {
                bool varReturn = false;

                varReturn = Send_Email();
                if (varReturn)
                {
                    lblmessage.Text = "Thank You very much!";
                }
                else
                {
                    lblmessage.Text = "Please try again after sometime..";
                }

                TryNew();
                TxtCpatcha.Text = string.Empty;
                lblCheckResult.Text = "";
             
                TryNew();
                resentfields();
            }
            catch { }
        }
        else
        {
            lblCheckResult.ForeColor = System.Drawing.Color.Red;
            lblCheckResult.Text = "You have Entered InValid Captcha Characters please Enter again";
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

        varSubject = "Donation";
        varFromDisplayName = ConfigurationManager.AppSettings["FromDisplayName"];
        varToDisplayName = ConfigurationManager.AppSettings["ToDisplayName"];
        varName = txtCName.Text.Replace("'", "''");
        // varPhone = txtContactNo.Text.Trim().Replace("'", "''");
        varFromEmail = txtEmailID.Text.Replace("'", "''"); //"hr@helpfoundation.co";
        varPhone = txtMContactNo.Text.Replace("'", "''");
        varToEmail = "arifsahara@gmail.com";
        string DonateType = Request.QueryString["cn"];
        varBody = txtDescription.Text.Replace("'", "''");

        varEmailDetails = "<B>" + "" + DonateType + "<BR>" + "<B>" + " Name : " + varName + "<BR>" + "<B>" + " Email : " + varFromEmail + "<BR>" + "<B>" + " Contact : " + varPhone + "<BR><BR>" + "<B>" + " Message : " + varBody + "<BR>";

        varEmailSent = MailHelper.SendMailMessage(varFromDisplayName, varToDisplayName, varFromEmail, varToEmail, varToBcc, varToCC, varSubject, varEmailDetails.ToString());

        return varEmailSent;
    }
    #endregion

    public void resentfields()
    {
        txtEmailID.Text = string.Empty;
        txtDescription.Text = string.Empty;
        txtMContactNo.Text = string.Empty;
        txtCName.Text = string.Empty;
        TxtCpatcha.Text = string.Empty;
        lblCheckResult.Text = "";
    }
    public void TryNew()
    {
        char[] Valichars = {'1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f','g','h','i',
                           'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z' };
        string Captcha = "";
        int LetterCount = MaxLetterCount > 5 ? MaxLetterCount : 5;
        for (int i = 0; i < LetterCount; i++)
        {
            char newChar = (char)0;
            do
            {
                newChar = Char.ToUpper(Valichars[new Random(DateTime.Now.Millisecond).Next(Valichars.Count() - 1)]);
            }
            while (Captcha.Contains(newChar));
            Captcha += newChar;
        }
        GeneratedText = Captcha;

        ImgCaptcha.ImageUrl = "GetImgText.ashx?CaptchaText=" +
            Server.UrlEncode(Convert.ToBase64String(SecurityHelper.EncryptString(Captcha)));
    }
    public int MaxLetterCount { get; set; }
    private string GeneratedText
    {
        get
        {
            return ViewState[this.ClientID + "text"] != null ?
                ViewState[this.ClientID + "text"].ToString() : null;
        }
        set
        {
            // Encrypt the value before storing it in viewstate.
            ViewState[this.ClientID + "text"] = value;
        }
    }
    public bool IsValid
    {
        get
        {
            bool result = GeneratedText.ToUpper() == TxtCpatcha.Text.Trim().ToUpper();
            if (!result)
                TryNew();
            return result;
        }
    }
    protected void btnTryNewWords_Click(object sender, EventArgs e)
    {
        TryNew();
    }
}