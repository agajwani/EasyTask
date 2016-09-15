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

namespace EasyHelpDesk
{
    public partial class TicketDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gettckalldata();
        }
        public void gettckalldata()
        {
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                SqlCommand cmd = new SqlCommand("select td.ticketnumber as [TicketNo],CONVERT(datetime, td.Ticketdate, 112) as [Date],td.TicketType As [Request Type],td.TicketSubject as [Subject],td.TicketReqInfo as [Request Info],lh.locationname as [Location Name],slh.SubLocName as [Sub Location Name],td.tckdept as [Department], td.Tckuserid as [Request From], td.ContactNo as [ContactNo], td.tckstatus as [Status] from ticketdetails td inner join locationheader lh on lh.LocationID = td.Tcklocation Inner Join SubLocationHeader slh on slh.SubLocId = td.Subloactionid  WHERE td.tckstatus='Pending'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);
                tdgtckdlt.DataSource = table;
                tdgtckdlt.DataBind();
                foreach (GridViewRow row in tdgtckdlt.Rows)
                {
                    string val = row.Cells[0].Text;
                    row.Cells[0].Text = "";
                    LinkButton btn = new LinkButton();
                    btn.Text = val;
                    btn.PostBackUrl = "~/TicketDetailView.aspx?id=" + val;
                    row.Cells[0].Controls.Add(btn);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</script>");
            }
        }

        protected void tdgtckdlt_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            tdgtckdlt.PageIndex = e.NewPageIndex;
            this.gettckalldata();
        }

        protected void tdbrec_Click(object sender, EventArgs e)
        {
            tdsearch.Visible = false;
            gettckalldata();
            td4.Visible = false;
            td3.Visible = true;
        }

        protected void tdbopen_Click(object sender, EventArgs e)
        {
            tdsearch.Visible = false;
            td4.Visible = false;
            td3.Visible = true;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("select td.ticketnumber as [TicketNo],CONVERT(datetime, td.Ticketdate, 112) as [Date],td.TicketType As [Request Type],td.TicketSubject as [Subject],td.TicketReqInfo as [Request Info],lh.locationname as [Location Name],slh.SubLocName as [Sub Location Name],td.tckdept as [Department], td.Tckuserid as [Request From], td.ContactNo as [ContactNo], td.tckstatus as [Status] from ticketdetails td inner join locationheader lh on lh.LocationID = td.Tcklocation Inner Join SubLocationHeader slh on slh.SubLocId = td.Subloactionid WHERE td.tckstatus<>'Pending'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            tdgtckdlt.DataSource = table;
            tdgtckdlt.DataBind();
            //foreach (GridViewRow row in tdgtckdlt.Rows)
            //{
            //    string val = row.Cells[0].Text;
            //    row.Cells[0].Text = "";
            //    LinkButton btn = new LinkButton();
            //    btn.Text = val;
            //    btn.PostBackUrl = "~/TicketDetailView.aspx?id=" + val;
            //    row.Cells[0].Controls.Add(btn);
            //}
            //string val = row.Cells[0].Text;
            ////TableCell cell = new TableCell();
            //row.Cells[0].Text = "";
            //LinkButton btn = new LinkButton();
            ////btn.Text = "Ticket Details";
            //btn.Text = val;
            //btn.PostBackUrl = "~/TicketDetailView.aspx?id=" + val/*row.Cells[0].Controls.Add(btn)*/;
            //row.Cells[0].Controls.Add(btn);
        }

        protected void tdbsearch_Click(object sender, EventArgs e)
        {
            tdsearch.Visible = true;
            td3.Visible = false;
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            tdsearch.Visible = false;
            txttckno.Text = "";
            td4.Visible = false;
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {

            td3.Visible = false;
            td4.Visible = true;
            getsearhdata();
        }
        public void getsearhdata()
        {
            
            {
                if (txttckno.Visible == true)
                {
                    if (txttckno.Text == "")
                    {
                        Response.Write("<script>alert('Please Valid Data Insert Data')");

                    }
                    else
                    {
                        SqlConnection connection2 = new SqlConnection();
                        connection2.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                        connection2.Open();
                        SqlCommand cmd = new SqlCommand("SELECT trd.Ticketreqno AS [TicketNo],trd.TicketGenDate AS [Request Date],trd.Ticketreqtype AS [Request Type],trd.Ticketrequser AS [Request From], lh.LocationName as [Location Name],dept.DeptName as [Department Name],trd.TicketAssignTech AS [Assigned To Technician],ReqUpdateDate AS[Request Update Date], trd.TicketreqSub AS[Subject], trd.TicketReqInfo AS[Request Reported], trd.TicketType AS[Ticket Type], trd.TicketStatus AS[Request Status], trd.ReqPriority AS[Priority], TicketReqNotes AS[Notes] FROM  dbo.TicketRequestDetails trd inner join locationheader lh on lh.LocationID = trd.Ticketreqlocation INNER JOIN dbo.Department dept ON dept.DeptId = trd.TicketReqDept WHERE trd." + ddlstatus.Text + " = '" + txttckno.Text + "'", connection2); /*OR trd.Ticketreqno = '" + txttckno.Text + "'*/
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable table = new DataTable();
                        adapter.Fill(table);
                        if (table.Rows.Count > 0)
                        {
                            tdgrid.DataSource = table;
                            tdgrid.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Data Found Please Try Again')</script>");
                        }
                        connection2.Close();
                    }
                }

                else
                {
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                    connection.Open();

                    if (ddlstatus.SelectedIndex == 4)

                    {
                        SqlCommand cmd = new SqlCommand("SELECT trd.Ticketreqno AS [TicketNo],trd.TicketGenDate AS [Request Date],trd.Ticketreqtype AS [Request Type],trd.Ticketrequser AS [Request From], lh.LocationName as [Location Name],dept.DeptName as [Department Name],trd.TicketAssignTech AS [Assigned To Technician],ReqUpdateDate AS[Request Update Date], trd.TicketreqSub AS[Subject], trd.TicketReqInfo AS[Request Reported], trd.TicketType AS[Ticket Type], trd.TicketStatus AS[Request Status], trd.ReqPriority AS[Priority], TicketReqNotes AS[Notes] FROM  dbo.TicketRequestDetails trd inner join locationheader lh on lh.LocationID = trd.Ticketreqlocation INNER JOIN dbo.Department dept ON dept.DeptId = trd.TicketReqDept WHERE trd." + ddlstatus.Text + " = '" + ddlloc.Text + "'", connection); /*OR trd.Ticketreqno = '" + txttckno.Text + "'*/
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable table = new DataTable();
                        adapter.Fill(table);
                        if (table.Rows.Count > 0)
                        {
                            tdgrid.DataSource = table;
                            tdgrid.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Data Found Please Try Again')</script>");
                        }
                    }
                    else if (ddlstatus.SelectedIndex == 5)
                    {
                        SqlCommand cmd = new SqlCommand("SELECT trd.Ticketreqno AS [TicketNo],trd.TicketGenDate AS [Request Date],trd.Ticketreqtype AS [Request Type],trd.Ticketrequser AS [Request From], lh.LocationName as [Location Name],dept.DeptName as [Department Name],trd.TicketAssignTech AS [Assigned To Technician],ReqUpdateDate AS[Request Update Date], trd.TicketreqSub AS[Subject], trd.TicketReqInfo AS[Request Reported], trd.TicketType AS[Ticket Type], trd.TicketStatus AS[Request Status], trd.ReqPriority AS[Priority], TicketReqNotes AS[Notes] FROM  dbo.TicketRequestDetails trd inner join locationheader lh on lh.LocationID = trd.Ticketreqlocation INNER JOIN dbo.Department dept ON dept.DeptId = trd.TicketReqDept WHERE trd." + ddlstatus.Text + " = '" + ddldept.Text + "'", connection); /*OR trd.Ticketreqno = '" + txttckno.Text + "'*/
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable table = new DataTable();
                        adapter.Fill(table);
                        if (table.Rows.Count > 0)
                        {
                            tdgrid.DataSource = table;
                            tdgrid.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Data Found Please Try Again')</script>");
                        }
                    }
                    else if (ddlstatus.SelectedIndex == 9)
                    {
                        SqlCommand cmd = new SqlCommand("SELECT trd.Ticketreqno AS [TicketNo],trd.TicketGenDate AS [Request Date],trd.Ticketreqtype AS [Request Type],trd.Ticketrequser AS [Request From], lh.LocationName as [Location Name],dept.DeptName as [Department Name],trd.TicketAssignTech AS [Assigned To Technician],ReqUpdateDate AS[Request Update Date], trd.TicketreqSub AS[Subject], trd.TicketReqInfo AS[Request Reported], trd.TicketType AS[Ticket Type], trd.TicketStatus AS[Request Status], trd.ReqPriority AS[Priority], TicketReqNotes AS[Notes] FROM  dbo.TicketRequestDetails trd inner join locationheader lh on lh.LocationID = trd.Ticketreqlocation INNER JOIN dbo.Department dept ON dept.DeptId = trd.TicketReqDept WHERE trd." + ddlstatus.Text + " = '" + ddlpri.Text + "'", connection); /*OR trd.Ticketreqno = '" + txttckno.Text + "'*/
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable table = new DataTable();
                        adapter.Fill(table);
                        if (table.Rows.Count > 0)
                        {
                            tdgrid.DataSource = table;
                            tdgrid.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Data Found Please Try Again')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Insert Search Data')</script>");
                    }
                    connection.Close();
                }

            }
        }
    protected void tdgrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            tdgrid.PageIndex = e.NewPageIndex;
            this.getsearhdata();
        }

        protected void ddlstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlstatus.SelectedIndex==9)
            {

                //ddlstatus.AutoPostBackControl = true;
                ddlpri.Visible = true;
                txttckno.Visible = false;
                ddlloc.Visible = false;
                ddldept.Visible = false;
            }
            else if(ddlstatus.SelectedIndex==4)
            {
                ddlloc.Visible = true;
                ddldept.Visible = false;
                ddlpri.Visible = false;
                txttckno.Visible = false;
            }
            else if(ddlstatus.SelectedIndex==5)
            {
                ddldept.Visible = true;
                ddlloc.Visible = false;
                ddlpri.Visible = false;
                txttckno.Visible = false;
            }
            else
            {
                ddlpri.Visible = false;
                ddlloc.Visible = false;
                ddldept.Visible = false;
                txttckno.Visible = true;
            }
        }
    }
}