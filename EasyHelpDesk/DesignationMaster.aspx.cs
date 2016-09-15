using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.IO;

public partial class DesignationMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtdesination.Text=="")
            {
                Response.Write("<script>alert('Fill required Information')</script>");
                txtdesination.Focus();
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString=ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
                con.Open();
                //Response.Write("<script>alert('Designation Sussesfully added')</script>");
                SqlCommand cmd = new SqlCommand("INSERT into Designation (DesignationName,ActionMenucode,ActionDate,DocumentDate,ActionUserId)values ('" + txtdesination.Text+"','"+Designation.Text+"','"+System.DateTime.Now+"','"+System.DateTime.Now+"','"+Session["TUID"]+"')",con);
                cmd.ExecuteNonQuery();
                con.Close();
                txtdesination.Text = "";
                Response.Write("<script>alert('Designation Sussesfully added')</script>");
                txtdesination.Focus();
                con.Close();
            }
        }
        catch (Exception)
        {
            //MessageBox.Show(ex.Message, "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            throw;
        }
    }

    protected void btnclear_Click(object sender, EventArgs e)
    {
        Response.Redirect("Masters.aspx");
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
        Response.Redirect("DesignationMasterUpdate.aspx");
    }
}