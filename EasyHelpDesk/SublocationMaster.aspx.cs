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
    public partial class SublocationMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
            connection.Open();
            if (ddllocation.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Please Insert Location For This Sub Location')</script>");
            }
            else if (txtsubloc.Text == "")
            {
                Response.Write("<script>alert('Please Insert All Required Data')</script>");
                txtsubloc.Focus();
            }
            else if (ddlSubloccategory.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Please Mention Category For This SuB Location')</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Insert Into SubLocationHeader (SubLocName,SubLocCategory,ParentLocationId,ActionUserId,ActionMenuCode,ActionDate,DocumentDate) values('"+txtsubloc.Text+"','"+ddlSubloccategory.Text+"','"+ddllocation.Text+"','"+Session["tuid"].ToString()+"','"+ SubLocation.Text+ "','"+System.DateTime.Now+"','"+System.DateTime.Now+"')",connection);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Sub Location With Name "+txtsubloc.Text+" Created Successfully')</script>");
                txtsubloc.Text = "";
                ddllocation.SelectedIndex = -1;
                ddlSubloccategory.SelectedIndex = -1;
        }
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sublocationupdate.aspx");
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }
    }
}