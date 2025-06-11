using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Specialized;
using System.Text;
using CCA.Util;
using System.Globalization;

public partial class donateresponse : System.Web.UI.Page
{
    protected iLayer obj;

    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        string workingKey = "6739ECB063B5483B555D033077B8458E";
        CCACrypto ccaCrypto = new CCACrypto();
        string encResponse = ccaCrypto.Decrypt(Request.Form["encResp"], workingKey);
        NameValueCollection Params = new NameValueCollection();
        string[] segments = encResponse.Split('&');
        foreach (string seg in segments)
        {
            string[] parts = seg.Split('=');
            if (parts.Length > 0)
            {
                string Key = parts[0].Trim();
                string Value = parts[1].Trim();
                Params.Add(Key, Value);
            }
        }
        string strorderno = string.Empty,
            strccavrefno = string.Empty,
            strtrackingid = string.Empty,
            strbankrefno = string.Empty,
            strfullname = string.Empty,
            stremail = string.Empty,
            stradd = string.Empty,
            strcity = string.Empty,
            strstate = string.Empty,
            strzip = string.Empty,
            strpanno = string.Empty,
            stramount = string.Empty,
            strdob = string.Empty,
            strnationality = string.Empty,
            strpaymode = string.Empty,
            strcardname = string.Empty,
            strorderddate = string.Empty,

             strdobDay = string.Empty,
             strdobMonth = string.Empty,
             strdobYear = string.Empty,

            strdonorType = string.Empty,
              strcurrencyType = string.Empty,
               strpurposeType = string.Empty,
                strCharityType = string.Empty,

            strorderstatus = string.Empty;
        DateTime newDate = DateTime.Now;

        string strcurr = "";
        StringBuilder strname = new StringBuilder();
        StringBuilder straddress = new StringBuilder();
        for (int i = 0; i < Params.Count; i++)
        {
            switch (Params.Keys[i])
            {
                case "order_id":
                    ltrorder.Text = Params[i];
                    ltrinvoice.Text = Params[i];
                    strorderno = Params[i];
                    break;
                case "tracking_id":
                    ltrccref.Text = Params[i];
                    strccavrefno = Params[i];
                    strtrackingid = Params[i];
                    break;

                case "merchant_param2":
                    strdonorType = Params[i];
                    break;

                case "merchant_param3":
                    strpurposeType = Params[i];
                    break;

                case "merchant_param4":
                    strCharityType = Params[i];
                    break;

                case "merchant_param5":
                    strdobDay = Params[i];
                    break;

                case "merchant_param6":
                    strdobMonth = Params[i];
                    break;

                case "merchant_param7":
                    strdobYear = Params[i];
                    break;

                case "bank_ref_no":
                    ltrbankref.Text = Params[i];
                    strbankrefno = Params[i];
                    break;

                case "currency":
                    strcurr = Params[i];
                    break;
                case "amount":
                    ltramount.Text = strcurr + " " + Params[i];
                    ltrgrandtotal.Text = strcurr + " " + Params[i];
                    stramount = strcurr + " " + Params[i];
                    break;
                case "billing_name":
                    strname.Append(Params[i]);
                    strfullname = Params[i];
                    break;
                case "billing_tel":
                    strname.Append(" | " + Params[i]);
                    break;
                case "billing_email":
                    strname.Append(" | " + Params[i]);
                    stremail = Params[i];
                    ltrname.Text = strname.ToString();
                    break;
                case "billing_address":
                    straddress.Append(Params[i]);
                    stradd = Params[i];
                    break;
                case "billing_state":
                    straddress.Append(" | " + Params[i]);
                    strstate = Params[i];
                    break;
                case "billing_city":
                    straddress.Append(" | " + Params[i]);
                    strcity = Params[i];
                    break;
                case "billing_zip":
                    straddress.Append(" | " + Params[i]);
                    strzip = Params[i];
                    break;
                case "billing_country":
                    straddress.Append(" | " + Params[i]);
                    strnationality = Params[i];
                    ltraddress.Text = straddress.ToString();
                    break;
                case "payment_mode":
                    ltrmode.Text = Params[i];
                    strpaymode = Params[i];
                    break;
                case "card_name":
                    ltrcardname.Text = Params[i];
                    strcardname = Params[i];
                    break;
                case "merchant_param1":
                    strpanno = Params[i];
                    break;
                case "trans_date":
                    ltrorderdate.Text = Params[i];
                    strorderddate = Params[i];
                    break;
                case "order_status":
                    strorderstatus = Params[i];
                    break;
            }

            //Response.Write(Params.Keys[i] + " = " + Params[i] + "<br>");
        }

