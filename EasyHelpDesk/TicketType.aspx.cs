using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace test1
{
    public partial class TicketType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            Response.Redirect("TicketTypeUpdate.aspx");
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            if (txttype.Text == "")
            {
                Response.Write("<script>alert('Please Fill The Required Information')</script>");
            }
            else
            {
                SqlConnection conncection = new SqlConnection();
                conncection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                conncection.Open();
                SqlCommand cmd = new SqlCommand("Insert into TickettypeHeader (Tcktyp,ActionUserId,ActionMenuCode,ActionDate,documentdate) values('" + txttype.Text + "','" + Session["TUID"].ToString() + "','" + uri.Text + "','" + System.DateTime.Now + "','" + DateTime.Now + "')", conncection);
                cmd.ExecuteNonQuery();
                conncection.Close();
                txttype.Text = "";
            }
        }
    }
}