using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class DepartmentUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //    LoadOption();
        //LoadOption2();
       // }


    }
    private void LoadOption()
    {
        DataTable Department = new DataTable();
       
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
        conn.Open();
        SqlCommand cmd1 = new SqlCommand("Select * from Department where DeptName='" + ddldeptname.Text + "'", conn);
        SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
        adapter.Fill(Department);
      
            if (Department.Rows.Count > 0)
            {
                txtdeptcat.Text = Department.Rows[0][("DeptCategory")].ToString();
               // txtlocation.Text = Department.Rows[0]["ParentDeptId"].ToString();
                //ddldepartcategory.Items.Add(Department.Rows[0][("DeptCategory")].ToString());
                //ddllocation.Items.Add(Department.Rows[0][("ParentDeptId")].ToString());
                cbactive.Checked = Convert.ToBoolean(Convert.ToInt32(Department.Rows[0][("ActiveStatus")].ToString()));
            }
    }
    private void LoadOption2()
    {
        DataTable loc = new DataTable();
        SqlConnection connn = new SqlConnection();
        connn.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
        connn.Open();
        SqlCommand cmd2 = new SqlCommand("Select * from LocationHeader where LocationID='" + ddllocation.Text+"'",connn);
        SqlDataAdapter add = new SqlDataAdapter(cmd2);
        add.Fill(loc);
        if (loc.Rows.Count>0)
        {
            txtlocation.Text = loc.Rows[0]["LocationName"].ToString();
        }

    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (ddldepartcategory.SelectedValue == "Select")
        {
            Response.Write("<script>alert('Select Is Not an Valid Category Please Select correct Category.')</script>");
            ddldepartcategory.Focus();
        }
        else if (ddllocation.SelectedValue == "0")
        {
            Response.Write("<script>alert('Select Is Not an Valid location Please Select correct Location.')</script>");
            ddllocation.Focus();
        }
        else if(txtmoddept.Text=="")
        {
            Response.Write("<script>alert('Modified Department Is Required, Please Fill Required Information.')</script>");
            txtmoddept.Focus();
        }
        else
        {
            string allowas = cbactive.Checked ? "1" : "0";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Department SET DeptName='" + txtmoddept.Text + "',ActiveStatus='" + allowas + "',DeptCategory='"+ddldepartcategory.Text+ "',ParentDeptId='"+ddllocation.Text+"',ActionUserId='" + Session["UID"] + "',ActionMenucode='" + uri.Text + "',ActionDate='" + DateTime.Now + "' WHERE DeptName='" + ddldeptname.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            txtmoddept.Text = "";
            txtdeptcat.Text = "";
            txtlocation.Text = "";
            ddldepartcategory.SelectedIndex = -1;
            ddldeptname.SelectedIndex = -1;
            ddllocation.SelectedIndex = -1;
            Response.Write("<script>alert('Fill Data Updated Succesfully')  </script>");
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("DepartmentMaster.aspx");
    }

    protected void ddldeptname_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOption();
        LoadOption2();

    }
}