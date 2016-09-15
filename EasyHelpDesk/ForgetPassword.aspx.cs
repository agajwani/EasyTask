using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EasyHelpDesk
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            //byte[] cipherBytes = Convert.FromBase64String(cipherText);
            byte[] cipherBytes = Convert.FromBase64String(cipherText.Replace("+", ""));
            int charcount = Decode.GetCharCount(cipherBytes, 0, cipherBytes.Length);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
        
        protected void fgbshow_Click(object sender, EventArgs e)
        {
            //fgtpass.Text = ( "fc0iUkg331qk3V8HY6MWvQ==");
            
            SqlConnection connectoin = new SqlConnection();
            connectoin.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            SqlCommand cmd = new SqlCommand("Select UserLoginPassword from userinfo where userloginid = '" + Fgduname.Text + "'", connectoin);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            {
                fgtpass.Text = table.Rows[0][("UserLoginPassword")].ToString();
                fgtpass2.Text = Decrypt(fgtpass.Text);//.ToString();
            }
            connectoin.Close();

        }

    }
}