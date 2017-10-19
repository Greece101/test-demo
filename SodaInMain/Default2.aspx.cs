using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Default2 : System.Web.UI.Page
{
    
    SqlDataReader rd;
    string connstring = @"Data Source=GREECE\SQLEXPRESS;Initial Catalog=login_page;Integrated Security=True";
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            popdgv();

            string query = "select ProductID=Count(productid) from tblStocks";
            SqlConnection con = new SqlConnection(connstring);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            string cid = cmd.ExecuteScalar().ToString();
            con.Close();
            GridViewRow gr = dgv1.FooterRow;
            TextBox txtgenid = (TextBox)gr.FindControl("txtpidfooter");
            txtgenid.Text = "020000" + (int.Parse(cid) + 1);
            txtgenid.ReadOnly = true;
            
        }
    }
    void popdgv()
    {
         dt = new DataTable();
        using (SqlConnection con = new SqlConnection(connstring))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * from tblStocks", con);
            da.Fill(dt);
            dgv1.DataSource = dt;
            con.Close();

        }
        if (dt.Rows.Count > 0)
        {
          //  GenID();
            dgv1.DataSource = dt;
            dgv1.DataBind();
        }
        else
        {
            dt.Rows.Add(dt.NewRow());
            dgv1.DataSource = dt;
            dgv1.DataBind();
            dgv1.Rows[0].Cells.Clear();
            dgv1.Rows[0].Cells.Add(new TableCell());
            dgv1.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
            dgv1.Rows[0].Cells[0].Text = "No data";
            dgv1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }
        
    }
    SqlCommand cmd;
    protected void dgv1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Add"))
            {


                using (SqlConnection con = new SqlConnection(connstring))
                {

                    con.Open();
                    TextBox txt1 = (TextBox)dgv1.FooterRow.FindControl("txtpnamefooter");
                    TextBox txt2 = (TextBox)dgv1.FooterRow.FindControl("txtptypefooter");
                    TextBox txt3 = (TextBox)dgv1.FooterRow.FindControl("txtpricefooter");
                    TextBox txt4 = (TextBox)dgv1.FooterRow.FindControl("txtstocksfooter");
                    if (txt1.Text == String.Empty || txt2.Text == String.Empty || txt3.Text == String.Empty || txt4.Text == String.Empty)
                    {
                        error.Text = "Please fill up the needed informations";
                    }
                    else
                    {
                        string query = "INSERT INTO tblStocks (ProductID,ProductName,ProductType,Price,Stock) values (@ProductID,@ProductName,@ProductType,@Price,@Stock)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@ProductID", (dgv1.FooterRow.FindControl("txtpidfooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@ProductName", (dgv1.FooterRow.FindControl("txtpnamefooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@ProductType", (dgv1.FooterRow.FindControl("txtptypefooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@Price", (dgv1.FooterRow.FindControl("txtpricefooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@Stock", (dgv1.FooterRow.FindControl("txtstocksfooter") as TextBox).Text.Trim());
                        cmd.ExecuteNonQuery();
                        popdgv();
                        success.Text = "new data added";
                        error.Text = "";
                        Response.Redirect("~/Default2.aspx");
                        con.Close();
                    }
                }
            }
            
        }
        catch (Exception ex)
        {
            error.Text = ex.Message;

        }
    }
   
    protected void dgv1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        dgv1.EditIndex = e.NewEditIndex;
        popdgv();
       
    }
    protected void dgv1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        dgv1.EditIndex = -1;
        popdgv();
    }
    protected void dgv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
        
                using (SqlConnection con = new SqlConnection(connstring))
                {
                    con.Open();
                    string query = "UPDATE tblStocks set ProductID=@ProductID,ProductName=@ProductName,ProductType=@ProductType,Price=@Price,Stock=@Stock  where ProductID = @ID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ProductID", (dgv1.Rows[e.RowIndex].FindControl("txtpid") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductName", (dgv1.Rows[e.RowIndex].FindControl("txtpname") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductType", (dgv1.Rows[e.RowIndex].FindControl("txtptype") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", (dgv1.Rows[e.RowIndex].FindControl("txtprice") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Stock", (dgv1.Rows[e.RowIndex].FindControl("txtstocks") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(dgv1.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    dgv1.EditIndex = -1;
                    popdgv();
                    success.Text = "data updated";
                    error.Text = "";
                    con.Close();
                }

        }
        catch (Exception ex)
        {
            error.Text = ex.Message;

        }
    }
    protected void dgv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {

        using (SqlConnection con = new SqlConnection(connstring))
        {
            con.Open();
            string query = "DELETE FROM tblStocks  where ProductID = @ID";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(dgv1.DataKeys[e.RowIndex].Value.ToString()));
            cmd.ExecuteNonQuery();
            popdgv();
            success.Text = "data deleted";
            error.Text = "";
            con.Close();
        }

        }
        catch (Exception ex)
        {
            error.Text = ex.Message;

        }
    }

    protected void txtpnamefooter_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connstring);
        con.Open();
     string query = "select ProductName from tblStocks";
        cmd = new SqlCommand(query, con);       
        rd = cmd.ExecuteReader();
        TextBox pname = (TextBox)dgv1.FooterRow.FindControl("txtpnamefooter");
        while(rd.Read())
        {
         

            if(rd["ProductName"].ToString() ==  pname.Text.ToString())
            {
                
                error.Text = "Already Exists";
                pname.Text = "";
                break;
               
            }
          
        }
        con.Close();
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default2.aspx");
    }
    protected void dgv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        dgv1.PageIndex = e.NewPageIndex;
        popdgv();
    }
    protected void txtptypefooter_TextChanged(object sender, EventArgs e)
    {

    }
}