using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace test1
{
    public partial class LocationMasterUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlloc_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select LocationCatg,ActiveStatus from LocationHeader where LocationID='" + ddlloc.Text + "'",connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if(table.Rows.Count>0)
            {
                txtpercat.Text = table.Rows[0]["LocationCatg"].ToString();
                cbactive.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0]["ActiveStatus"].ToString()));
            }
            connection.Close();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LocationMaster.aspx");
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
            connection.Open();
            string cblc = cbactive.Checked ? "1" : "0";
            if (txtmodloc.Text == "")
            {
                Response.Write("<script>alert('Please Fill The Required Information')</script>");
                txtmodloc.Focus();
            }
            else
            {
                SqlCommand ucmd = new SqlCommand("Update LocationHeader set LocationName = '" + txtmodloc.Text + "',LocationCatg='" + txtpercat.Text + "',ActionUserId ='" + Session["TUID"] + "',ActionMenucode='" + uri.Text + "',ActionDate='" + DateTime.Now + "',ActiveStatus='" + cblc + "'where LocationID='" + ddlloc.Text + "'", connection);
                ucmd.ExecuteNonQuery();
                txtmodloc.Text = "";
                txtpercat.Text = "";
                cbactive.Checked = false;
            }
            connection.Close();
        }
    }
}