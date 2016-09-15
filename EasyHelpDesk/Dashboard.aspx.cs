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

namespace EasyTask
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getopenticetcount();
            getresolvedticketcount();
            getunassigntickcount();
            getothertickdtl();
            getdahboarddtl();
            
        }
        public void getopenticetcount()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand otcmd = new SqlCommand("SELECT COUNT(Ticketreqno) AS totalopentick from dbo.TicketRequestDetails WHERE TicketStatus='OPen'",connection);
            SqlDataAdapter otadapter = new SqlDataAdapter(otcmd);
            DataTable ottable = new DataTable();
            otadapter.Fill(ottable);
            lblopen.Text = ottable.Rows[0]["totalopentick"].ToString();
            connection.Close();
        }
        public void getresolvedticketcount()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand rtcmd = new SqlCommand("SELECT COUNT(Ticketreqno) AS totalcount from dbo.TicketRequestDetails WHERE TicketStatus='Resolved'", connection);
            SqlDataAdapter rtadapter = new SqlDataAdapter(rtcmd);
            DataTable rttable = new DataTable();
            rtadapter.Fill(rttable);
            lblresolved.Text = rttable.Rows[0]["totalcount"].ToString();
            connection.Close();
        }
        public void getunassigntickcount()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand utcmd = new SqlCommand("SELECT COUNT(TicketNumber) as totalcount FROM  dbo.ticketdetails WHERE tckstatus='pending'", connection);
            SqlDataAdapter utadapter = new SqlDataAdapter(utcmd);
            DataTable uttable = new DataTable();
            utadapter.Fill(uttable);
            lblunassign.Text = uttable.Rows[0]["totalcount"].ToString();
            connection.Close();
        }
        public void getothertickdtl()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand othcmd = new SqlCommand("SELECT COUNT(Ticketreqno) AS totalcount from dbo.TicketRequestDetails WHERE TicketStatus NOT IN ('open','Resolved')", connection);
            SqlDataAdapter othadapter = new SqlDataAdapter(othcmd);
            DataTable othtable = new DataTable();
            othadapter.Fill(othtable);
            lblpending.Text = othtable.Rows[0]["totalcount"].ToString();
            connection.Close();
            
        }
        public void getdahboarddtl()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand dbcmd = new SqlCommand("SELECT Ticketreqno AS [Request NO],CONVERT(date,TicketGenDate,104) AS [Date], TicketType AS [Type],ReqPriority AS [Priority],TicketStatus AS [Status] FROM  dbo.TicketRequestDetails Where TicketStatus NOT IN ('Resolved')      ", connection);
            SqlCommand dbpcmd = new SqlCommand("SELECT TicketNumber	 AS [Request NO],CONVERT(date,Ticketdate,104)AS [Date],TicketType AS [Type] ,tckstatus AS [Status] FROM dbo.ticketdetails WHERE tckstatus = 'Pending'", connection);
            SqlDataAdapter dbadapter = new SqlDataAdapter(dbcmd);
            SqlDataAdapter dbpadapter = new SqlDataAdapter(dbpcmd);
            DataTable dbtable = new DataTable();
            DataTable dbptable = new DataTable();
            dbadapter.Fill(dbtable);
            dbpadapter.Fill(dbptable);
            dbtable.Merge(dbptable);
            dbgrid.DataSource = dbtable;
            dbgrid.DataBind();
            //foreach (GridViewRow item in dbgrid.Rows)
            //{
            //    string val = item.Cells[0].Text;
            //    item.Cells[0].Text = "";
            //    LinkButton lbtn = new LinkButton();
            //    lbtn.Text = val;
            //    item.Cells[0].Controls.Add(lbtn);
            //}
            connection.Close();
        }

        protected void ot_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand otdtlcmd = new SqlCommand("SELECT Ticketreqno AS [Request NO],CONVERT(date,TicketGenDate,104) AS [Date], TicketType AS [Type],ReqPriority AS [Priority],TicketStatus AS [Status] FROM  dbo.TicketRequestDetails Where TicketStatus='Open'", connection);
            SqlDataAdapter otdtladapter = new SqlDataAdapter(otdtlcmd);
            DataTable otdtltable = new DataTable();
            otdtladapter.Fill(otdtltable);
            dbgrid.DataSource = otdtltable;
            dbgrid.DataBind();
            connection.Close();
        }

        protected void tbr_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand rcmd = new SqlCommand("SELECT Ticketreqno AS[Request NO], CONVERT(date, TicketGenDate, 104) AS[Date], TicketType AS[Type], ReqPriority AS[Priority], TicketStatus AS[Status] FROM  dbo.TicketRequestDetails Where TicketStatus = 'Resolved'", connection);
            SqlDataAdapter radapter = new SqlDataAdapter(rcmd);
            DataTable rtable = new DataTable();
            radapter.Fill(rtable);
            dbgrid.DataSource = rtable;
            dbgrid.DataBind();
            connection.Close();
        }

        protected void tbu_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand ucmd = new SqlCommand("SELECT TicketNumber	 AS [Request NO],CONVERT(date,Ticketdate,104)AS [Date],TicketType AS [Type] ,tckstatus AS [Status] FROM dbo.ticketdetails WHERE tckstatus = 'Pending'", connection);
            SqlDataAdapter uadatpter = new SqlDataAdapter(ucmd);
            DataTable utable = new DataTable();
            uadatpter.Fill(utable);
            dbgrid.DataSource = utable;
            dbgrid.DataBind();
            connection.Close();
        }

        protected void tbo_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand otcmd = new SqlCommand("SELECT Ticketreqno AS[Request NO], CONVERT(date, TicketGenDate, 104) AS[Date], TicketType AS[Type], ReqPriority AS[Priority], TicketStatus AS[Status] FROM  dbo.TicketRequestDetails Where TicketStatus NOT IN ('open','Resolved')", connection);
            SqlDataAdapter otadapter = new SqlDataAdapter(otcmd);
            DataTable ottable = new DataTable();
            otadapter.Fill(ottable);
            dbgrid.DataSource = ottable;
            dbgrid.DataBind();
            connection.Close();
        }

        protected void db_Click(object sender, EventArgs e)
        {
            getopenticetcount();
            getresolvedticketcount();
            getunassigntickcount();
            getothertickdtl();
            getdahboarddtl();
        }

        //protected void dbgrid_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    lbltckId.Text = (dbgrid.SelectedRow.FindControl("lbltckId") as Label).Text;
        //    lbldate.Text = dbgrid.SelectedRow.Cells[1].Text;
        //    lbltype.Text = dbgrid.SelectedRow.Cells[2].Text;
        //    dmpe.Show();
        //}
    }
}