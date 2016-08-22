using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace test1
{
    public partial class LocationMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtlocation.Text == "")
                {
                    Response.Write("<script>alert('Fill required Information')</script>");
                    txtlocation.Focus();
                }
                else if (txtloccat.Text == "")
                {
                    Response.Write("<script>alert('Fill Required Information')</script>");
                    txtloccat.Focus();
                }
                else
                {
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
                    con.Open();
                   // Response.Write("<script>alert('Details added successfully')</script>");
                    SqlCommand cmd = new SqlCommand("insert into LocationHeader (LocationName,LocationCatg,ActionMenucode,ActionDate,DocumentDate,ActionUserId) VALUES('" + txtlocation.Text+"','"+txtloccat.Text+"','"+ Location.Text+"','"+System.DateTime.Now+"','"+System.DateTime.Now+"', '"+Session["Uid"]+"')",con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    txtlocation.Text = "";
                    txtloccat.Text = "";
                    Response.Write("<script>alert('Details added successfully')</script>");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            Response.Redirect("LocationMasterUpdate.aspx");
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }
    }
}