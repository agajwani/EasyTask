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
    public partial class SublocationUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            {
                string active = cbactive.Checked ? "1" : "0";
                SqlConnection uconnection = new SqlConnection();
                uconnection.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
                uconnection.Open();
                if (ddldepartcategory.SelectedIndex == 0 || ddllocation.SelectedIndex == 0 || ddldeptname.SelectedIndex == 0)
                {
                    Response.Write("<script>alert('Select Is Not An Valid Option Please Select Valid Option to Update')</script>");
                }
                else
                {
                    if (txtmoddept.Text == "")
                    {
                        SqlCommand utcmd = new SqlCommand("Update SubLocationHeader set SubLocName = '" + ddldeptname.DataValueField + "',SubLocCategory='" + ddldepartcategory.Text + "',ParentLocationId='" + ddllocation.Text + "',ActionDate='" + DateTime.Now + "',ActionMenuCode='" + uri.Text + "',ActionUserId='" + Session["tuid"].ToString() + "',ActiveStatus='" + active + "' where SubLocId = '" + ddldeptname.Text + "'",uconnection);
                        utcmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Data For Sub Location " + ddldepartcategory.DataValueField + " Updated Successfully')</script>");
                        txtmoddept.Text = "";
                        txtlocation.Text = "";
                        txtdeptcat.Text = "";
                        ddldepartcategory.SelectedIndex = -1;
                        ddldeptname.SelectedIndex = -1;
                        ddllocation.SelectedIndex = -1;
                        uconnection.Close();
                        cbactive.Checked = false;
                    }
                    else
                    {
                        SqlCommand udcmd = new SqlCommand("Update SubLocationHeader set SubLocName = '" + txtmoddept.Text + "',SubLocCategory='" + ddldepartcategory.Text + "',ParentLocationId='" + ddllocation.Text + "',ActionDate='" + DateTime.Now + "',ActionMenuCode='" + uri.Text + "',ActionUserId='" + Session["tuid"].ToString() + "',ActiveStatus='" + active + "' where SubLocId = '" + ddldeptname.Text + "'",uconnection);
                        udcmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Data For Sub Location " + ddldepartcategory.DataValueField + " Updated Successfully')</script>");
                        txtmoddept.Text = "";
                        txtlocation.Text = "";
                        txtdeptcat.Text = "";
                        ddldepartcategory.SelectedIndex = -1;
                        ddldeptname.SelectedIndex = -1;
                        ddllocation.SelectedIndex = -1;
                        uconnection.Close();
                        cbactive.Checked = false;
                    }
                }
                
                }
            }
        
        public void getdata()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("select lh.LocationName,* from SubLocationHeader slh inner join LocationHeader lh on lh.LocationID = slh.ParentLocationId  where SubLocId ='" + ddldeptname.Text + "'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            txtdeptcat.Text = table.Rows[0]["SubLocCategory"].ToString();
            txtlocation.Text = table.Rows[0]["LocationName"].ToString();
            cbactive.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0]["ActiveStatus"].ToString()));
            connection.Close();
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sublocationmaster.aspx");
        }

        protected void ddldeptname_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddldeptname.SelectedIndex==0)
            {
                Response.Write("<script>alert('Please Select Valid Sub Location To Update')</script>");
            }
            else
            {
                getdata();
            }
            
        }
    }
}