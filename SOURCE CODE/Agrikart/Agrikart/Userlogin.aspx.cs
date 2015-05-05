using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace Agrikart
{
    public partial class Userlogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string query = "select * from Tbl_UserRegistration Where Name='" + txtuser.Text + "' and Password='" + txtpassword.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["username"] = txtuser.Text;
                    Session["password"] = txtpassword.Text;
                    Response.Write(@"<script language='javascript'>window.alert('login Sucessfully...')</script>");
                    Response.Redirect("SellProducts.aspx");
                }
                else
                {
                    Response.Write(@"<script language='javascript'>window.alert('login failed...')</script>");
                }
                con.Close();
                Clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "');</script>"); 
            }
        }
        private void Clear()
        {
            txtuser.Text = "";
            txtpassword.Text = "";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}