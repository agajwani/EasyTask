using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace EasyHelpDesk
{
    public partial class TicketDet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT trd.Ticketreqno AS [TicketNo],TicketGenDate AS [Date],Ticketreqtype AS [Type],Ticketrequser AS [request From],lh.LocationName AS [Reqloc],dept.DeptName AS [ReqDept],SubLocationHeader.SubLocName as [Subloc],trd.TicketAssignTech AS [Assto],trd.ReqUpdateDate AS [Asson], trd.TicketreqSub AS[Subject], trd.TicketReqInfo AS[Info], trd.TicketType AS[TType], trd.TicketStatus AS[Status], trd.ReqPriority AS[priority], trd.TicketReqNotes AS[Comment] FROM dbo.TicketRequestDetails trd INNER JOIN dbo.LocationHeader lh ON trd.Ticketreqlocation = lh.LocationID INNER JOIN dbo.Department dept ON TicketReqDept = dept.DeptId inner Join SubLocationHeader on trd.Sublocation = SubLocationHeader.SubLocId WHERE trd.Ticketreqno = '" + id+"'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count>0)
            {
                txttype.Text = table.Rows[0]["TType"].ToString();
                txttcktno.Text = table.Rows[0]["TicketNo"].ToString();
                txtsub.Text = table.Rows[0]["Subject"].ToString();
                txtreqname.Text = table.Rows[0]["request From"].ToString();
                txtnotes.Text = table.Rows[0]["Comment"].ToString();
                txtdet.Text = table.Rows[0]["Info"].ToString();
                ddldept.Items.Add(table.Rows[0]["ReqDept"].ToString());
                ddlloc.Items.Add(table.Rows[0]["Reqloc"].ToString());
                ddlpri.Items.Add(table.Rows[0]["Priority"].ToString());
                ddlreqtype.Items.Add(table.Rows[0]["Type"].ToString());
                ddltech.Items.Add(table.Rows[0]["Assto"].ToString());
                tckassdate.Text = table.Rows[0]["Asson"].ToString();
                tckdate.Text = table.Rows[0]["Date"].ToString();
                ddlsubloc.Items.Add(table.Rows[0]["subloc"].ToString());
            }
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("TicketAssignedDtl.aspx");
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (ddlstatus.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Please Select The Desired Status To Proceed Further')</script>");
            }
            else 
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                if (ddlsentech.SelectedIndex == 0)
                {
                    if (txtnotesbyuser.Text == "")
                    {
                        SqlCommand utcmd = new SqlCommand("Update TicketRequestDetails set TicketStatus='" + ddlstatus.Text + "',TicketReqNotes = '" + txtnotes.Text + "',actiondate='" + DateTime.Now.ToString("dd-MMM-yyyy") + "',actionmenu='" + uri.Text + "' where Ticketreqno='" + txttcktno.Text + "'", connection);
                        utcmd.ExecuteNonQuery();
                        SqlCommand tckucmd = new SqlCommand("Update ticketdetails set tckstatus = '" + ddlstatus.Text + "' where TicketNumber ='" + txttcktno.Text + "'", connection);
                        tckucmd.ExecuteNonQuery();
                        txtdet.Text = "";
                        txtnotes.Text = "";
                        txtnotesbyuser.Text = "";
                        txtreqname.Text = "";
                        txtsub.Text = "";
                        txttcktno.Text = "";
                        txttype.Text = "";
                        ddldept.SelectedIndex = -1;
                        ddlloc.SelectedIndex = -1;
                        ddlpri.SelectedIndex = -1;
                        ddlreqtype.SelectedIndex = -1;
                        ddlsentech.SelectedIndex = 0;
                        ddlstatus.SelectedIndex = 0;
                        ddltech.SelectedIndex = -1;
                        Response.Write("<script>alert('Ticket Status Updated ')</script>");
                    }
                    else
                    {
                        SqlCommand ucmd = new SqlCommand("Update TicketRequestDetails set TicketStatus='" + ddlstatus.Text + "',TicketReqNotes = '" + txtnotesbyuser.Text + "',actiondate='" + DateTime.Now.ToString("dd-MMM-yyyy") + "',actionmenu='" + uri.Text + "' where Ticketreqno='" + txttcktno.Text + "'", connection);
                        ucmd.ExecuteNonQuery();
                        SqlCommand tckucmd = new SqlCommand("Update ticketdetails set tckstatus = '" + ddlstatus.Text + "' where TicketNumber ='" + txttcktno.Text + "'", connection);
                        tckucmd.ExecuteNonQuery();
                        txtdet.Text = "";
                        txtnotes.Text = "";
                        txtnotesbyuser.Text = "";
                        txtreqname.Text = "";
                        txtsub.Text = "";
                        txttcktno.Text = "";
                        txttype.Text = "";
                        ddldept.SelectedIndex = -1;
                        ddlloc.SelectedIndex = -1;
                        ddlpri.SelectedIndex = -1;
                        ddlreqtype.SelectedIndex = -1;
                        ddlsentech.SelectedIndex = 0;
                        ddlstatus.SelectedIndex = 0;
                        ddltech.SelectedIndex = -1;
                        Response.Write("<script>alert('Ticket Status Updated ')</script>");
                    }
                    
                }
                else
                {
                    if (txtnotes.Text != "")
                    {
                        SqlCommand cmd = new SqlCommand("Update TicketRequestDetails set Seniortech = '" + ddlsentech.Text + "',TicketAssignTech='" + ddlsentech.Text + "',TicketStatus ='" + ddlstatus.Text + "',TicketReqNotes = '" + txtnotesbyuser.Text + "',AssignedBy='" + Session["tuid"].ToString() + "',actiondate='" + DateTime.Now.ToString("dd-MMM-yyyy") + "',actionmenu='" + uri.Text + "' where Ticketreqno='" + txttcktno.Text + "'", connection);
                        cmd.ExecuteNonQuery();
                        SqlCommand tckucmd = new SqlCommand("Update ticketdetails set tckstatus = '" + ddlstatus.Text + "' where TicketNumber ='" + txttcktno.Text + "'", connection);
                        tckucmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Ticket Assigned to " + ddlsentech.Text + "')</script>");
                        txtdet.Text = "";
                        txtnotes.Text = "";
                        txtnotesbyuser.Text = "";
                        txtreqname.Text = "";
                        txtsub.Text = "";
                        txttcktno.Text = "";
                        txttype.Text = "";
                        ddldept.SelectedIndex = -1;
                        ddlloc.SelectedIndex = -1;
                        ddlpri.SelectedIndex = -1;
                        ddlreqtype.SelectedIndex = -1;
                        ddlsentech.SelectedIndex = 0;
                        ddlstatus.SelectedIndex = 0;
                        ddltech.SelectedIndex = -1;
                        Response.Write("<script>alert('Ticket Status Updated ')</script>");
                    }
                    else
                    {
                        SqlCommand scmd = new SqlCommand("Update TicketRequestDetails set Seniortech = '" + ddlsentech.Text + "',TicketAssignTech='" + ddlsentech.Text + "',TicketStatus ='" + ddlstatus.Text + "',TicketReqNotes = '" + txtnotes.Text + "',AssignedBy='" + Session["tuid"].ToString() + "',actiondate='" + DateTime.Now.ToString("dd-MMM-yyyy") + "',actionmenu='" + uri.Text + "' where Ticketreqno='" + txttcktno.Text + "'", connection);
                        scmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Ticket Assigned to " + ddlsentech.Text + "')</script>");
                        SqlCommand tckucmd = new SqlCommand("Update ticketdetails set tckstatus = '" + ddlstatus.Text + "' where TicketNumber ='" + txttcktno.Text + "'", connection);
                        tckucmd.ExecuteNonQuery();
                        txtdet.Text = "";
                        txtnotes.Text = "";
                        txtnotesbyuser.Text = "";
                        txtreqname.Text = "";
                        txtsub.Text = "";
                        txttcktno.Text = "";
                        txttype.Text = "";
                        ddldept.SelectedIndex = -1;
                        ddlloc.SelectedIndex = -1;
                        ddlpri.SelectedIndex = -1;
                        ddlreqtype.SelectedIndex = -1;
                        ddlsentech.SelectedIndex = 0;
                        ddlstatus.SelectedIndex = 0;
                        ddltech.SelectedIndex = -1;
                    }
                    connection.Close();
                }
            }
        }
    }
}