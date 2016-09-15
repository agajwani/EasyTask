using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace EasyHelpDesk
{
    public partial class UserEditdtl : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
                
            //if (Page.PreviousPage.ClientQueryString != null)
            {
                
                string id = Request.QueryString["Id"];
                SqlConnection connection = new SqlConnection();
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connection.Open();
                SqlCommand cmd = new SqlCommand("Select * from userinfo where UserLoginId='" + id + "'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);
                if (table.Rows.Count > 0)
                {
                    ddlsal.Items.Add(table.Rows[0][1].ToString());
                    //uetsalu.Text = table.Rows[0][1].ToString();
                    urtuserid.Text = table.Rows[0][0].ToString();
                    urtfname.Text = table.Rows[0][2].ToString();
                    urtmname.Text = table.Rows[0][3].ToString();
                    urtlname.Text = table.Rows[0][4].ToString();
                    urtmno1.Text = table.Rows[0][7].ToString();
                    urtmno2.Text = table.Rows[0][8].ToString();
                    urtph1.Text = table.Rows[0][9].ToString();
                    urtph2.Text = table.Rows[0][10].ToString();
                    urtuname.Text = table.Rows[0][12].ToString();
                    urtemail.Text = table.Rows[0][11].ToString();
                    uetdesg.Text = table.Rows[0][6].ToString();
                    uetdept.Text = table.Rows[0][5].ToString();
                    ddldeptrole.Items.Add(table.Rows[0][21].ToString());
                    urcmsl.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0][20].ToString()));
                    cbinactive.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0][19].ToString()));
                    urcsr.Checked = Convert.ToBoolean(Convert.ToInt32(table.Rows[0][22].ToString()));
                }
                else
                {

                }
                connection.Close();
            }
                
                {
                SqlConnection connection2 = new SqlConnection();
                connection2.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                //SqlCommand cmd2 = new SqlCommand("SELECT dbo.Department.DeptName FROM dbo.Department INNER JOIN dbo.UserInfo ON dbo.UserInfo.DeptId = dbo.Department.DeptId WHERE dbo.UserInfo.DeptId='" + uetdept.Text + "'", connection2);
                SqlCommand cmd2 = new SqlCommand("SELECT DeptName,DeptId FROM dbo.Department WHERE DeptId='" + uetdept.Text+ "'", connection2);
                SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
                DataTable table2 = new DataTable();
                adapter2.Fill(table2);
                if (table2.Rows.Count > 0)
                {
                    
                    //ddldept.Items.Add(table2.Rows[0][("DeptName")].ToString());
                    uetdept0.Text= (table2.Rows[0][("DeptName")].ToString());
                }
                {
                    SqlConnection connection3 = new SqlConnection();
                    connection3.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                    SqlCommand cmd3 = new SqlCommand("Select DesignationName,DesignationId from Designation  where DesignationID = '" + uetdesg.Text + "'", connection3);
                    SqlDataAdapter adapter3 = new SqlDataAdapter(cmd3);
                    DataTable table3 = new DataTable();
                    adapter3.Fill(table3);
                    if(table3.Rows.Count>0)
                    {
                        //ddldesg.Items.Add(table3.Rows[0]["DesignationName"].ToString());
                        uetdesg0.Text= (table3.Rows[0]["DesignationName"].ToString());


                    }
                    connection2.Close();
                } 
            }
            }

        

        
        protected void urbcancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("userdetailview.aspx");
        }

        protected void urbsave_Click(object sender, EventArgs e)
        {
            if(ddlsal.SelectedValue=="0")
            {
                Response.Write("<script>alert('Select Is Not an Valid Salutation Please Select correct Salutation.')</script>");
                ddlsal.Focus();
            }
            else if(ddldesg.SelectedValue=="0" )
            {
                Response.Write("<script>alert('Select Is Not an Valid Designation Please Select correct Designation.')</script>");
                ddldesg.Focus();
            }
            else if (ddldept.SelectedValue == "0")
            {
                Response.Write("<script>alert('Select Is Not an Valid Department Please Select correct Department.')</script>");
                ddldept.Focus();
            }
            else if(urtfname.Text=="")
            {
                Response.Write("<script>alert('Please Fill all required Field.')</script>");
                urtfname.Focus();
            }
            else if(urtlname.Text=="")
            {
                Response.Write("<script>alert('Please Fill all required Field.')</script>");
                urtlname.Focus();
            }
            else if (urtmno1.Text=="")
            {
                Response.Write("<script>alert('Please Fill all required Field.')</script>");
                urtmno1.Focus();
            }
            else if (urtuname.Text=="")
            {
                Response.Write("<script>alert('Please Fill all required Field.')</script>");
                urtuname.Focus();
            }
            else if(ddldeptrole.SelectedIndex==0)
            {
                Response.Write("<script>alert('Please Assign Defalult Role To User Select Cannot Be Default Role')</script>");
            }
            else
            {

                
                string masl = urcmsl.Checked ? "1" : "0";
                string actstat = cbinactive.Checked ? "1" : "0";
                string userrole = urcsr.Checked ? "1" : "0";
                SqlConnection connectionupdate = new SqlConnection();
                connectionupdate.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
                connectionupdate.Open();
                SqlCommand cmdupdate = new SqlCommand("Update UserInfo Set UserSalutation = '" + ddlsal.Text + "',UserFirstName='" + urtfname.Text + "',UserOtherName = '" + urtmname.Text + "',UserLastName = '" + urtlname.Text + "',DeptId='" + ddldept.Text + "',DesignationId='" + ddldesg.Text + "',UserMobileNo1='" + urtmno1.Text + "',UserMobileNo2='" + urtmno2.Text + "',UserTelephone1='" + urtph1.Text + "',UserTelephone2='" + urtph2.Text + "',UserEmailId='" + urtemail.Text + "',UserLoginId='" + urtuname.Text + "',ActionDate= '" + System.DateTime.Now+ "',ActiveStatus='" + actstat + "',MasterLogin='" + masl + "',ActionUserId='" + Session["TUID"] + "',DefaultRole='" + ddldeptrole.Text + "',AllowSwitchRole='"+userrole+"',ActionMenuCode='" + uri.Text+"' where userid = '" + urtuserid.Text+ "'", connectionupdate);
                cmdupdate.ExecuteNonQuery();
                connectionupdate.Close();
                urtemail.Text = "";
                urtfname.Text = "";
                urtlname.Text = "";
                urtmname.Text = "";
                urtmno1.Text = "";
                urtmno2.Text = "";
                urtph1.Text = "";
                urtph2.Text = "";
                urtuname.Text = "";
                ddldept.SelectedIndex = 0;
                ddldesg.SelectedIndex = 0;
                ddlsal.SelectedIndex = 0;
                urcmsl.Checked = false;
                cbinactive.Checked = false;
                Response.Write("<script>alert('Update Successfull')</script>");
                connectionupdate.Close();
            }
        }
    }
    }

