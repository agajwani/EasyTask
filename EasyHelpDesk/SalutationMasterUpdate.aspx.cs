using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;

public partial class SalutationMasterUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (txtmodifiedsalutation.Text == "")
        {
            Response.Write("<script>alert('Please Fill The Required Information To Update')</script>");
        }
        else
        {
            string allowas = cbactive.Checked ? "1" : "0";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand("Update SalutationHeader SET SalutationName='" + txtmodifiedsalutation.Text + "',ActiveStatus='" + allowas + "',ActionDate='" + DateTime.Now + "',ActionMenucode = '" + uri.Text + "',ActionUSerId = '" + Session["TUID"] + "' WHERE SalutationName='" + ddlsalutation.Text + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            txtmodifiedsalutation.Text = "";
            ddlsalutation.SelectedIndex = -1;
            //DDLdesignation.SelectedIndex = -1;
            // txtmodify.Text = "";
            cbactive.Checked = false;
            Response.Write("<script>alert('Update Succesfully')</script>");
            con.Close();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("SalutaionMaster.aspx");
    }

    protected void ddlsalutation_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection();
        connection.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
        connection.Open();
        SqlCommand cmd = new SqlCommand("Select GenderCode,ActiveStatus from SalutationHeader where SalutationName='"+ddlsalutation.Text+"'",connection);
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable table = new DataTable();
        adapter.Fill(table);
        if(table.Rows.Count>0)
        {
            cbactive.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0]["ActiveStatus"].ToString()));
            ddlgender.Text = table.Rows[0]["GenderCode"].ToString();
        }
        connection.Close();
    }
}