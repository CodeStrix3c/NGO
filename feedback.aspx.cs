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


public partial class feedback : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (!IsPostBack)
        {
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
                string theSQL = "";
                theSQL += "INSERT INTO Feedback(Name,MobileNo,Email,Message,CreatedDate) VALUES(";
                theSQL += "'" + txtCName.Text.Replace("'", "''") + "',";
                theSQL += "'" + txtMContactNo.Text.Replace("'", "''") + "',";
                theSQL += "'" + txtEmailID.Text.Replace("'", "''") + "',";
                theSQL += "'" + txtDescription.Text.Replace("'", "''") + "',";
                theSQL += "'" + obj.ReturnDate() + "'";
                theSQL += ")";
                MsgBox.Show(obj.InsertData(theSQL));
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