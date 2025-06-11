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
/// Summary description for GenerateUrl
/// </summary>
public class GenerateUrl
{
    public string GenerateURL(object Title, object strId)
    {
        string strTitle = Title.ToString();

        #region Generate SEO Friendly URL based on Title
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');

        strTitle = strTitle.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");

        //Replace . with - hyphen
        strTitle = strTitle.Replace(".", "-");

        //Replace Special-Characters
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }

        //Replace all spaces with one "-" hyphen
        strTitle = strTitle.Replace(" ", "-");

        //Replace multiple "-" hyphen with single "-" hyphen.
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");
        
        //Run the code again...
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');
        #endregion

        //Append ID at the end of SEO Friendly URL
        //strTitle = "news/" + strTitle + "-" + strId + ".aspx";

        switch (strTitle)
        {
            //case "StaticDirectoryNameHereTODO":
            case "newsdetails":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "newsdetails-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            case "categorydetails":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "categorydetails-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            case "adslist":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "adslist-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            default:
                {
                    //strTitle = "~/" + DirectoryName + "/" + strTitle + "-" + strId + ".aspx";
                    strTitle = strTitle + "/" + strTitle + "-" + strId + ".aspx";
                    break;
                }
        }

        return strTitle;

       // return strTitle;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="DirectoryName"></param>
    /// <param name="Title"></param>
    /// <param name="strId"></param>
    /// <returns></returns>
    public string GenerateURL(object DirectoryName, object Title, object strId)
    {
        string strTitle = Title.ToString();
        string strDirectoryName = DirectoryName.ToString();

        #region Generate SEO Friendly URL based on Title
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();
        strDirectoryName = strDirectoryName.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');
        strDirectoryName = strDirectoryName.Trim('-');

        strTitle = strTitle.ToLower();
        strDirectoryName = strDirectoryName.ToLower();

        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");

        strDirectoryName = strDirectoryName.Replace("c#", "C-Sharp");
        strDirectoryName = strDirectoryName.Replace("vb.net", "VB-Net");
        strDirectoryName = strDirectoryName.Replace("asp.net", "Asp-Net");

        //Replace . with - hyphen
        strTitle = strTitle.Replace(".", "-");
        strDirectoryName = strDirectoryName.Replace(".", "-");

        //Replace Special-Characters
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();

            if (strDirectoryName.Contains(strChar))
            {
                strDirectoryName = strDirectoryName.Replace(strChar, string.Empty);
            }

            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }

        //Replace all spaces with one "-" hyphen
        strTitle = strTitle.Replace(" ", "-");
        strDirectoryName = strDirectoryName.Replace(" ", "-");

        //Replace multiple "-" hyphen with single "-" hyphen.
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");

        strDirectoryName = strDirectoryName.Replace("--", "-");
        strDirectoryName = strDirectoryName.Replace("---", "-");
        strDirectoryName = strDirectoryName.Replace("----", "-");
        strDirectoryName = strDirectoryName.Replace("-----", "-");
        strDirectoryName = strDirectoryName.Replace("----", "-");
        strDirectoryName = strDirectoryName.Replace("---", "-");
        strDirectoryName = strDirectoryName.Replace("--", "-");

        //Run the code again...
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();
        strDirectoryName = strDirectoryName.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');
        strDirectoryName = strDirectoryName.Trim('-');
        #endregion

        //////Append ID at the end of SEO Friendly URL
        ////strTitle = "news/" + strTitle + "-" + strId + ".aspx";

        switch (strDirectoryName)
        {
            //case "StaticDirectoryNameHereTODO":
            case "newsdetails":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "newsdetails-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            //case "categorydetails":
            //    {
            //        //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
            //        strTitle = "categorydetails-" + strTitle + "-" + strId + ".aspx";
            //        break;
            //    }
            case "cd":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "CD-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            //case "adslist":
            //    {
            //        strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
            //        strTitle = "adslist-" + strTitle + "-" + strId + ".aspx";
            //        break;
            //    }
                
            case "als":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "ALS-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            case "al":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "AL-" + strTitle + "-" + strId + ".aspx";
                    break;
                }

