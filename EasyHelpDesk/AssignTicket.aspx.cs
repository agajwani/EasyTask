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

namespace EasyHelpDesk
{
    public partial class AssignTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            allassignticket();
        }
        public void allassignticket()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT trd.Ticketreqno AS [TicketNo],trd.TicketGenDate AS [Request Date],trd.Ticketreqtype AS [Request Type],trd.Ticketrequser AS [Request From], lh.LocationName,dept.DeptName,trd.TicketAssignTech AS [Assigned To Technician],ReqUpdateDate AS[Request Update Date], trd.TicketreqSub AS[Subject], trd.TicketReqInfo AS[Request Reported], trd.TicketType AS[Ticket Type], trd.TicketStatus AS[Request Status], trd.ReqPriority AS[Priority], TicketReqNotes AS[Notes] FROM  dbo.TicketRequestDetails trd inner join locationheader lh on lh.LocationID = trd.Ticketreqlocation INNER JOIN dbo.Department dept ON dept.DeptId = trd.TicketReqDept", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            atgrid.DataSource = table;
            atgrid.DataBind();
            connection.Close();
        }

        protected void atgrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            atgrid.PageIndex = e.NewPageIndex;
            this.allassignticket();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            txttckno.Text = "";
            ddltech.SelectedIndex = -1;
            allassignticket();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if(txttckno.Text=="")
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT trd.Ticketreqno AS [TicketNo],trd.TicketGenDate AS [Request Date],trd.Ticketreqtype AS [Request Type],trd.Ticketrequser AS [Request From], lh.LocationName,dept.DeptName,trd.TicketAssignTech AS [Assigned To Technician],ReqUpdateDate AS[Request Update Date], trd.TicketreqSub AS[Subject], trd.TicketReqInfo AS[Request Reported], trd.TicketType AS[Ticket Type], trd.TicketStatus AS[Request Status], trd.ReqPriority AS[Priority], TicketReqNotes AS[Notes] FROM  dbo.TicketRequestDetails trd inner join locationheader lh on lh.LocationID = trd.Ticketreqlocation INNER JOIN dbo.Department dept ON dept.DeptId = trd.TicketReqDept WHERE trd.TicketAssignTech='"+ddltech.Text+"'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);
                atgrid.DataSource = table;
                atgrid.DataBind();
                connection.Close();
            }
            else
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT trd.Ticketreqno AS [TicketNo],trd.TicketGenDate AS [Request Date],trd.Ticketreqtype AS [Request Type],trd.Ticketrequser AS [Request From], lh.LocationName,dept.DeptName,trd.TicketAssignTech AS [Assigned To Technician],ReqUpdateDate AS[Request Update Date], trd.TicketreqSub AS[Subject], trd.TicketReqInfo AS[Request Reported], trd.TicketType AS[Ticket Type], trd.TicketStatus AS[Request Status], trd.ReqPriority AS[Priority], TicketReqNotes AS[Notes] FROM  dbo.TicketRequestDetails trd inner join locationheader lh on lh.LocationID = trd.Ticketreqlocation INNER JOIN dbo.Department dept ON dept.DeptId = trd.TicketReqDept WHERE trd.Ticketreqno = '" + txttckno.Text + "'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);
                atgrid.DataSource = table;
                atgrid.DataBind();
                connection.Close();

            }
        }
    }
}