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

public class Album
{

    private int _id;
    private int _count;
    private string _caption;
    private bool _ispublic;
    private string _category;
    private string _BytesThumb;
    public string Category 
    {
        get { return _category; } 
    }

    public int AlbumID { get { return _id; } }
    public int Count { get { return _count; } }
    public string Caption { get { return _caption; } }
    public string BytesThumb { get { return _BytesThumb; } }
    public bool IsPublic { get { return _ispublic; } }

    public Album(int id, int count, string caption, string BytesThumb, bool ispublic)
    {
        _id = id;
        _count = count;
        _caption = caption;
        _BytesThumb = BytesThumb;
        _ispublic = ispublic;
    }
    public Album(int id, int count, string caption, string Category, string BytesThumb, bool ispublic)
    {
        _id = id;
        _count = count;
        _caption = caption;
        _BytesThumb = BytesThumb;
        _ispublic = ispublic;
        _category = Category;
    }

}
