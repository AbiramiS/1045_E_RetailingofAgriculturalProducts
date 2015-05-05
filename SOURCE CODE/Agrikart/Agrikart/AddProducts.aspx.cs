using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Agrikart
{
    public partial class AddProducts : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        double price = 0;
        double quantity = 0;
        double totalprice = 0;
        int RegID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {           
            try
            {
                if (ddlProdType.SelectedValue.ToString() != "Select")
                {
                    price = Convert.ToDouble(txtPrice.Text);
                    quantity = Convert.ToDouble(txtQuty.Text);
                    if (price != 0 && quantity != 0)
                    {
                        totalprice = price * quantity;
                        txtTotalPrice.Text = Convert.ToString(totalprice);
                    }
                    else
                    {
                        Response.Write(@"<script language='javascript'>window.alert('Price and quantity deos not empty...');<" + "/script>");
                    }
                    RegID = farmerid();
                    con.Open();                    
                    string fileNm = fileupload1.FileName;
                    fileupload1.SaveAs(Server.MapPath("ProductImages/") + fileNm);

                    string iQ = "Insert into [AddProducts] values('" + txtProdName.Text + "','" + ddlProdType.SelectedValue.ToString() + "','" + txtPrice.Text + "','" + fileNm + "','" + DateTime.Now.ToShortDateString() + "','" + DateTime.Now.ToShortDateString() + "'," + RegID + ",'" + txtTotalPrice.Text + "','" + txtQuty.Text + "')";
                    SqlCommand cmd = new SqlCommand(iQ, con);
                    cmd.ExecuteNonQuery();
                    Response.Write(@"<script language='javascript'>window.alert('Products Added successfully...');<" + "/script>");
                    con.Close();
                    Clear();
                }
                else
                {
                    Response.Write(@"<script language='javascript'>window.alert('Select any product type...');<"+"/script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"');</script>");               
            }
        }
        public int farmerid()
        {
            int res = 0;
            try
            {
                string name = Session["farmername"].ToString();
                string password = Session["fpassword"].ToString();
                con.Open();
                string sQ = "select Farmerid from Tbl_farmerRegister where Name = '"+name+"' and Password='"+password+"' ";
                SqlCommand cmd1 = new SqlCommand(sQ, con);
                res = Convert.ToInt32(cmd1.ExecuteScalar());
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "');</script>");               
            }
            return res;
        }
        protected void txtQuty_TextChanged(object sender, EventArgs e)
        {
            try
            {
                price = Convert.ToDouble(txtPrice.Text);
                quantity = Convert.ToDouble(txtQuty.Text);
                if (price != 0 && quantity != 0)
                {
                    totalprice = price * quantity;
                    txtTotalPrice.Text = Convert.ToString(totalprice);
                }
                else
                {
                    Response.Write(@"<script language='javascript'>window.alert('Price and quantity deos not empty...');<" + "/script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "');</script>");               
            }
        }
        private void Clear()
        {
            txtPrice.Text = "";
            txtProdName.Text = "";
            txtQuty.Text = "";
            txtTotalPrice.Text = "";
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}