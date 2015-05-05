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
    public partial class Farmerlogin : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
                string query = "select * from Tbl_farmerRegister where Name='" + txtfrmname.Text + "'  and Password='" + txtpassword.Text + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    Session["farmername"] = txtfrmname.Text;
                    Session["fpassword"] = txtpassword.Text;
                    Response.Write(@"<script language='javascript'>window.alert('Login successfully...');<" + "/script>");
                    Response.Redirect("AddProducts.aspx");
                }
                else
                {
                    Response.Write(@"<script language='javascript'>window.alert('login failed!!...');<" + "/script>");
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
            txtfrmname.Text = "";
            txtpassword.Text = "";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                Clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"');</script>"); 
            }
        }
    }
}