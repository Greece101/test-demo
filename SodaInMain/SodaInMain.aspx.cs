using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.IO;
using System.Collections;
public partial class SodaInMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void fbIcon_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("https://www.facebook.com/");

    }
    protected void GIcon_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("https://www.google.com.ph");

    }
}