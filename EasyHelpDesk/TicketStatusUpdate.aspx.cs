using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace test1
{
    public partial class TicketStatusUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("TicketStatus.aspx");
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string active = cbactive.Checked ? "1" : "0";
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            if (txtmodstatus.Text == "")
            {
                SqlCommand cmdact = new SqlCommand("Update TicketStatusHeader Set Activestatus='" + active + "',Actionuserid='" + Session["TUID"].ToString() + "',actiondate='" + System.DateTime.Now + "',actionmenucode='" + uri.Text + "' where tckstatus = '" + ddlstatus.Text + "'", connection);
                cmdact.ExecuteNonQuery();
                Response.Write("<script>alert('Update Successful')</script>");
                Response.Redirect("TicketStatusUpdate.aspx");
            }
            
            else
            {
                SqlCommand cmd = new SqlCommand("Update TicketStatusHeader Set TckStatus='" + txtmodstatus.Text + "',Actionuserid='" + Session["TUID"].ToString() + "',actiondate='" + System.DateTime.Now + "',actionmenucode='" + uri.Text + "',Activestatus='" + active + "' where tckstatus = '" + ddlstatus.Text + "'", connection);
                if (txtmodstatus.Text != "")
                {
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    txtmodstatus.Text = "";
                    ddlstatus.SelectedIndex = -1;
                    Response.Write("<script>alert('Update Successful')</script>");
                    Response.Redirect("TicketStatusUpdate.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Please Fill Required Information to Update')");
                }
                connection.Close();
            }
        
        }

        protected void ddlstatus_TextChanged(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select Activestatus from TicketStatusHeader where Tckstatus= '" + ddlstatus.Text + "'",connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if(table.Rows.Count>0)
            {
                cbactive.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0]["Activestatus"].ToString()));
            }
            connection.Close();
        }
    }
}