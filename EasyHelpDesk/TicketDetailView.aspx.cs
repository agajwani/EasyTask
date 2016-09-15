using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Configuration;

namespace EasyHelpDesk
{
    public partial class TicketDetailView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            //SqlCommand cmd = new SqlCommand("Select * from ticketdetails where ticketnumber ='"+id+"'",connection);
            SqlCommand cmd = new SqlCommand("select td.ticketnumber as [TicketNo],CONVERT(datetime, td.Ticketdate, 112) as [Date],td.TicketType As[Request Type], td.TicketSubject as [Subject],td.TicketReqInfo as [Request],lh.locationname as [Location],slh.SubLocName as [SubLocation Name],td.tckdept as [Department], td.Tckuserid as [Requestuid], td.ContactNo as [ContactNo], td.tckstatus as [Status] from ticketdetails td inner join locationheader lh on lh.LocationID = td.Tcklocation inner Join SubLocationHeader slh on slh.SubLocId = td.Subloactionid where ticketnumber = '" + id + "'", connection); 
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if(table.Rows.Count>0)
            {
                txtTckno.Text = table.Rows[0]["TicketNo"].ToString();
                txtsub.Text = table.Rows[0]["Subject"].ToString();
                txtreqname.Text = table.Rows[0]["Requestuid"].ToString();
                txtTckdate.Text = table.Rows[0]["Date"].ToString();
                TxtreqDtl.Text = table.Rows[0]["Request"].ToString();
                ddldept.Items.Add(table.Rows[0]["Department"].ToString());
                ddlloc.Items.Add(table.Rows[0]["location"].ToString());
                ddltype.Items.Add(table.Rows[0]["Request Type"].ToString());
                ddlsubloc.Items.Add(table.Rows[0]["SubLocation Name"].ToString());
            }
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ticketdetails.aspx");
        }

        protected void cbser_CheckedChanged(object sender, EventArgs e)
        {
            if (cbser.Checked == true)
            {
                cbinc.Checked = false;
                cbprb.Checked = false;
            }
        }

        protected void cbinc_CheckedChanged(object sender, EventArgs e)
        {
            if (cbinc.Checked == true)
            {
                cbprb.Checked = false;
                cbser.Checked = false;
            }
        }

        protected void cbprb_CheckedChanged(object sender, EventArgs e)
        {
            if (cbprb.Checked == true)
            {
                cbinc.Checked = false;
                cbser.Checked = false;
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            {
                
                { 
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("InsTicketReq", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Tckreqno", txtTckno.Text);
                    cmd.Parameters.AddWithValue("@tckgendate", txtTckdate.Text);
                    cmd.Parameters.AddWithValue("@tckreqtype", ddltype.Text);
                    cmd.Parameters.AddWithValue("@tckrequser", txtreqname.Text);
                    cmd.Parameters.AddWithValue("@tckreqloc", ddlloc.Text);
                    cmd.Parameters.AddWithValue("@tckreqdept", ddldept.Text);
                    cmd.Parameters.AddWithValue("@tckasntec", ddltech.Text);
                    cmd.Parameters.AddWithValue("@tckreqsub", txtsub.Text);
                    cmd.Parameters.AddWithValue("@tckreqinfo", TxtreqDtl.Text);
                    cmd.Parameters.AddWithValue("@subloc", ddlsubloc.Text);
                    if (cbser.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@tcktype", cbser.Text);
                    }
                    else if (cbprb.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@tcktype", cbprb.Text);
                    }
                    else if (cbinc.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@tcktype", cbinc.Text);
                    }
                    cmd.Parameters.AddWithValue("@tckstatus", ddlstatus.Text);
                    cmd.Parameters.AddWithValue("@reqpriority", ddlpri.Text);
                    cmd.Parameters.AddWithValue("@reqnotes", txtnotes.Text);
                    cmd.Parameters.AddWithValue("@ackmenu", uri.Text);
                    cmd.ExecuteNonQuery();
                    SqlCommand tckucmd = new SqlCommand("Update ticketdetails set tckstatus = '" + ddlstatus.Text + "' where TicketNumber ='" + txtTckno.Text + "'", connection);
                    tckucmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
            {
                Response.Write("<script>alert('Ticket Assigned to user " + ddltech.Text + " Susscessfully')</script>");
            }
            {
                txtnotes.Text = "";
                TxtreqDtl.Text = "";
                txtreqname.Text = "";
                txtsub.Text = "";
                txtTckdate.Text = "";
                txtTckno.Text = "";
                ddldept.SelectedIndex = -1;
                ddlloc.SelectedIndex = -1;
                ddlpri.SelectedIndex = -1;
                ddlstatus.SelectedIndex = -1;
                ddltech.SelectedIndex = -1;
                ddltype.SelectedIndex = -1;
            }
                
           
        }

    }
}