        if (strorderstatus.ToLower() == "success")
        {
            try
            {
                string currentdate = Convert.ToString(strorderddate);
                CultureInfo provider = new CultureInfo("en-US");
                string[] format = { 
                    //"MM/dd/yyyy", "M/d/yyyy", "M/dd/yyyy", "MM/d/yyyy", "M/d/yyyy h:mm:ss tt", "MM/d/yyyy h:mm:ss tt", "M/d/yyyy h:mm tt",  
                    //"MM/dd/yyyy hh:mm:ss", "M/d/yyyy h:mm:ss",  
                    //"M/d/yyyy hh:mm tt", "M/d/yyyy hh tt",  
                    //"M/d/yyyy h:mm", "M/d/yyyy h:mm",  
                    //"MM/dd/yyyy hh:mm", "M/dd/yyyy hh:mm"  

                    "dd/MM/yyyy", "d/M/yyyy", "dd/M/yyyy", "d/MM/yyyy", "d/M/yyyy h:mm:ss tt", "d/MM/yyyy h:mm:ss tt", "d/M/yyyy h:mm tt",  
                    "dd/MM/yyyy hh:mm:ss", "d/M/yyyy h:mm:ss",  
                    "d/M/yyyy hh:mm tt", "d/M/yyyy hh tt",  
                    "d/M/yyyy h:mm", "d/M/yyyy h:mm",  
                    "dd/MM/yyyy hh:mm", "dd/M/yyyy hh:mm"  
            };

                string newDate1 = Convert.ToDateTime(DateTime.Now).ToString("yyyy-MM-dd hh:mm:ss");//DateTime.ParseExact(strorderddate, format, provider, DateTimeStyles.None).ToString("yyyy-MM-dd hh:mm:ss");

                string theSQL = "";
                theSQL += "INSERT INTO Donation(dorderid, dccavenuerefno, dtrackingid, dbankrefno, DonorType, Purpose, PurposeType, dfullname, demailid, daddress, dcity, dstate, dzip, dpanno, damount, ddob, dnationality, dpaymode, dcardname, dorderdate, ispublished, isdeleted, createddate, modifieddate) VALUES(";
                theSQL += "'" + strorderno + "',";
                theSQL += "'" + strccavrefno + "',";
                theSQL += "'" + strtrackingid + "',";
                theSQL += "'" + strbankrefno + "',";
                theSQL += "'" + strdonorType + "',";
                theSQL += "'" + strpurposeType + "',";
                if (strpurposeType != "Charity")
                {
                    theSQL += "'" + "" + "',";
                }
                else
                {
                    theSQL += "'" + strCharityType + "',";
                }
                theSQL += "'" + strfullname + "',";
                theSQL += "'" + stremail + "',";
                theSQL += "'" + stradd + "',";
                theSQL += "'" + strcity + "',";
                theSQL += "'" + strstate + "',";
                theSQL += "'" + strzip + "',";
                theSQL += "'" + strpanno + "',";
                theSQL += "'" + stramount + "',";

                theSQL += "'" + strdobDay  + "/" + strdobMonth + "/" + strdobYear + "',";

                theSQL += "'" + strnationality + "',";
                theSQL += "'" + strpaymode + "',";
                theSQL += "'" + strcardname + "',";
                theSQL += "'" + Convert.ToDateTime(newDate1).ToString("yyyy-MM-dd hh:mm:ss") + "',";
                theSQL += "'yes',";
                theSQL += "'no',";
                theSQL += "'" + DateTime.Now.ToString("yyyy-MM-dd") + "',";
                theSQL += "'" + DateTime.Now.ToString("yyyy-MM-dd") + "'";
                theSQL += ")";
                obj.InsertEvents(theSQL);
            }
            catch (Exception ex)
            {
                Response.Write("Exception: " + ex.Message);
            }
        }

        //Response.Write("<br/>value is " + strorderno + ", " + strccavrefno);
    }
}