            case "all":
                {

                    strTitle = "ALL-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            case "ad":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "AD-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            case "searchdetails":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "searchdetails-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            default:
                {
                    //strTitle = "~/" + DirectoryName + "/" + strTitle + "-" + strId + ".aspx";
                    strTitle = DirectoryName + "-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
        }

        return strTitle;
    }





    public string GenerateCatURL(object DirectoryName, object Title, object strId, object catName, object catId)
    {
        string strTitle = Title.ToString();
        string strDirectoryName = DirectoryName.ToString();

        #region Generate SEO Friendly URL based on Title
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();
        strDirectoryName = strDirectoryName.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');
        strDirectoryName = strDirectoryName.Trim('-');

        strTitle = strTitle.ToLower();
        strDirectoryName = strDirectoryName.ToLower();

        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");

        strDirectoryName = strDirectoryName.Replace("c#", "C-Sharp");
        strDirectoryName = strDirectoryName.Replace("vb.net", "VB-Net");
        strDirectoryName = strDirectoryName.Replace("asp.net", "Asp-Net");

        //Replace . with - hyphen
        strTitle = strTitle.Replace(".", "-");
        strDirectoryName = strDirectoryName.Replace(".", "-");

        //Replace Special-Characters
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();

            if (strDirectoryName.Contains(strChar))
            {
                strDirectoryName = strDirectoryName.Replace(strChar, string.Empty);
            }

            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }

        //Replace all spaces with one "-" hyphen
        strTitle = strTitle.Replace(" ", "-");
        strDirectoryName = strDirectoryName.Replace(" ", "-");

        //Replace multiple "-" hyphen with single "-" hyphen.
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");

        strDirectoryName = strDirectoryName.Replace("--", "-");
        strDirectoryName = strDirectoryName.Replace("---", "-");
        strDirectoryName = strDirectoryName.Replace("----", "-");
        strDirectoryName = strDirectoryName.Replace("-----", "-");
        strDirectoryName = strDirectoryName.Replace("----", "-");
        strDirectoryName = strDirectoryName.Replace("---", "-");
        strDirectoryName = strDirectoryName.Replace("--", "-");

        //Run the code again...
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();
        strDirectoryName = strDirectoryName.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');
        strDirectoryName = strDirectoryName.Trim('-');
        #endregion

        //////Append ID at the end of SEO Friendly URL
        ////strTitle = "news/" + strTitle + "-" + strId + ".aspx";

