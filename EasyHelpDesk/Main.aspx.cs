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
                if (ddllocation.SelectedIndex != 0)
                {
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Department INNER JOIN dbo.LocationHeader ON ParentDeptId = dbo.LocationHeader.LocationID WHERE LocationID = '" + ddllocation.Text + "'", connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    if (table.Rows.Count > 0)
                    {
                        ddldept.Items.Add(table.Rows[0]["DeptName"].ToString());
                    }
                    Reqdetails.Visible = true;
                }
                else
            {
                tickethist.Visible = false;
                Reqdetails.Visible = false;
            }
        }
        
        
        protected void mbreq_Click(object sender, EventArgs e)
        {
            tickethist.Visible = false;
            Reqdetails.Visible = true;
        }

        protected void rbcancel_Click(object sender, EventArgs e)
        {
            Reqdetails.Visible = false;
        }

        protected void mbhis_Click(object sender, EventArgs e)
        {
            Reqdetails.Visible = false;
            tickethist.Visible = true;
            getdata();
        }

        protected void rbsubmit_Click(object sender, EventArgs e)
        {
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
                if (Rfupload.HasFile)
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
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    ddldept.SelectedIndex = -1;
                    ddllocation.SelectedIndex = -1;
                    DDlTicketType.SelectedIndex = -1;
                    tsub.Text = "";
                    TReq.Text = "";
                    rtcno.Text = "";
                    Response.Write("<script>alert('Request Sumbitted Successfully')</script>");
                    Response.Redirect("Main.aspx");
                }
            }
        }
        protected void ddllocation_TextChanged(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Department INNER JOIN dbo.LocationHeader ON ParentDeptId = dbo.LocationHeader.LocationID WHERE LocationID = '" + ddllocation.Text + "'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            if (table.Rows.Count > 0)
            {
                ddldept.Items.Add(table.Rows[0]["DeptName"].ToString());
            }
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
        }
    }
}