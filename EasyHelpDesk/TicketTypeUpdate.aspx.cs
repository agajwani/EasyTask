using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;

namespace test1
{
    public partial class TicketTypeUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("tickettype.aspx");
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string active = cbactive.Checked ? "1" : "0";
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            if(txtmodtype.Text=="")
            {
                SqlCommand cbcmd = new SqlCommand("Update TickettypeHeader set activestatus = '" + active + "',Actionuserid = '" + Session["TUID"].ToString() + "',Actionmenucode='" + uri.Text + "',Actiondate='" + System.DateTime.Now + "' where Tcktyp='"+ddltype.Text+"'", connection);
                cbcmd.ExecuteNonQuery();
                Response.Write("<script>alert('Update Successfull')</script>");
                Response.Redirect("Tickettypeupdate.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Update TickettypeHeader Set Tcktyp='" + txtmodtype.Text + "', activestatus = '" + active + "',Actionuserid = '" + Session["TUID"].ToString() + "',Actionmenucode='" + uri.Text + "',Actiondate='" + System.DateTime.Now + "' where Tcktyp='" + ddltype.Text + "'", connection);
                if(txtmodtype.Text != "")
                {
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Update Successfull')</script>");
                    Response.Redirect("Tickettypeupdate.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Fill the required information to update')</script>");
                }
                connection.Close();
            }
        }

        protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ToString();
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select Activestatus from TickettypeHeader where tcktyp = '" + ddltype.Text + "'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if(table.Rows.Count>0)
            {
                cbactive.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0]["Activestatus"].ToString()));
            }
        }
    }
}