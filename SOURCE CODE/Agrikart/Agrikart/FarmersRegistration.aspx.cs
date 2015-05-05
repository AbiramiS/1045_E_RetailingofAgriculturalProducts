using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace Agrikart
{
    public partial class FarmersRegistration : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {                  
                string Query = "insert into Tbl_farmerRegister (Name,Gender,Address,MobileNumber,Pincode,AccountNumber,Email,Password,ConfirmPassword,Hint,Answer) values ('" + txtname.Text + "','" + rdgender.SelectedItem.Text + "','" + txtaddress.Text + "','" + txtcontact.Text + "','" + txtpin.Text + "','" + txtacno.Text + "','" + txtemail.Text + "','" + txtpass.Text + "','" + txtconfrmpassword.Text + "','" + ddlhint.SelectedItem.Text + "','" + txtans.Text + "')";
                con.Open();
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write(@"<script language='javascript'>window.alert('Registered Successfully...')</script>");
                cleardata();
              
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"');</script>");               
            }
        }
        void cleardata()
        {
            txtname.Text = "";
            rdgender.ClearSelection();
            txtaddress.Text = "";
            txtcontact.Text = "";
            txtpin.Text = "";
            txtacno.Text = "";
            txtemail.Text = "";
            txtpass.Text = "";
            txtconfrmpassword.Text = "";
            ddlhint.ClearSelection();
            txtans.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                cleardata();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"')</script>");
            }

        }       
    }
}