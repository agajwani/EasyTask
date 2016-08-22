using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DepartmentMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Masters.aspx");
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtdepartment.Text=="")
            {
                Response.Write("<script>alert('Fill required Information')</script>");
                txtdepartment.Focus();
            }
            else
            {

               SqlConnection con = new SqlConnection();
               con.ConnectionString= ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
               con.Open();
               
                SqlCommand cmd = new SqlCommand("insert into Department (DeptName,DeptCategory,ParentDeptId,ActionMenucode,ActionDate,DocumentDate,ActionUserId) VALUES ('" + txtdepartment.Text + "','" + ddldepartcategory.Text + "','"+ddllocation.Text +"','" + Department.Text + "','" + System.DateTime.Now + "','" + System.DateTime.Now + "','"+Session["Uid"]+"')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                txtdepartment.Text = "";
                ddldepartcategory.SelectedIndex = -1;
                ddllocation.SelectedIndex = -1;
                Response.Write("<script>alert('Details added successfully')</script>");
            }

        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
        Response.Redirect("DepartmentUpdate.aspx");
    }
}