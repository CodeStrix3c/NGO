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

/// <summary>
/// Summary description for AlbumPhotos
/// </summary>
public class AlbumPhotos
{
    private int _albumID;
    private int _photoID;
    private string _caption;
    private string _bytesPoster;
    private string _bytesThumb;
    //private bool _isActive;

    
    public int AlbumID { get { return _albumID; } }
    public int PhotoID { get { return _photoID; } }
    public string Caption { get { return _caption; } }
    public string BytesPoster { get { return _bytesPoster; } }
    public string BytesThumb { get { return _bytesThumb; } }
  //  public bool IsActive { get { return _isActive; } }

    public AlbumPhotos(int id,int photoID, string caption, string bytesposter,string bytesthumb)
    {

        _albumID = id;
        _photoID = photoID;
        _caption = caption;
        _bytesPoster = bytesposter;
        _bytesThumb = bytesthumb;
        //_isActive = isActive;
    }
   
}
