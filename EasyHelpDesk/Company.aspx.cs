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
    public partial class Company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            if(txtcopname.Text=="")
            {
                //Response.Write("<script>alert('Comapny Name Cannot Be Blank')</script>");
                Response.Write("<script>alert('Comapny Name Cannot Be Blank')</script>");
                txtcopname.Focus();
            }
            else if(txtcomppre.Text=="")
            {
                Response.Write("<script>alert('Company Prefix Cannot Be Blank And Not More Than 4 Characters')</script>");
                txtcomppre.Focus();
            }
            else if(txtcity.Text=="")
            {
                Response.Write("<script>alert('City Cannot Be Blank')</script>");
                txtcity.Focus();
            }
            else if(txtstate.Text=="")
            {
                Response.Write("<script>alert('State Cannot Be Blank')</script>");
                txtstate.Focus();
            }
            else if(txtcountry.Text=="")
            {
                Response.Write("<script>alert('Country Cannot Be Blank')</script>");
                txtcountry.Focus();
            }
            else if(txtpin.Text=="")
            {
                Response.Write("<script>alert('Pincode Cannot Be Blank')</script>");
                txtpin.Focus();
            }
            else if (txttel1.Text=="")
            {
                Response.Write("<script>alert('Contact Number Cannot Be Blank')</script>");
                txttel1.Focus();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into Company (CompName,CompAddress1,CompCity,CompState,CompCountry,CompPinCode,CompTelephone1,CompTelephone2,CompContactPerson,CompEmailId,CompWebsite,ActionUserId,ActionMenuCode,ActionDate,DocumentDate,companyprefix) values ('"+txtcopname.Text+"','"+txtadd1.Text+"','"+txtcity.Text+"','"+txtstate.Text+"','"+txtcountry.Text+"','"+txtpin.Text+"','"+txttel1.Text+"','"+txtte2.Text+"','"+txtperson.Text+"','"+email.Text+"','"+website.Text+"','"+Session["tuid"].ToString()+"','"+lblcomp.Text+"','"+ DateTime.Today.ToString("yyyy-MM-dd HH:mm:ss") +"','"+DateTime.Today.ToString("yyyy-MM-dd HH:mm:ss") +"','"+txtcomppre.Text+"')",connection);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Comapny With Name " + txtcopname.Text + " Created Successfully')</script>");
                txtadd1.Text = "";
                txtcity.Text = "";
                txtcomppre.Text = "";
                txtcopname.Text = "";
                txtcountry.Text = "";
                txtperson.Text = "";
                txtpin.Text = "";
                txtstate.Text = "";
                txtte2.Text = "";
                txttel1.Text = "";
                email.Text = "";
                website.Text = "";
            }
        }
    }
}