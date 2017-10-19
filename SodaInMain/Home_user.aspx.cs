using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home_user : System.Web.UI.Page
{
    protected void fbIcon_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("https://www.facebook.com/");

    }
    protected void GIcon_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("https://www.google.com.ph");

    }
}