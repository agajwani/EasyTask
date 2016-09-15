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
using System.Security.Cryptography;
using System.IO;

namespace EasyHelpDesk
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            //string EncryptionKey = "************";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
        public void logintrack()
        {
            SqlConnection tconnction = new SqlConnection();
            tconnction.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            tconnction.Open();
            SqlCommand slcmd = new SqlCommand("Select userloginid from usersinfo where userloginid ='" + ddluname.Text + "'", tconnction);
            Session["tuid"] = ddluname.Text;
            SqlCommand tcmd = new SqlCommand("SP_TRACK_USERLOG_easytask", tconnction);
            tcmd.CommandType = CommandType.StoredProcedure;
            tcmd.Parameters.AddWithValue("@username", Session["tuid"].ToString());
            tcmd.Parameters.AddWithValue("@COMMAND", 0);
            tcmd.ExecuteNonQuery();
        }
        public void response()
        {
            SqlConnection rcon = new SqlConnection();
            rcon.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            rcon.Open();
            SqlCommand rcmd = new SqlCommand("Select Defaultrole from UserInfo where Userloginid = '" + Session["tuid"].ToString() + "'and Defaultrole='Service Agent'", rcon);
            SqlDataAdapter radapter = new SqlDataAdapter(rcmd);
            DataTable rtable = new DataTable();
            radapter.Fill(rtable);
            if (rtable.Rows.Count>0)
            {
                Response.Redirect("TicketAssignedDtl.aspx");
            }
            else
            {
                Response.Redirect("Main.aspx");
            }
            rcon.Close();
        }
        protected void lbsign_Click1(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select Userloginid,Userloginpassword from UserInfo where userloginid='" + ddluname.Text + "' and userloginpassword = '" + Encrypt(ltpass.Text) + "'",connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            {
                logintrack();
                response();
                //Response.Redirect("Main.aspx");
            }
            else
            {
                Response.Write("Login Failed");
                //Response.Write("<script>alert('Invalid Username or Password')");
            }
            connection.Close();
        }
    }
}