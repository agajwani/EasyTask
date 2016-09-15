using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Data;

namespace test1
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        byte up;
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
        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtcurrpwd.Text == "")
                {
                    Response.Write("<script>alert('Fill required Information')</script>");
                    txtcurrpwd.Focus();
                }
                else if (txtnewpwd.Text == "")
                {
                    Response.Write("<script>alert('Fill required Information')</script>");
                    txtnewpwd.Focus();
                }
                else
                {
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select UserLoginPassword from UserInfo where UserLoginPassword='" + Encrypt(txtcurrpwd.Text) + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable table = new DataTable();
                    da.Fill(table);
                    if (table.Rows.Count>0)
                    {
                        SqlCommand cmdd = new SqlCommand("UPDATE UserInfo SET UserLoginPassword='" + Encrypt(txtnewpwd.Text) + "'where UserLoginId='" + ddlusername.Text + "' ", con);
                        {
                            Response.Write("<script>alert('Password updated succesfully')</script>");
                            txtcurrpwd.Text = "";
                            txtnewpwd.Text = "";
                            ddlusername.SelectedIndex = -1;
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Execution Error')</script>");

                    }
                  
                }

            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {

        }
    }
}