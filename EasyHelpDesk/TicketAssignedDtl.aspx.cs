using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace EasyHelpDesk
{
    public partial class TicketAssignedDtl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getuserticket();
            getudept();
        }
        public void getudept()
        {
            SqlConnection udcon = new SqlConnection();
            udcon.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            udcon.Open();
            SqlCommand udcmd = new SqlCommand("select dept.DeptName,ui.DeptId from UserInfo ui inner join Department dept on ui.DeptId = dept.DeptId where ui.UserLoginId ='" + Session["tuid"].ToString() + "'", udcon);
            SqlDataAdapter udadapter = new SqlDataAdapter(udcmd);
            DataTable udtable = new DataTable();
            udadapter.Fill(udtable);
            udept.Text = udtable.Rows[0]["DeptName"].ToString();
            udcon.Close();
        }
        public void getuserticket()
        {
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                // SqlCommand cmd = new SqlCommand("SELECT Ticketreqno AS [Request No],TicketGenDate AS [Request Date],Ticketreqtype AS [Request Type],Ticketrequser AS [Request From],LocationName AS [Locatoin],DeptName AS [Department], TicketAssignTech AS [Assigned To],ReqUpdateDate AS[Assigned On Date], TicketreqSub AS[Subject], TicketReqInfo AS[Request Info], TicketType AS[Type], TicketStatus AS[Status],ReqPriority AS [Priority], TicketReqNotes AS[Comment] from dbo.TicketRequestDetails INNER JOIN dbo.LocationHeader ON dbo.LocationHeader.LocationID = Ticketreqlocation INNER JOIN dbo.Department ON DeptId = TicketReqDept WHERE TicketAssignTech='" + Session["tuid"].ToString() +"'", connection);
                SqlCommand cmd = new SqlCommand("Assigntckdtl", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@tckuserid", Session["Tuid"].ToString());
                cmd.Parameters.AddWithValue("@Seniortech", "");
                SqlDataAdapter adapater = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapater.Fill(table);
                gdtckt.DataSource = table;
                gdtckt.DataBind();
                foreach (System.Web.UI.WebControls.GridViewRow row in gdtckt.Rows)
                {
                    string val = row.Cells[0].Text;
                    //TableCell cell = new TableCell();
                    row.Cells[0].Text = "";
                    LinkButton btn = new LinkButton();
                    //btn.Text = "Ticket Details";
                    btn.Text = val;
                    btn.PostBackUrl = "~/TicketAssignUpdate.aspx?id=" + val/*row.Cells[0].Controls.Add(btn)*/;
                    row.Cells[0].Controls.Add(btn);
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            
        }
        protected void tadblogout_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void imgbtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void gdtckt_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdtckt.PageIndex = e.NewPageIndex;
            this.getuserticket();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            txttckno.Text = "";
            ddlpri.SelectedIndex=-1;
            ddlstatus.SelectedIndex = -1;
            getuserticket();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if (txttckno.Visible == true)
            {
                if (txttckno.Text == "")
                {
                    Response.Write("<script>alert('Please Insert Valid Data To Search')</script>");
                }
                else
                {
                    SqlConnection sconnection = new SqlConnection();
                    sconnection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ToString();
                    sconnection.Open();
                    SqlCommand scmd = new SqlCommand("SELECT Ticketreqno AS [Request No],TicketGenDate AS [Request Date],Ticketreqtype AS [Request Type],Ticketrequser AS [Request From],LocationName AS [Locatoin],SubLocationHeader.SubLocName as [Sub Location], DeptName AS [Department], TicketAssignTech AS [Assigned To],ReqUpdateDate AS[Assigned On Date], TicketreqSub AS[Subject], TicketReqInfo AS[Request Info], TicketType AS[Type], TicketStatus AS[Status],ReqPriority AS [Priority], TicketReqNotes AS[Comment] from dbo.TicketRequestDetails INNER JOIN dbo.LocationHeader ON dbo.LocationHeader.LocationID = Ticketreqlocation INNER JOIN dbo.Department ON DeptId = TicketReqDept inner Join SubLocationHeader on TicketRequestDetails.Sublocation = SubLocationHeader.SubLocId WHERE " + ddlstatus.Text + "='" + txttckno.Text + "' and TicketAssignTech = '" + Session["tuid"].ToString() + "'", sconnection);
                    SqlDataAdapter sadapter = new SqlDataAdapter(scmd);
                    DataTable stable = new DataTable();
                    sadapter.Fill(stable);
                    if (stable.Rows.Count > 0)
                    {
                        gdtckt.DataSource = stable;
                        gdtckt.DataBind();
                        txttckno.Text = "";
                        foreach (GridViewRow row in gdtckt.Rows)
                        {
                            string val = row.Cells[0].Text;
                            row.Cells[0].Text = "";
                            LinkButton btn = new LinkButton();
                            btn.Text = val;
                            btn.PostBackUrl = "~/TicketAssignUpdate.aspx?id=" + val;
                            row.Cells[0].Controls.Add(btn);
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('No Data Found Please Try Again')</script>");
                        txttckno.Text = "";
                    }
                    sconnection.Close();
                }
            }
             if (ddlstatus.SelectedIndex == 4)
            {
                SqlConnection sconnection = new SqlConnection();
                sconnection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ToString();
                sconnection.Open();
                SqlCommand scmd = new SqlCommand("SELECT Ticketreqno AS [Request No],TicketGenDate AS [Request Date],Ticketreqtype AS [Request Type],Ticketrequser AS [Request From],LocationName AS [Locatoin],SubLocationHeader.SubLocName as [Sub Location],DeptName AS [Department], TicketAssignTech AS [Assigned To],ReqUpdateDate AS[Assigned On Date], TicketreqSub AS[Subject], TicketReqInfo AS[Request Info], TicketType AS[Type], TicketStatus AS[Status],ReqPriority AS [Priority],TicketReqNotes AS[Comment] from dbo.TicketRequestDetails INNER JOIN dbo.LocationHeader ON dbo.LocationHeader.LocationID = Ticketreqlocation INNER JOIN dbo.Department ON DeptId = TicketReqDept inner Join SubLocationHeader on TicketRequestDetails.Sublocation = SubLocationHeader.SubLocId WHERE TicketAssignTech='" + Session["tuid"].ToString() + "' and " + ddlstatus.Text + " ='" + ddlloc.Text + "'", sconnection);
                SqlDataAdapter sadapter = new SqlDataAdapter(scmd);
                DataTable stable = new DataTable();
                sadapter.Fill(stable);
                if (stable.Rows.Count > 0)
                {
                    gdtckt.DataSource = stable;
                    gdtckt.DataBind();
                    foreach (GridViewRow row in gdtckt.Rows)
                    {
                        string val = row.Cells[0].Text;
                        row.Cells[0].Text = "";
                        LinkButton btn = new LinkButton();
                        btn.Text = val;
                        btn.PostBackUrl = "~/TicketAssignUpdate.aspx?id=" + val;
                        row.Cells[0].Controls.Add(btn);
                    }
                }
                else
                {
                    Response.Write("<script>alert('No Data Found Please Try Again')</script>");
                }
                sconnection.Close();
            }
            else if (ddlstatus.SelectedIndex == 5)
            {
                SqlConnection sconnection = new SqlConnection();
                sconnection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ToString();
                sconnection.Open();
                SqlCommand spcmd = new SqlCommand("SELECT Ticketreqno AS [Request No],TicketGenDate AS [Request Date],Ticketreqtype AS [Request Type],Ticketrequser AS [Request From],LocationName AS [Locatoin],SubLocationHeader.SubLocName as [Sub Location],DeptName AS [Department], TicketAssignTech AS [Assigned To],ReqUpdateDate AS[Assigned On Date], TicketreqSub AS[Subject], TicketReqInfo AS[Request Info], TicketType AS[Type], TicketStatus AS[Status],ReqPriority AS [Priority],TicketReqNotes AS[Comment] from dbo.TicketRequestDetails INNER JOIN dbo.LocationHeader ON dbo.LocationHeader.LocationID = Ticketreqlocation INNER JOIN dbo.Department ON DeptId = TicketReqDept inner Join SubLocationHeader on TicketRequestDetails.Sublocation = SubLocationHeader.SubLocId WHERE TicketAssignTech='" + Session["tuid"].ToString() + "' and " + ddlstatus.Text + " = '" + ddldept.Text + "'", sconnection);
                SqlDataAdapter spadapter = new SqlDataAdapter(spcmd);
                DataTable sptable = new DataTable();
                spadapter.Fill(sptable);
                if (sptable.Rows.Count > 0)
                {
                    gdtckt.DataSource = sptable;
                    gdtckt.DataBind();
                    foreach (GridViewRow row in gdtckt.Rows)
                    {
                        string val = row.Cells[0].Text;
                        row.Cells[0].Text = "";
                        LinkButton btn = new LinkButton();
                        btn.Text = val;
                        btn.PostBackUrl = "~/TicketAssignUpdate.aspx?id=" + val;
                        row.Cells[0].Controls.Add(btn);
                    }
                }
                else
                {
                    Response.Write("<script>alert('No Data Found Please Try Again')</script>");
                }
                sconnection.Close();
            }
            else if (ddlstatus.SelectedIndex == 9)
            {
                SqlConnection sconnection = new SqlConnection();
                sconnection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ToString();
                sconnection.Open();
                SqlCommand spcmd = new SqlCommand("SELECT Ticketreqno AS [Request No],TicketGenDate AS [Request Date],Ticketreqtype AS [Request Type],Ticketrequser AS [Request From],LocationName AS [Locatoin],SubLocationHeader.SubLocName as [Sub Location],DeptName AS [Department], TicketAssignTech AS [Assigned To],ReqUpdateDate AS[Assigned On Date], TicketreqSub AS[Subject], TicketReqInfo AS[Request Info], TicketType AS[Type], TicketStatus AS[Status],ReqPriority AS [Priority],TicketReqNotes AS[Comment] from dbo.TicketRequestDetails INNER JOIN dbo.LocationHeader ON dbo.LocationHeader.LocationID = Ticketreqlocation INNER JOIN dbo.Department ON DeptId = TicketReqDept inner Join SubLocationHeader on TicketRequestDetails.Sublocation = SubLocationHeader.SubLocId WHERE TicketAssignTech='" + Session["tuid"].ToString() + "' and " + ddlstatus.Text + " = '" + ddlpri.Text + "'", sconnection);
                SqlDataAdapter spadapter = new SqlDataAdapter(spcmd);
                DataTable sptable = new DataTable();
                spadapter.Fill(sptable);
                if (sptable.Rows.Count > 0)
                {
                    gdtckt.DataSource = sptable;
                    gdtckt.DataBind();
                    foreach (GridViewRow row in gdtckt.Rows)
                    {
                        string val = row.Cells[0].Text;
                        row.Cells[0].Text = "";
                        LinkButton btn = new LinkButton();
                        btn.Text = val;
                        btn.PostBackUrl = "~/TicketAssignUpdate.aspx?id=" + val;
                        row.Cells[0].Controls.Add(btn);
                    }
                }
                else
                {
                    Response.Write("<script>alert('No Data Found Please Try Again')</script>");
                }
                sconnection.Close();
            }
            //else
            //{
            //    Response.Write("<script>alert('Please Insert Valid Search Data')</script>");
            //}
            //txttckno.Text = "";
            //ddlpri.SelectedIndex = -1;
            //ddlstatus.SelectedIndex = -1;
        }

        protected void ddlstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlstatus.SelectedIndex==9)
            {
                ddlpri.Visible = true;
                txttckno.Visible = false;
                ddlloc.Visible = false;
                ddldept.Visible = false;
            }
            else if(ddlstatus.SelectedIndex==4)
            {
                ddlpri.Visible = false;
                ddlloc.Visible = true;
                ddldept.Visible = false;
                txttckno.Visible = false;
            }
            else if(ddlstatus.SelectedIndex==5)
            {
                ddlpri.Visible = false;
                ddlloc.Visible = false;
                ddldept.Visible = true;
                txttckno.Visible = false;
            }
            else
            {
                ddldept.Visible = false;
                ddlloc.Visible = false;
                ddlpri.Visible = false;
                txttckno.Visible = true;
            }
        }

        protected void imgbtn_Load(object sender, EventArgs e)
        {
            SqlConnection urcon = new SqlConnection();
            urcon.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            urcon.Open();
            SqlCommand urcmd = new SqlCommand("Select AllowSwitchRole from UserInfo Where UserLoginId = '" + Session["tuid"].ToString() + "' and AllowSwitchRole = 1", urcon);
            SqlDataAdapter uradapter = new SqlDataAdapter(urcmd);
            DataTable urtable = new DataTable();
            uradapter.Fill(urtable);
            if (urtable.Rows.Count > 0)
            {
                imgbtn.Visible = true;
            }
            else
            {
                imgbtn.Visible = false;
            }
            urcon.Close();
        }

        protected void imgbtnmaster_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }

        protected void imgbtnmaster_Load(object sender, EventArgs e)
        {
            SqlConnection mconnection = new SqlConnection();
            mconnection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            mconnection.Open();
            SqlCommand cmd = new SqlCommand("SELECT MasterLogin FROM dbo.UserInfo WHERE UserLoginId = '" + Session["tuid"].ToString() + "' and masterlogin = 1 ", mconnection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable mtable = new DataTable();
            adapter.Fill(mtable);
            if (mtable.Rows.Count > 0)
            {
                imgbtnmaster.Visible = true;
            }
            else
            {
                imgbtnmaster.Visible = false;
            }
            mconnection.Close();
        }
    }
    }
