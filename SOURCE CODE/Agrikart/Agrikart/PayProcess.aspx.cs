using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agrikart
{
    public partial class PayProcess : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        string name;
        string ptype;
        string mobileno;
        string accNo;
        string accNm;
        string netAmt;
        protected void Page_Load(object sender, EventArgs e)
        {
            purchaseLoad();
        }

        public void purchaseLoad()
        {
            try
            {
                string accNm = PaymentDetails.UserId;
                txtAccName.Text = accNm;
                string accNo = PaymentDetails.AccountNo;
                txtAccNo.Text = accNo;
                string totAmount = PaymentDetails.TotalAmount;
                txtcamount.Text = totAmount;
                string netAmt = ((Convert.ToDouble(totAmount) * 5) / 100).ToString();
                txttamount.Text = netAmt;
                double totamount = Convert.ToDouble(netAmt) + Convert.ToDouble(totAmount);
                txtnamount.Text = totamount.ToString();                           
            }
            catch(Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"')</script>");
            }
        }

        protected void btnpay_Click(object sender, EventArgs e)
        {
            try
            {
                accNo = PaymentDetails.AccountNo;
                accNm = PaymentDetails.UserId;
                netAmt = txtnamount.Text;
                string[] price = PaymentDetails.getPriceList;
                string[] quantity = PaymentDetails.getProdQuantity;
                ArrayList prodList = PaymentDetails.GetProducts;
                DataTable dt = PaymentDetails.getData;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string uname = Session["username"].ToString();
                    string prod_Id = dt.Rows[i]["p_Id"].ToString();
                    string priceList = dt.Rows[i]["price"].ToString();
                    string quanty = dt.Rows[i]["quantity"].ToString();
                    Purchase(uname, prod_Id, priceList, quanty);
                }                
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "')</script>");
            }
        }

        public int Purchase(string uname, string pid, string price, string qty)
        {
            int res = 0;
            DataTable dt = new DataTable();
            
            string info = "Purchase Completed";
            try
            {
                if (pid != "")
                {
                    con.Open();
                    string sq1 = "Select ProductName,ProductType from AddProducts where PID='" + pid + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sq1, con);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        name = dt.Rows[0]["ProductName"].ToString();
                        ptype = dt.Rows[0]["ProductType"].ToString();
                    }
                    con.Close();
                }
                if (uname != "")
                {
                    con.Open();
                    string sq2 = "Select MobileNumber from Tbl_UserRegistration where Name='" + uname + "'";
                    SqlDataAdapter da1 = new SqlDataAdapter(sq2, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        mobileno = dt1.Rows[0]["MobileNumber"].ToString();
                    }
                    con.Close();
                }
                con.Open();
                string IQ = "Insert into PurchaseDetails values ('" + name + "','" + ptype + "','" + price + "','" + qty + "','" + uname + "','" + mobileno + "','" + true + "','" + info + "','" + DateTime.Now.ToString() + "','" + pid + "')";
                SqlCommand cmd3 = new SqlCommand(IQ,con);
                cmd3.ExecuteNonQuery();
                con.Close();
                Response.Write(@"<script language='javascript'>window.alert('Purchased successfully...');<"+"/script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "')</script>");
            }
            return res;
        }

    }
}