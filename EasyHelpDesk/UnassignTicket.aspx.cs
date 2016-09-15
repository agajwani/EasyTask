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
    public partial class UnassignTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getallunassignticket();
        }
        public void getallunassignticket()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("select td.ticketnumber as [TicketNo],CONVERT(datetime, td.Ticketdate, 112) as [Date],td.TicketType As [Request Type],td.TicketSubject as [Subject],td.TicketReqInfo as [Request Info],lh.locationname as [Location Name],slh.SubLocName as [SubLocation Name],td.tckdept as [Department], td.Tckuserid as [Request From], td.ContactNo as [ContactNo], td.tckstatus as [Status] from ticketdetails td inner join locationheader lh on lh.LocationID = td.Tcklocation  Inner Join SubLocationHeader slh on slh.SubLocId = td.Subloactionid WHERE td.tckstatus='Pending'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            uatgrid.DataSource = table;
            uatgrid.DataBind();
            foreach (GridViewRow row in uatgrid.Rows)
            {
                string val = row.Cells[0].Text;
                row.Cells[0].Text = "";
                LinkButton btn = new LinkButton();
                btn.Text = val;
                btn.PostBackUrl = "~/TicketDetailView.aspx?id=" + val;
                row.Cells[0].Controls.Add(btn);
            }
            connection.Close();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            txttckno.Text = "";
            getallunassignticket();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("select td.ticketnumber as [TicketNo],CONVERT(datetime, td.Ticketdate, 112) as [Date],td.TicketType As [Request Type],td.TicketSubject as [Subject],td.TicketReqInfo as [Request Info],lh.locationname as [Location Name],slh.SubLocName as [SubLocation Name],td.tckdept as [Department], td.Tckuserid as [Request From], td.ContactNo as [ContactNo], td.tckstatus as [Status] from ticketdetails td inner join locationheader lh on lh.LocationID = td.Tcklocation Inner Join SubLocationHeader slh on slh.SubLocId = td.Subloactionid WHERE td.tckstatus='Pending' and ticketnumber = '" + txttckno.Text+"'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            {
                uatgrid.DataSource = table;
                uatgrid.DataBind();
                foreach (GridViewRow row in uatgrid.Rows)
                {
                    string val = row.Cells[0].Text;
                    row.Cells[0].Text = "";
                    LinkButton btn = new LinkButton();
                    btn.Text = val;
                    btn.PostBackUrl = "~/TicketDetailView.aspx?id=" + val;
                    row.Cells[0].Controls.Add(btn);
                }
            }
            else
            {
                Response.Write("<script>alert('Please check the Ticket Number and try again.')</script>");
            }
            connection.Close();
        }

        protected void uatgrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uatgrid.PageIndex = e.NewPageIndex;
            this.getallunassignticket();
        }
    }
}