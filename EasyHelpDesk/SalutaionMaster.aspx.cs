using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;

public partial class SalutaionMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtsalutation.Text=="")
            {
                Response.Write("<script>alert('Fill required Information')</script>");
                txtsalutation.Focus();
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["EasyTaskConnectionString"].ConnectionString;
                con.Open();
                //Response.Write("<script>alert('sucessfull')</script>");
                SqlCommand cmd = new SqlCommand("insert into SalutationHeader (SalutationName,GenderCode,ActionMenucode,ActionDate,DocumentDate,ActionUSerId) VALUES ('" + txtsalutation.Text+"','"+ddlgender.Text+"','"+usercode.Text+"','"+System.DateTime.Now+"','"+System.DateTime.Now+"','"+Session["Uid"]+"')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                txtsalutation.Text = "";
                ddlgender.SelectedIndex = -1;
                Response.Write("<script>alert('Details added successfully')</script>");
            }
            
        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Masters.aspx");
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        Response.Redirect("SalutationMasterUpdate.aspx");
    }
}