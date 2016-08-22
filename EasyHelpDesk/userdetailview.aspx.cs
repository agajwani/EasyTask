using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Diagnostics;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Windows.Forms;
using System.Xml.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace EasyHelpDesk
{
    public partial class userdetailview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Databindgrid();
            }

        }
        private void Databindgrid()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT  dbo.UserInfo.UserSalutation AS [Salutation],dbo.UserInfo.UserFirstName AS[First Name],dbo.UserInfo.UserOtherName AS[Middle Name],dbo.UserInfo.UserLastName AS[Last Name],dbo.Department.DeptName AS[Dept Name],dbo.Designation.DesignationName AS[Designation Name],dbo.UserInfo.UserMobileNo1 AS[Mobile No],dbo.UserInfo.UserTelephone1 AS[Telephone],dbo.UserInfo.UserEmailId AS[Email Id],dbo.UserInfo.UserLoginId AS[Username],dbo.UserInfo.UserIsLocked AS[User Locked],dbo.UserInfo.DocumentDate AS[Created Date],dbo.UserInfo.ActiveStatus as [Active Status],dbo.UserInfo.MasterLogin as [Master Access Allowed] FROM dbo.Department INNER JOIN dbo.UserInfo ON dbo.UserInfo.DeptId = dbo.Department.DeptId INNER JOIN dbo.Designation ON dbo.Designation.DesignationId = dbo.UserInfo.DesignationId", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            {
                vgdv.DataSource = table;
                vgdv.DataBind();
            }

        }

        protected void vgdv_RowCreated(object sender,System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            //if(!string.IsNullOrEmpty(txtfind.Text))
            //{
            //    msg.InnerText = "Found" + vgdv.Rows.Count + "Rows Matching keywords'" + txtfind.Text + "'.";

            //}
        }

        protected void fbfind_Click(object sender, EventArgs e)
        {
            
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select dbo.UserInfo.UserSalutation AS [Salutation] ,dbo.UserInfo.UserFirstName AS[First Name],dbo.UserInfo.UserOtherName AS[Middle Name],dbo.UserInfo.UserLastName AS[Last Name],dbo.Department.DeptName AS[Dept Name],dbo.Designation.DesignationName AS[Designation Name],dbo.UserInfo.UserMobileNo1 AS[Mobile No],dbo.UserInfo.UserTelephone1 AS[Telephone],dbo.UserInfo.UserEmailId AS[Email Id],dbo.UserInfo.UserLoginId AS[Username],dbo.UserInfo.UserIsLocked AS[User Locked],dbo.UserInfo.DocumentDate AS[Created Date],dbo.UserInfo.ActiveStatus as [Active Status],dbo.UserInfo.MasterLogin as [Master Access Allowed] FROM  dbo.Department INNER JOIN dbo.UserInfo ON dbo.UserInfo.DeptId = dbo.Department.DeptId INNER JOIN dbo.Designation ON dbo.Designation.DesignationId = dbo.UserInfo.DesignationId where " + ddlfindlist.SelectedValue + "='"+ftdata.Text+"'", connection);
            SqlDataAdapter adapter = new SqlDataAdapter (cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if(table.Rows.Count>0)
            {
                vgdv.DataSource = table;
                vgdv.DataBind();
            }
            ftdata.Text = "";  
        }

        protected void fbrefresh_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["easytaskconnectionstring"].ConnectionString;
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT  dbo.UserInfo.UserSalutation AS [Salutation],dbo.UserInfo.UserFirstName AS[First Name],dbo.UserInfo.UserOtherName AS[Middle Name],dbo.UserInfo.UserLastName AS[Last Name],dbo.Department.DeptName AS[Dept Name],dbo.Designation.DesignationName AS[Designation Name],dbo.UserInfo.UserMobileNo1 AS[Mobile No],dbo.UserInfo.UserTelephone1 AS[Telephone],dbo.UserInfo.UserEmailId AS[Email Id],dbo.UserInfo.UserLoginId AS[Username],dbo.UserInfo.UserIsLocked AS[User Locked],dbo.UserInfo.DocumentDate AS[Created Date],dbo.UserInfo.ActiveStatus as [Active Status],dbo.UserInfo.MasterLogin as [Master Access Allowed] FROM dbo.Department INNER JOIN dbo.UserInfo ON dbo.UserInfo.DeptId = dbo.Department.DeptId INNER JOIN dbo.Designation ON dbo.Designation.DesignationId = dbo.UserInfo.DesignationId", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            {
                vgdv.DataSource = table;
                vgdv.DataBind();
            }
        }

        protected void Fbcancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }

        protected void vgdv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            vgdv.PageIndex = e.NewPageIndex;
            this.Databindgrid();
        }

        protected void fbexport_Click(object sender, EventArgs e)
        {
            //if (ddlEXPORT.SelectedIndex != 0)
            {
                if (ddlEXPORT.SelectedValue == "PDF")
                {
                    String attachmentpdf = "attachmentexcel; filename=User Data Report Pdf.pdf";
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", attachmentpdf);
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    StringWriter sw = new StringWriter();
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    HtmlForm frm = new HtmlForm();
                    vgdv.Parent.Controls.Add(frm);
                    frm.Attributes["runat"] = "server";
                    frm.Controls.Add(vgdv);
                    frm.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    Response.Write(pdfDoc);
                    Response.End();
                }
                if(ddlEXPORT.SelectedValue=="EXCEL")
                {
                    String attachmentexcel = "attachmentpdf; filename=User Data Report Excel.xls";
                    Response.ClearContent();
                    Response.AddHeader("content-disposition", attachmentexcel);
                    Response.ContentType = "application/ms-excel";
                    StringWriter sw = new StringWriter();
                    HtmlTextWriter htw = new HtmlTextWriter(sw);
                    HtmlForm hfrm = new HtmlForm();
                    vgdv.Parent.Controls.Add(hfrm);
                    hfrm.Attributes["runat"] = "server";
                    hfrm.Controls.Add(vgdv);
                    hfrm.RenderControl(htw);
                    Response.Write(sw.ToString());
                    Response.End();
                }
                if(ddlEXPORT.SelectedValue=="WORD")
                {
                    Response.Clear();
                    Response.Buffer = true;
                    Response.AddHeader("content-disposition",
                    "attachment;filename= User Data Report Word.doc");
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.ms-word ";
                    StringWriter sw = new StringWriter();
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    HtmlForm hfrmw = new HtmlForm();
                    hfrmw.Attributes["runat"] = "server";
                    hfrmw.Controls.Add(vgdv);
                    vgdv.RenderControl(hw);
                    Response.Output.Write(sw.ToString());
                    Response.Flush();
                    Response.End();
                    
                }

            }
        }

        protected void vgdv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            

        }
    }
}