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

public partial class Control_News : System.Web.UI.UserControl
{
    protected iLayer obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new iLayer();
        if (!IsPostBack)
        {
            Bind_Controls();
        }
    }
    private void Bind_Controls()
    {

        DataSet ds = obj.GetTopTenNews();
        rptNews.DataSource = ds;
        rptNews.DataBind();
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
}
