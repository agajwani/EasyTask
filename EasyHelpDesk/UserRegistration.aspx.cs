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
using System.Windows.Forms;
using System.Security.Cryptography;
using System.IO;
namespace EasyHelpDesk
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        
        
                
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void urbclear_Click(object sender, EventArgs e)
        {
            urtemail.Text = "";
            urtfname.Text = "";
            urtlname.Text = "";
            urtmname.Text = "";
            urtmno1.Text = "";
            urtmno2.Text = "";
            urtpass.Text = "";
            urtph1.Text = "";
            urtph2.Text = "";
            urtuname.Text = "";
            DDLdeptid.SelectedIndex = -1;
            ddldesg.SelectedIndex = -1;
            DDLsal.SelectedIndex = -1;
            urcmsl.Checked = false;
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
        protected void urbsignup_Click(object sender, EventArgs e)
        {
            try
            {
                if (urtfname.Text == "")
                {
                    // this.Page.ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", "alert('Fill required Information')", true);
                    Response.Write("<script>alert('Fill required Information')</script>");
                    urtfname.Focus();
                }
                else if (urtlname.Text == "")
                {
                    Response.Write("<script>alert('Fill required Information')</script>");
                    urtlname.Focus();
                }
                else if (urtuname.Text == "")
                {
                    Response.Write("<script>alert('Fill required Information')</script>");
                    urtuname.Focus();
                }
                else if (urtpass.Text == "")
                {
                    Response.Write("<script>alert('Fill required Information')</script>");
                    urtpass.Focus();
                }
                else
                {
                    string allowms = urcmsl.Checked ? "1" : "0"; 
                    SqlConnection connection = new SqlConnection();
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("Insert into UserInfo (UserSalutation,UserFirstName,UserOtherName,UserLastName,DeptId,DesignationId,UserMobileNo1,UserMobileNo2,UserTelephone1,UserTelephone2,UserEmailId,UserLoginId,UserLoginPassword,ActionDate,DocumentDate,ActionMenuCode,MasterLogin,ActionUserId) values ('" + DDLsal.Text + "','" + urtfname.Text + "','" + urtmname.Text + "','" + urtlname.Text + "','" + DDLdeptid.Text + "', '" + ddldesg.SelectedIndex + "','" + urtmno1.Text + "','" + urtmno2.Text + "','" + urtph1.Text + "','" + urtph2.Text + "','" + urtemail.Text + "','" + urtuname.Text + "','" + Encrypt(urtpass.Text) + "','" + System.DateTime.Now + "','" + System.DateTime.Now + "','" + uri.Text + "','" + allowms+"','"+Session["Uid"]+"')", connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    urtemail.Text = "";
                    urtfname.Text = "";
                    urtlname.Text = "";
                    urtmname.Text = "";
                    urtmno1.Text = "";
                    urtmno2.Text = "";
                    urtpass.Text = "";
                    urtph1.Text = "";
                    urtph2.Text = "";
                    urtuname.Text = "";
                    DDLdeptid.SelectedIndex = -1;
                    ddldesg.SelectedIndex = -1;
                    DDLsal.SelectedIndex = -1;
                    urcmsl.Checked = false;
                    Response.Write("<script>alert('Sign Up Successfull')</script>");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message,"Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
                //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "ex", "alert('" + ex.Message + "');", true);
                //Response.Write("<script>alert('"+ex.Message+"')</script>");
            }
        }

        protected void urbcancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }

        protected void urbview_Click(object sender, EventArgs e)
        {
            Response.Redirect("userdetailview.aspx");
        }

        //protected void urbedit_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("UserEditDtl.aspx");
        //}
    }
}