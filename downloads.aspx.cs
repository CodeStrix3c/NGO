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

public partial class downloads : System.Web.UI.Page
{
    protected iLayer obj;
    protected ReeLogic Utility;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        Utility = new ReeLogic();
        if (Request.QueryString["Id"] == "" || Request.QueryString["Id"] == null || Request.QueryString["cn"] == "" || Request.QueryString["cn"] == null)
        {
            if (!IsPostBack)
            {
                lblCName.Text = "Downloads";
                Bind_Grid();
                Bind_Links();
            }
        }
        else
        {
            if (!IsPostBack)
            {
                lblCName.Text = Request.QueryString["cn"];
                Bind_Links();
                Bind_GridByCatId();
            }
        }
    }
    protected void Bind_Links()
    {
        DataSet ds = obj.GetDownloadCategory();
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];
                ltrLinks.Text += " <li class=\"item-251 firstItem\"><a href='Downloads.aspx?Id=" + dr1["Id"].ToString() + "&cn=" + dr1["Title"].ToString() + "'>" + dr1["Title"].ToString() + "</a>";
            }
        }
    }
    protected void Bind_GridByCatId()
    {
        DataSet ds = obj.GetDownloadsByCatId_FE(Convert.ToInt32(Request.QueryString["Id"]));
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];
                ltrData.Text += "                <a class=\"jg_subcatelem_txt__link\" href='Upload/" + dr1["Url"].ToString() + "' target=\"_blank\">";
                ltrData.Text += "<article class=\"span3 item item_num0 item__module\" id='item_41' style='height:350px'>";
                ltrData.Text += "        <figure class=\"item_img img-intro img-intro__none\"> ";
                ltrData.Text += "                   <span class=\"lazy_container\" style=\"width: 252px;\">";
                ltrData.Text += "                     <span class=\"lazy_preloader\" style=\"padding-top: 76.507936507937%;\"></span>";

                ltrData.Text += "                    <img src='Upload/" + dr1["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr1["ImageUrl"].ToString() + "' alt=\"\">";
                ltrData.Text += "                </span>";
                ltrData.Text += "           </figure>";
                ltrData.Text += "   <div class=\"item_content\">";
                ltrData.Text += "       <h4 class=\"item_title item_title__\">";
                ltrData.Text += "       <span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\"> " + dr1["Title"].ToString() + " </span></h4>";
                ltrData.Text += "  </div>";
                ltrData.Text += " <div class=\"clearfix\"></div>  ";
                ltrData.Text += "</article></a>";
            }
        }


    }
    protected void Bind_Grid()
    {
        DataSet ds = obj.GetDownloads_FEPage();
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr1;
            int i = 0;
            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr1 = ds.Tables[0].Rows[i];
                ltrData.Text += "                <a class=\"jg_subcatelem_txt__link\" href='Upload/" + dr1["Url"].ToString() + "' target=\"_blank\">";
                ltrData.Text += "<article class=\"span3 item item_num0 item__module\" id='item_41' style='height:350px'>";
                ltrData.Text += "        <figure class=\"item_img img-intro img-intro__none\"> ";
                ltrData.Text += "                   <span class=\"lazy_container\" style=\"width: 252px;\">";
                ltrData.Text += "                     <span class=\"lazy_preloader\" style=\"padding-top: 76.507936507937%;\"></span>";

                ltrData.Text += "                    <img src='Upload/" + dr1["ImageUrl"].ToString() + "' class=\"lazy\" data-src='Upload/" + dr1["ImageUrl"].ToString() + "' alt=\"\">";
                ltrData.Text += "                </span>";
                ltrData.Text += "           </figure>";
                ltrData.Text += "   <div class=\"item_content\">";
                ltrData.Text += "       <h4 class=\"item_title item_title__\">";
                ltrData.Text += "       <span class=\"item_title_part0 item_title_part_odd item_title_part_first_half item_title_part_first\"> " + dr1["Title"].ToString() + " </span></h4>";
                ltrData.Text += "  </div>";
                ltrData.Text += " <div class=\"clearfix\"></div>  ";
                ltrData.Text += "</article></a>";
            }
        }


    }

    public string getPhotos(object varPhoto)
    {
        string varphotos = varPhoto.ToString();
        string varReturn;
        if (varphotos.ToString().EndsWith("PDF"))
        {
            varReturn = "Images/pdficon.png";
        }
        else if (varphotos.ToString().EndsWith("pdf"))
        {
            varReturn = "Images/pdficon.png";
        }
        else
        {
            varReturn = "";
        }
        return varReturn;
    }
    public string FileURL(object varfileUrl)
    {
        return "Upload/" + varfileUrl.ToString();
    }
}