using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Data;

public partial class DesignationMasterUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("DesignationMaster.aspx");
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string allowas = cbactive.Checked ? "1" : "0";
        if (txtmodify.Text == "")
        {
            Response.Write("<script>alert('Please Fill all Required Information.')</script>");
            txtmodify.Focus();
        }
        else
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Designation SET DesignationName='" + txtmodify.Text + "',ActiveStatus='" + allowas + "',ActionDate='" + DateTime.Now + "',ActionMenucode='" + uri.Text + "',ActionUserId='" + Session["uid"] + "' where DesignationName='" + DDLdesignation.Text + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            DDLdesignation.SelectedIndex = -1;
            txtmodify.Text = "";
            cbactive.Checked = false;
            Response.Write("<script>alert('Fill Updated Succesfully')</script>");
        }
    }

    protected void DDLdesignation_TextChanged(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
        connection.Open();
        SqlCommand cmdr = new SqlCommand("Select Activestatus from Designation where DesignationName ='" + DDLdesignation.Text + "'",connection);
        SqlDataAdapter adapter = new SqlDataAdapter(cmdr);
        DataTable table = new DataTable();
        adapter.Fill(table);
        if(table.Rows.Count>0)
        {
            cbactive.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0]["Activestatus"].ToString()));
        }
       
    }
}