using System.Collections;
using System.ComponentModel;
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
using System.Data.Odbc;
//author Arif Maqbool
//email:arifsahara@gmail.com
//contactno:0919018647898, 0919419897761
public class ArticlePhoto
{
    private int _id;
    private int _ArticleId;
    public int ImageId
    {
        get
        {
            return _id;
        }
    }
    public int ArticleId
    {
        get
        {
            return _ArticleId;
        }
    }
    public ArticlePhoto(int ImageId, int ArticleId)
    {
        _id = ImageId;
        _ArticleId = ArticleId;
       
    }
}
