using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CCA.Util;

public partial class paynowrequest : System.Web.UI.Page
{
    CCACrypto ccaCrypto = new CCACrypto();
    string workingKey = "6739ECB063B5483B555D033077B8458E";
    string ccaRequest = "";
    public string strEncRequest = "";
    public string strAccessCode = "AVBL79FH84BH25LBHB";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            foreach (string name in Request.Form)
            {
                if (name != null)
                {
                    if (!name.StartsWith("_"))
                    {
                        ccaRequest = ccaRequest + name + "=" + Request.Form[name] + "&";
                    }
                }
            }
            ccaRequest = ccaRequest.Replace(",", " ");
            strEncRequest = ccaCrypto.Encrypt(ccaRequest, workingKey);
            ltrframe.Text = "https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction&encRequest=" + strEncRequest + "&access_code=" + strAccessCode;
        }
    }
}