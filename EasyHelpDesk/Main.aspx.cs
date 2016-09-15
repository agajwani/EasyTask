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
using System.IO;

namespace EasyHelpDesk
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == true)
            {
                tickethist.Visible = true;
                //ddlsubloc.SelectedIndex = -1;
            }
            else
            {
                if (ddllocation.SelectedIndex != 0)
                {
                    tickethist.Visible = false;
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.SubLocationHeader INNER JOIN dbo.LocationHeader ON ParentLocationId = dbo.LocationHeader.LocationID WHERE LocationID = '" + ddllocation.Text + "'", connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    if (table.Rows.Count > 0)
                    {
                        ddldept.Items.Add(table.Rows[0]["SubLocName"].ToString());
                    }
                    Reqdetails.Visible = true;
                    connection.Close();
                }
                else
                {
                    tickethist.Visible = false;
                    Reqdetails.Visible = false;
                }

            }
        }
        public void getcno()
        {
            SqlConnection cconnection = new SqlConnection();
            cconnection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            cconnection.Open();
            SqlCommand ccmd = new SqlCommand("Select UserMobileNo1,UserMobileNo2 from dbo.UserInfo WHERE  UserLoginId='" + Session["tuid"].ToString() + "'", cconnection);
            SqlDataAdapter cadapter = new SqlDataAdapter(ccmd);
            DataTable ctable = new DataTable();
            cadapter.Fill(ctable);
            rtcno.Text = ctable.Rows[0]["UserMobileNo1"].ToString();
            rtextno.Text = ctable.Rows[0]["UserMobileNo2"].ToString();
            cconnection.Close();
            tickethist.Visible = false;
            Reqdetails.Visible = true;
        }
        
        protected void mbreq_Click(object sender, EventArgs e)
        {
            {
                getcno();
            }
            
        }

        protected void rbcancel_Click(object sender, EventArgs e)
        {
            Reqdetails.Visible = false;
            tickethist.Visible = false;
        }

        protected void mbhis_Click(object sender, EventArgs e)
        {
            Reqdetails.Visible = false;
            tickethist.Visible = true;
            getdata();
        }

        protected void rbsubmit_Click(object sender, EventArgs e)
        {
            tickethist.Visible = false;
            if (ddldept.SelectedValue == "0")
            {
                Response.Write("<script>alert('Required Field Is Empty, Please Fill All Required Filed')</script>");
            }
            else if (ddllocation.SelectedValue == "0")
            {
                Response.Write("<script>alert('Required Field Is Empty, Please Fill All Required Filed')</script>");
            }
            else if (DDlTicketType.SelectedValue == "0")
            {
                Response.Write("<script>alert('Required Field Is Empty, Please Fill All Required Filed')</script>");
            }
            else if (tsub.Text == "")
            {
                Response.Write("<script>alert('Required Field Is Empty, Please Fill All Required Filed')</script>");
            }
            else if (TReq.Text == "")
            {
                Response.Write("<script>alert('Required Field Is Empty, Please Fill All Required Filed')</script>");
            }
            else if (rtcno.Text == "")
            {
                Response.Write("<script>alert('Required Field Is Empty, Please Fill All Required Filed')</script>");
            }
            else
            {
               // if (Rfupload.HasFile)
                {
                    //string filename = Path.GetFileName(Rfupload.PostedFile.FileName);
                    int RStream = Rfupload.PostedFile.ContentLength;
                    //BinaryReader Reader = new BinaryReader(RStream);
                    //Byte[] Attachment = Reader.ReadBytes((int)RStream.Length);
                    byte[] attachment = new byte[RStream];
                    HttpPostedFile Rattachment = Rfupload.PostedFile;
                    Rattachment.InputStream.Read(attachment, 0, RStream);
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("UpdTckNO", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Tckdate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@tcktyp", DDlTicketType.Text);
                    cmd.Parameters.AddWithValue("@tcksub", tsub.Text);
                    cmd.Parameters.AddWithValue("@tckreqinfo", TReq.Text);
                    cmd.Parameters.AddWithValue("@Attachment", SqlDbType.Image).Value = attachment;
                    cmd.Parameters.AddWithValue("@tckloc", ddllocation.Text);
                    cmd.Parameters.AddWithValue("@tckdept", ddldept.Text);
                    cmd.Parameters.AddWithValue("@tckuid", Session["tUid"].ToString());
                    cmd.Parameters.AddWithValue("@Cno", rtcno.Text);
                    cmd.Parameters.AddWithValue("@subloc", ddlsubloc.SelectedValue);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    ddldept.SelectedIndex = -1;
                    ddllocation.SelectedIndex = -1;
                    DDlTicketType.SelectedIndex = -1;
                    tsub.Text = "";
                    TReq.Text = "";
                    rtcno.Text = "";
                    ddlsubloc.SelectedIndex = -1;
                    Response.Write("<script>alert('Request Sumbitted Successfully')</script>");
                    //Response.Redirect("Main.aspx");
                }
                {
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                    connection.Open();
                    SqlCommand tcno = new SqlCommand("select top 1 ticketnumber from ticketdetails where tckuserid = '" + Session["tuid"].ToString() + "'order by ticketnumber desc ", connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(tcno);
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    {
                        Response.Write("<script>alert('Your Ticket Number Is "+table.Rows[0][0].ToString() +" Please Save It for Future Reference')</script>");
                    }
                }
                Reqdetails.Visible = false;
            }
        }
        protected void ddllocation_TextChanged(object sender, EventArgs e)
        {
            tickethist.Visible = false;
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.SubLocationHeader INNER JOIN dbo.LocationHeader ON ParentLocationId  = dbo.LocationHeader.LocationID WHERE LocationID = '" + ddllocation.Text + "'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            {
                //ddlsubloc.Items.Add(table.Rows[0]["SubLocName"].ToString());
                //ddlsubloc.Items.Add(table.Rows[0]["SubLocName"].ToString());
                ddlsubloc.DataSource = table;
                ddlsubloc.DataTextField = "SubLocName";
                ddlsubloc.DataValueField = "SubLocId";
                ddlsubloc.DataBind();
            }
            connection.Close();
        }
        public void getdata ()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT [TicketNumber] as [Ticket No], [Ticketdate] as [Date], [TicketType] as [Type], [TicketSubject] as [Subject], [TicketReqInfo] as [Issues], [tckstatus] as [Status] FROM [ticketdetails] Where Tckuserid = '" + Session["tuid"].ToString()+"'",connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            ticketgdv.DataSource = table;
            ticketgdv.DataBind();
            connection.Close();
        }

        protected void ticketgdv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            tickethist.Visible = true;
            ticketgdv.PageIndex = e.NewPageIndex;
            this.getdata();
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Tichistcan_Click(object sender, EventArgs e)
        {
            tickethist.Visible = false;
        }

        protected void rbclear_Click(object sender, EventArgs e)
        {
            ddlstatus.SelectedIndex = -1;
            txtticketno.Text = "";
            getdata();
        }

        protected void rbsearch_Click(object sender, EventArgs e)
        {
            if (txtticketno.Text != "")
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                if (ddlstatus.SelectedIndex == 0)
                {
                    SqlCommand sacmd = new SqlCommand("SELECT [TicketNumber] as [Ticket No], [Ticketdate] as [Date], [TicketType] as [Type], [TicketSubject] as [Subject], [TicketReqInfo] as [Issues], [tckstatus] as [Status] FROM [ticketdetails] Where Tckuserid = '" + Session["tuid"].ToString() + "' and TicketNumber = '" + txtticketno.Text + "'", connection);
                    SqlDataAdapter saadapter = new SqlDataAdapter(sacmd);
                    DataTable satable = new DataTable();
                    saadapter.Fill(satable);
                    ticketgdv.DataSource = satable;
                    ticketgdv.DataBind();
                    tickethist.Visible = true;
                }
                else if (ddlstatus.SelectedIndex == 1)
                {
                    SqlCommand sccmd = new SqlCommand("SELECT [TicketNumber] as [Ticket No], [Ticketdate] as [Date], [TicketType] as [Type], [TicketSubject] as [Subject], [TicketReqInfo] as [Issues], [tckstatus] as [Status] FROM [ticketdetails] Where Tckuserid = '" + Session["tuid"].ToString() + "' and Ticketdate = '" + txtticketno.Text + "'", connection);
                    SqlDataAdapter scadapter = new SqlDataAdapter(sccmd);
                    DataTable sctable = new DataTable();
                    scadapter.Fill(sctable);
                    ticketgdv.DataSource = sctable;
                    ticketgdv.DataBind();
                    ddlstatus.SelectedIndex = -1;
                    txtticketno.Text = "";
                    tickethist.Visible = true;
                }
                else if (ddlstatus.SelectedIndex == 2)
                {
                    SqlCommand sccmd = new SqlCommand("SELECT [TicketNumber] as [Ticket No], [Ticketdate] as [Date], [TicketType] as [Type], [TicketSubject] as [Subject], [TicketReqInfo] as [Issues], [tckstatus] as [Status] FROM [ticketdetails] Where Tckuserid = '" + Session["tuid"].ToString() + "' and TicketType = '" + txtticketno.Text + "'", connection);
                    SqlDataAdapter scadapter = new SqlDataAdapter(sccmd);
                    DataTable sctable = new DataTable();
                    scadapter.Fill(sctable);
                    ticketgdv.DataSource = sctable;
                    ticketgdv.DataBind();
                    ddlstatus.SelectedIndex = -1;
                    txtticketno.Text = "";
                    tickethist.Visible = true;
                }
                else if (ddlstatus.SelectedIndex == 3)
                {
                    SqlCommand sccmd = new SqlCommand("SELECT [TicketNumber] as [Ticket No], [Ticketdate] as [Date], [TicketType] as [Type], [TicketSubject] as [Subject], [TicketReqInfo] as [Issues], [tckstatus] as [Status] FROM [ticketdetails] Where Tckuserid = '" + Session["tuid"].ToString() + "' and tckstatus = '" + txtticketno.Text + "'", connection);
                    SqlDataAdapter scadapter = new SqlDataAdapter(sccmd);
                    DataTable sctable = new DataTable();
                    scadapter.Fill(sctable);
                    ticketgdv.DataSource = sctable;
                    ticketgdv.DataBind();
                    ddlstatus.SelectedIndex = -1;
                    txtticketno.Text = "";
                    tickethist.Visible = true;
                }
                connection.Close();
            }
            else
            {
                Response.Write("<script>alert('Please Insert Search Value')</script>");
            }
        
        }

        protected void imgbtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TicketAssignedDtl.aspx");
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
            SqlCommand cmd = new SqlCommand("SELECT MasterLogin FROM dbo.UserInfo WHERE UserLoginId = '"+Session["tuid"].ToString()+"' and masterlogin = 1 ", mconnection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable mtable = new DataTable();
            adapter.Fill(mtable);
            if(mtable.Rows.Count>0)
            {
                imgbtnmaster.Visible = true;
            }
            else
            {
                imgbtnmaster.Visible = false;
            }
            mconnection.Close();
        }

        protected void tadblogout_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void rsclr_Click(object sender, EventArgs e)
        {
            Reqdetails.Visible = true;
            tickethist.Visible = false;
            tsub.Text = "";
            DDlTicketType.SelectedIndex = -1;
            TReq.Text = "";
            ddllocation.SelectedIndex=-1;
            ddldept.SelectedIndex = -1;
            rtcno.Text = "";
            ddlsubloc.SelectedIndex = -1;
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
            if (urtable.Rows.Count>0)
            {
                imgbtn.Visible = true;
            }
            else
            {
                imgbtn.Visible = false;
            }
            urcon.Close();
        }
    }
}