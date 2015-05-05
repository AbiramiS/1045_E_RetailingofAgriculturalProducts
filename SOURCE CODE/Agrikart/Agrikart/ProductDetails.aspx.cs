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
    public partial class ProductDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        int Pid;
        
        protected void Page_Load(object sender, EventArgs e)
        {            
            Pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
            GetProductDetails(Convert.ToInt32(Pid));            
        }

        public void GetProductDetails(int pid)
        {
            DataTable dt = new DataTable();
            try
            {
                con.Open();
                string sQ = "SELECT * FROM AddProducts WHERE PID="+pid+"";
                SqlDataAdapter da = new SqlDataAdapter(sQ, con);
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["ProductName"].ToString();
                    txtCategory.Text = dt.Rows[0]["ProductType"].ToString();
                    txtPrice.Text = dt.Rows[0]["Price"].ToString();
                    string imgpath = dt.Rows[0]["Photo"].ToString();
                    txtAvailableStock.Text = dt.Rows[0]["Stock"].ToString();
                    if (imgpath != "")
                    {
                        imgproduct.ImageUrl = "ProductImages/" + imgpath;
                    }
                }
                else
                {
                    Response.Write(@"<script language='javascript'>window.alert('File Not Found...')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"')</script>");
            }            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string name = Session["username"].ToString();
                //userid = UserID();
                con.Open();
                string selectQ = "Select * from ShoppingCart where Username = '" + name + "' and Pid='" + Pid + "'";
                SqlCommand cmd2 = new SqlCommand(selectQ, con);
                SqlDataReader dr = cmd2.ExecuteReader();
                //con.Close();  
                if (dr.HasRows)
                {
                    con.Close();
                    con.Open();
                    string delQ = "Delete from ShoppingCart Where Username = '" + name + "' and Pid='" + Pid + "'";
                    SqlCommand cmd4 = new SqlCommand(delQ, con);
                    cmd4.ExecuteNonQuery();
                    con.Close();
                }
                else
                {
                    con.Close();
                    con.Open();
                    string insertQ = "Insert into ShoppingCart(Productname,Price,Quantity,Stock,ShopDate,Pid,Username) values('" + txtName.Text + "','" + txtPrice.Text + "'," + 1 + ",'" + txtAvailableStock.Text + "','"+DateTime.Now.ToString()+"','"+Pid+"','"+name+"')";
                    SqlCommand cmd5 = new SqlCommand(insertQ, con);
                    cmd5.ExecuteNonQuery();
                    con.Close();
                }
                dr.Close();
                Response.Redirect("AddtoCart.aspx?PID=" + Pid);                                
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"')</script>");
            }
        }
        //public int UserID()
        //{
        //    int res = 0;
        //    try
        //    {
        //        string name = Session["username"].ToString();
        //        con.Open();
        //        string s1Q = "select Regid from Tbl_UserRegistration where Name ='" + name + "'";
        //        SqlCommand cmd6 = new SqlCommand(s1Q, con);
        //        res = Convert.ToInt32(cmd6.ExecuteScalar());
        //        con.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script language='javascript'>window.alert('"+ex.Message+"')</script>");
        //    }
        //    return res;
        //}
        protected void btnAddtocart_Click(object sender, EventArgs e)
        {
            Response.Redirect("SellProducts.aspx");
        }
    }
}