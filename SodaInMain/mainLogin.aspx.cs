using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int rowcount;
        string user, pass;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());

        con.Open();
        string query = "select * from tblRoles" ;
            
        
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd.CommandText,con);



        DataTable dt = new DataTable();
        da.Fill(dt);
        rowcount = dt.Rows.Count;

        

        for (int i = 0; i < rowcount; i++)
        {
            user = dt.Rows[i]["name"].ToString();
            pass = dt.Rows[i]["pass"].ToString();

            if (user==TextUser.Text && pass==TextPass.Text)
            {
                Session["name"] = user;
                if (dt.Rows[i]["userType"].ToString() == "A")
                {
                    Response.Redirect("~/SodaInMain.aspx");
                }

                else if (dt.Rows[i]["userType"].ToString() == "B")

                {
                    Response.Redirect("~/Home_user.aspx");
                }

                else {
                   

                }

                
            }
            else if (user!=TextUser.Text && pass!=TextPass.Text)
            {
                TextUser.Text = string.Empty;
                Panel1.Visible = true;
                Label1.Visible = true;
                
            }

        }

     
    }
}