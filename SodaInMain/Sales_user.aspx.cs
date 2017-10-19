using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Sales_user : System.Web.UI.Page
{
    string connection = "Data Source=GREECE\\SQLEXPRESS;Initial Catalog=login_page;Integrated Security=True";
    Double am = 0;
    List<item> itm = new List<item>();
    // static List<item> itms1 = new List<item>();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            TextBox ndate = (TextBox)GridView2.FindControl("date");
            //string year = DateTime.Now.Year.ToString();
            //string month = DateTime.Now.Month.ToString();
            //string day = DateTime.Now.Day.ToString();

            //ndate.Text = DateTime.Today.ToString("yyyy/MM/dd");

            grid();
            bindgrid();

            //string query = "select TransactionNumber=Count(transactionnumber) from Sales_Report";
            //SqlConnection con = new SqlConnection(connection);
            //con.Open();
            //SqlCommand cmd = new SqlCommand(query, con);
            //string cid = cmd.ExecuteScalar().ToString();
            //con.Close();
            //TextBox4.Text = "TN00" + (int.Parse(cid) + 1);
            //TextBox4.ReadOnly = true;
        }

    }
    SqlConnection con = new SqlConnection(@"data source=GREECE\SQLEXPRESS;initial Catalog=login_page;integrated security=True");

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void chkselect_CheckedChanged(object sender, EventArgs e)
    {
        selectrow();

        bindgrid();
    }
    protected void grid()
    {
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("select ProductID,ProductName,Price,Stock from tblStocks", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();

        con.Close();

    }

    protected void bindgrid()
    {
        DataTable dt = (DataTable)ViewState["GetRecords"];
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    private DataTable createTable()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ProductID");
        dt.Columns.Add("ProductName");
        dt.Columns.Add("Price");
        dt.Columns.Add("Stock");
        dt.AcceptChanges();
        return dt;
    }
    private DataTable addrow(GridViewRow gvrow, DataTable dt)
    {
        DataRow[] dr = dt.Select("ProductID='" + gvrow.Cells[1].Text + "'");
        if (dr.Length <= 0)
        {
            dt.Rows.Add();
            int rowscount = dt.Rows.Count - 1;
            dt.Rows[rowscount]["ProductID"] = gvrow.Cells[1].Text;
            dt.Rows[rowscount]["ProductName"] = gvrow.Cells[2].Text;
            dt.Rows[rowscount]["Price"] = gvrow.Cells[3].Text;
            dt.Rows[rowscount]["Stock"] = gvrow.Cells[4].Text;
            dt.AcceptChanges();
        }
        return dt;
    }
    public DataTable remove(GridViewRow gvrow, DataTable dt)
    {
        DataRow[] dr = dt.Select("ProductID='" + gvrow.Cells[1].Text + "'");
        if (dr.Length > 0)
        {
            dt.Rows.Remove(dr[0]);
            dt.AcceptChanges();
        }
        return dt;
    }
    private void selectrow()
    {

        DataTable dt;
        if (ViewState["GetRecords"] != null)
        {
            dt = (DataTable)ViewState["GetRecords"];
        }

        else
            dt = createTable();
        {


            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("chkselect");
                if (chk.Checked)
                {
                    item.amount = 0;
                    dt = addrow(GridView1.Rows[i], dt);

                }
                else
                {
                    dt = remove(GridView1.Rows[i], dt);
                }
            }
            ViewState["GetRecords"] = dt;
        }
    }

    public void gridv2()
    {
        for (int j = 0; j < GridView2.Rows.Count; j++)
        {
            item.ptname = ((TextBox)GridView2.Rows[j].FindControl("TextBox5")).Text;
            StreamWriter writer = new StreamWriter(@"C:\Users\Grace Arda\Desktop\greece.txt");
            writer.WriteLine(item.ptname.ToString());
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox stocks = (TextBox)GridView2.Rows[((sender as TextBox).NamingContainer as GridViewRow).RowIndex].Cells[3].FindControl("TextBox6");
        TextBox names = (TextBox)GridView2.Rows[((sender as TextBox).NamingContainer as GridViewRow).RowIndex].Cells[1].FindControl("TextBox5");
        TextBox quantity = (TextBox)GridView2.Rows[((sender as TextBox).NamingContainer as GridViewRow).RowIndex].Cells[4].FindControl("TextBox1");
        TextBox price = (TextBox)GridView2.Rows[((sender as TextBox).NamingContainer as GridViewRow).RowIndex].Cells[2].FindControl("TextBox3");
        TextBox total = (TextBox)GridView2.Rows[((sender as TextBox).NamingContainer as GridViewRow).RowIndex].Cells[5].FindControl("TextBox2");

        total.Text = (Int32.Parse(price.Text) * (Int32.Parse(quantity.Text))).ToString();
        item.amount += ((Int32.Parse(price.Text) * (Int32.Parse(quantity.Text))));


        item.minus = Convert.ToInt32((stocks.Text = (Int32.Parse(stocks.Text) - (Int32.Parse(quantity.Text))).ToString()));
        tot.Text = item.minus.ToString();

        item.ptname = names.Text;
        item.prices = Convert.ToDouble(price.Text);
        item.quan = Convert.ToDouble(quantity.Text);
        Label gtotal = (Label)GridView2.FooterRow.FindControl("Label3");
        gtotal.Text = item.amount.ToString();
        item.oltotal = Convert.ToDouble(total.Text);

        //StreamWriter writer = new StreamWriter(@"‪C:\Users\Grace Arda\Desktop\save.txt");
        //writer.WriteLine(item.ptname);
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }


    public double SumTotal()
    {

        //List<item> itm=new List<item>();
        item item1 = new item();
        item1.Price = ((TextBox)GridView2.FindControl("TextBox3")).Text;//price
        item1.Quantity = ((TextBox)GridView2.FindControl("TextBox1")).Text;//quantity
        item1.Total = ((TextBox)GridView2.FindControl("TextBox2")).Text;//total
        //item1.Pname = ((Label)GridView2.FindControl("Label1")).Text;//productname
        item1.Tot = ((Label)GridView2.FooterRow.FindControl("Label3")).Text;
        itm.Add(item1);
        Double Amount = 0;

        for (int x = 0; x < itm.Count; x++)
        {


            double a = Convert.ToDouble(itm[x].Total);
            double b = Convert.ToDouble(itm[x].Tot);
            Amount += (a * b);


        }

        return Amount;


    }


    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", "Customer.doc"));
        Response.ContentType = "application/ms-word";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        GridView2.AllowPaging = false;
        grid();
        GridView2.HeaderRow.Style.Add("background-color", "#ffffff");
        for (int x = 0; x < GridView2.HeaderRow.Cells.Count; x++)
        {
            GridView2.HeaderRow.Cells[x].Style.Add("background-color", "#ffffff");
        }
        GridView2.RenderControl(hw);
        Response.Write(sw.ToString());
        Response.End();

        //SqlConnection con = new SqlConnection(connection);
        //SqlCommand cmd;
        //con.Open();
        //string query = "insert into Sales_Report (Date,TransactionNumber,ProductName,Price,Quantity,Total) values ('" + date.Text + "','" + TextBox4.Text + "','" + item.ptname.ToString() + "','" + item.prices.ToString() + "','" + item.quan.ToString() + "','" + item.oltotal.ToString() + "')";
        //cmd = new SqlCommand(query, con);
        //cmd.ExecuteNonQuery();
        //errorlbl.Text = "added!";
        //con.Close();
        int quan = Convert.ToInt32((TextBox)GridView2.FindControl("TextBox1"));
        TextBox id = (TextBox)GridView2.FindControl("id");
        //TextBox stocks = (TextBox)GridView2.FindControl("TextBox6");
        // int a = Convert.ToInt32(quan.Text);
        //int b = Convert.ToInt32(stocks.Text);
        //  tot.Text = (stocks - quan).ToString();
        SqlConnection con = new SqlConnection(connection);

        con.Open();
        SqlCommand cmd;

        string query = "update tblStocks set Stock = Stock - @quan where ProductID = @ID";
        cmd = new SqlCommand(query, con);
        //cmd.Parameters.AddWithValue("@ID", id.Text);
        cmd.Parameters.AddWithValue("@quan", quan.ToString());
        cmd.Parameters.AddWithValue("@ID", (GridView2.FindControl("id") as TextBox).Text.Trim());
        //cmd.Parameters.Add("@quan", SqlDbType.Int);
        //cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value=name;
        //cmd.ExecuteReader();
        cmd.ExecuteNonQuery();
        errorlbl.Text = "updated!";

        //updatestocks();


        Response.Redirect("~/sales2.aspx");
        con.Close();
    }
    //private void updatestocks()
    //{
    //    foreach (GridViewRow gvr in GridView2.Rows)
    //    {
    //        if (((TextBox)gvr.FindControl("TextBox1")).Text != "") 
    //        {
    //           string name = gvr.Cells[1].Text;
    //           int quan = Convert.ToInt32(((TextBox)gvr.FindControl("TextBox1")).Text);
    //           SqlConnection con = new SqlConnection(connection);
    //           SqlCommand cmd = new SqlCommand();
    //           cmd.Connection = con;
    //           con.Open();

    //           string query = "update tblStocks set Quantity = Quantity - @quan where ProductName = @name";
    //           cmd.CommandText = query;
    //           cmd.Parameters.AddWithValue("@quan", quan);
    //           cmd.Parameters.AddWithValue("@name", name);
    //        }

    //    }
    //}
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (true)
        {
            Response.Redirect("~/sales2.aspx");
        }
    }
}