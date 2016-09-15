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
using System.Web.Security;
using System.Windows.Forms;

namespace EasyHelpDesk
{
    public partial class MastersLogin : System.Web.UI.Page
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
        public void Login_tim()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand scmd = new SqlCommand("Select userloginid from usersinfo where userloginid ='" + MLDDLuname.Text + "'", connection);
            Session["TUID"] = MLDDLuname.Text;
              
            SqlCommand lcmd = new SqlCommand("SP_TRACK_USERLOG", connection);
            lcmd.CommandType = CommandType.StoredProcedure;
            lcmd.Parameters.AddWithValue("@username", Session["TUID"].ToString());
            lcmd.Parameters.AddWithValue("@COMMAND", 0);
            lcmd.ExecuteNonQuery();
            connection.Close();
        }
        protected void usblogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                SqlCommand cmd = new SqlCommand("select userloginid,UserLoginPassword from userinfo where userloginid ='" + MLDDLuname.Text + "' and userloginpassword ='" + Encrypt(ustupass.Text) + "'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);
                if (table.Rows.Count > 0)
                {
                    Login_tim();
                    Response.Redirect("Masters.aspx");
                }

                else
                {
                    Response.Write("<script>alert('Invalid Username Or Password.')</script>");
                }
                connection.Close();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }  
           
        }

        protected void ustupass_TextChanged(object sender, EventArgs e)
        {

        }
    }
}