        switch (strDirectoryName)
        {
            //case "StaticDirectoryNameHereTODO":
            case "newsdetails":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "newsdetails-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            //case "categorydetails":
            //    {
            //        //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
            //        strTitle = "categorydetails-" + strTitle + "-" + strId + ".aspx";
            //        break;
            //    }
            case "cd":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "CD-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            //case "adslist":
            //    {
            //        strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
            //        strTitle = "adslist-" + strTitle + "-" + strId + ".aspx";
            //        break;
            //    }

            case "als":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "ALS-" + strTitle + "-" + strId + "-" + catName + "-" + catId + ".aspx";
                    break;
                }
            case "al":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "AL-" + strTitle + "-" + strId + ".aspx";
                    break;
                }

            case "all":
                {

                    strTitle = "ALL-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            case "ad":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "AD-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            case "searchdetails":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "searchdetails-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            default:
                {
                    //strTitle = "~/" + DirectoryName + "/" + strTitle + "-" + strId + ".aspx";
                    strTitle = DirectoryName + "-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
        }

        return strTitle;
    }


    public string MobileGenerateURL(object Title, object strId)
    {
        string strTitle = Title.ToString();

        #region Generate SEO Friendly URL based on Title
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');

        strTitle = strTitle.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");

        //Replace . with - hyphen
        strTitle = strTitle.Replace(".", "-");

        //Replace Special-Characters
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }

        //Replace all spaces with one "-" hyphen
        strTitle = strTitle.Replace(" ", "-");

        //Replace multiple "-" hyphen with single "-" hyphen.
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");

        //Run the code again...
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');
        #endregion

        //Append ID at the end of SEO Friendly URL
        strTitle = "news/" + strTitle + "-" + strId + ".aspx";

        return strTitle;
    }


    #region :: CODE BY ZAHID AH.NEAKA  CREATED DATE 27-OCT-2010


    public string GenerateURL(object DirectoryName, object Title, object strId,object varCat_IdOrSub_Id, object VarConst)
    {
        string strTitle = Title.ToString();
        string strDirectoryName = DirectoryName.ToString();

        #region Generate SEO Friendly URL based on Title
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();
        strDirectoryName = strDirectoryName.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');
        strDirectoryName = strDirectoryName.Trim('-');

        strTitle = strTitle.ToLower();
        strDirectoryName = strDirectoryName.ToLower();

        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");

        strDirectoryName = strDirectoryName.Replace("c#", "C-Sharp");
        strDirectoryName = strDirectoryName.Replace("vb.net", "VB-Net");
        strDirectoryName = strDirectoryName.Replace("asp.net", "Asp-Net");

        //Replace . with - hyphen
        strTitle = strTitle.Replace(".", "-");
        strDirectoryName = strDirectoryName.Replace(".", "-");

        //Replace Special-Characters
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();

            if (strDirectoryName.Contains(strChar))
            {
                strDirectoryName = strDirectoryName.Replace(strChar, string.Empty);
            }

            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }

        //Replace all spaces with one "-" hyphen
        strTitle = strTitle.Replace(" ", "-");
        strDirectoryName = strDirectoryName.Replace(" ", "-");

        //Replace multiple "-" hyphen with single "-" hyphen.
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");

        strDirectoryName = strDirectoryName.Replace("--", "-");
        strDirectoryName = strDirectoryName.Replace("---", "-");
        strDirectoryName = strDirectoryName.Replace("----", "-");
        strDirectoryName = strDirectoryName.Replace("-----", "-");
        strDirectoryName = strDirectoryName.Replace("----", "-");
        strDirectoryName = strDirectoryName.Replace("---", "-");
        strDirectoryName = strDirectoryName.Replace("--", "-");

        //Run the code again...
        //Trim Start and End Spaces.
        strTitle = strTitle.Trim();
        strDirectoryName = strDirectoryName.Trim();

        //Trim "-" Hyphen
        strTitle = strTitle.Trim('-');
        strDirectoryName = strDirectoryName.Trim('-');
        #endregion

        //////Append ID at the end of SEO Friendly URL
        ////strTitle = "news/" + strTitle + "-" + strId + ".aspx";

        switch (strDirectoryName)
        {
            //case "StaticDirectoryNameHereTODO":
            case "newsdetails":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "newsdetails-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            //case "categorydetails":
            //    {
            //        //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
            //        strTitle = "categorydetails-" + strTitle + "-" + strId + ".aspx";
            //        break;
            //    }
            case "cd":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "CD-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            case "al":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "AL-" + strTitle + "-" + strId + ".aspx";
                    break;
                }
            //case "adslist":
            //    {
            //        //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
            //        strTitle = "adslist-" + strTitle + "-" + strId + ".aspx";
            //        break;
            //    }
            


            case "ad":
                {
                    strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "AD-" + strTitle + "-" + strId + "-" + varCat_IdOrSub_Id + "-" + VarConst + ".aspx";
                    break;
                }
            case "ads":
                {
                    //strTitle = "~/newsdetails/" + strTitle + "-" + strId + ".aspx";
                    strTitle = "Ads-" + strTitle + "-" + strId + "-" + varCat_IdOrSub_Id + "-" + VarConst + ".aspx";
                    break;
                }

            default:
                {
                    //strTitle = "~/" + DirectoryName + "/" + strTitle + "-" + strId + ".aspx";
                    strTitle = DirectoryName + "/" + strTitle + "-" + strId + ".aspx";
                    break;
                }
        }

        return strTitle;
    }
    #endregion



}
