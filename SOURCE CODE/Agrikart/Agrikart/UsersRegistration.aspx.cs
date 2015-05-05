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
    public partial class UsersRegistration : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string query = "Insert into Tbl_UserRegistration(Name,Emailid,MobileNumber,Password,ConfirmPassword) values('" + txtusername.Text + "','" + txtemail.Text + "','" + txtmobile.Text + "','" + txtpassword.Text + "','" + txtconfirmpassword.Text + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write(@"<script language='javascript'>window.alert('Registered Sucessfully...');<" + "/script>");
                clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"')</script>");
            }            
        }

        void clear()
        {
            txtusername.Text = "";            
            txtemail.Text = "";
            txtmobile.Text = "";
            txtpassword.Text = "";
            txtconfirmpassword.Text = "";
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            try
            {
                clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "')</script>");
            }
        }   
    }
}