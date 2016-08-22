using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace test1
{
    public partial class TicketStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            if (txtstatus.Text == "")
            {
                Response.Write("<script>alert('Please Fill All Required Information')</script>)");
                txtstatus.Focus();
            }
            else
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                SqlCommand cmd = new SqlCommand("insert into TicketStatusHeader(Tckstatus,ActionUserId,ActionMenuCode,ActionDate,documentdate) values ('" + txtstatus.Text + "','" + Session["UID"].ToString() + "','" + uri.Text + "','" + DateTime.Now + "','" + DateTime.Now + "')", connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                txtstatus.Text = "";
            }
        }
        protected void btnedit_Click(object sender, EventArgs e)
        {
            Response.Redirect("TicketStatusUpdate.aspx");
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }
    }
}