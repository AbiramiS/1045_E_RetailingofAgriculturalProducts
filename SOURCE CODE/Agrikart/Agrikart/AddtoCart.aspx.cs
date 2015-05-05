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
    public partial class AddtoCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        int pid = 0;
        string uname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pid = Convert.ToInt32(Request.QueryString["PID"].ToString());
                if (pid != 0)
                {
                    BindData();
                    totAmount();
                }
            }
        }
        public void totAmount()
        {
            object obj;
            double total = 0;
            Label lblTot;
            foreach (DataListItem li in dlCart.Items)
            {
                obj = li.FindControl("lblTotal");
                lblTot = (Label)obj;
                total = total + Convert.ToDouble(lblTot.Text);
            }
            lblAmount.Text = total.ToString();
        }
        public void BindData()
        {
            DataTable dt = new DataTable();
            try
            {
                uname = Session["username"].ToString();
                con.Open();
                string selectQ1 = "select *,c.Quantity*c.Price as Total from ShoppingCart c left outer join AddProducts p on p.PID=c.Pid where c.Username = '" + uname + "'";
                SqlDataAdapter da = new SqlDataAdapter(selectQ1, con);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    dlCart.DataSource = dt;
                    dlCart.DataBind();
                }
                else
                {
                    Response.Write(@"<script language='javascript'>window.alert('File not found...');<"+"/script>");
                }
                    con.Close();
                    
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"')</script>");
            }
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                double qty,stock = 0;
                object obj;
                object obj1;
                object obj2;
                object obj3;
                object obj4;
                string proId = string.Empty;
                Label lblProdList;
                PaymentDetails.UserId = txtAccname.Text;
                PaymentDetails.AccountNo = txtAccNo.Text;
                PaymentDetails.TotalAmount = lblAmount.Text;
                Label lblTOT, lblPRICE, lblStock;
                TextBox txtQty = null;
                DataTable dt = new DataTable();
                if (dt.Rows.Count > 0)
                    dt.Rows.Clear();
                dt.Columns.Clear();
                dt.Columns.Add("p_Id");
                dt.Columns.Add("price");
                dt.Columns.Add("quantity");
                foreach (DataListItem li in dlCart.Items)
                {
                    DataRow dr = dt.NewRow();
                    obj = li.FindControl("lblProductID");                    
                    lblProdList = (Label)obj;
                    proId = lblProdList.Text;
                    if (proId != null)
                        dr["p_Id"] = proId;
                    PaymentDetails.PriceList(proId);
                    obj2 = li.FindControl("lblStock");
                    obj3 = li.FindControl("txtQuantity");
                    if (obj3 != null && obj2 !=null)
                    {

                        txtQty = (TextBox)obj3;
                        qty = Convert.ToDouble(txtQty.Text);
                        lblStock = (Label)obj2;
                        stock = Convert.ToDouble(lblStock.Text);
                        if (qty <= stock)
                        {
                            dr["quantity"] = qty;
                            PaymentDetails.ProdQuantity(txtQty.Text);
                        }
                        else
                        {
                            Response.Write("<script language='javascript'>window.alert('Quantity Should be less than Stock...')</script>");
                        }
                    }
                    obj4 = li.FindControl("lblTotal");
                    obj1 = li.FindControl("lblPrice");
                    if (obj4 != null)
                    {
                        lblTOT = (Label)obj4;
                        lblPRICE = (Label)obj1;
                        lblTOT.Text = (Convert.ToDouble(lblPRICE.Text) * Convert.ToDouble(txtQty.Text)).ToString();
                        PaymentDetails.ProdQuantity(lblTOT.Text);
                        
                        dr["price"] = lblTOT.Text;
                    }
                    dt.Rows.Add(dr);
                }
                PaymentDetails.storeData(dt);
                Response.Redirect("PayProcess.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "')</script>");
            }
        }

        protected void btnSelectAll_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnSelectAll.Text == "Select All")
                {
                    SelectAllCartItems(true);
                    btnSelectAll.Text = "DeSelect All";
                }
                else
                {
                    SelectAllCartItems(false);
                    btnSelectAll.Text = "Select All";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('"+ex.Message+"')</script>");
            }
        }


        private void SelectAllCartItems(bool status)
        {
            Object obj;
            CheckBox chk;
            try
            {
                foreach (DataListItem li in dlCart.Items)
                {
                    obj = li.FindControl("chkSelect");
                    if (obj != null)
                    {
                        chk = (CheckBox)obj;
                        chk.Checked = status;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int i = 0;
            Object obj;
            CheckBox chk = null;
            Label lblSID, lblPID;
            lblPID = null;
            lblSID = null;
            try
            {
                lblMsg.Text = "";
                foreach (DataListItem li in dlCart.Items)
                {
                    obj = li.FindControl("chkSelect");
                    if (obj != null)
                    {
                        chk = (CheckBox)obj;
                    }
                    obj = li.FindControl("lblSessionID");
                    if (obj != null)
                    {
                        lblSID = (Label)obj;
                    }
                    obj = li.FindControl("lblProductID");
                    if (obj != null)
                    {
                        lblPID = (Label)obj;
                    }
                    if (chk.Checked == true)
                    {
                        string name = Session["username"].ToString();
                        bool result = CartDelete(name,Convert.ToInt32(lblPID.Text));
                        i++;
                    }
                }
                BindData();
                if (i == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>alert('Please Select Check Box And Then Delete')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "')</script>");
            }
        }

        public bool CartDelete(string uname, int PID)
        {
            bool res = false;
            try
            {
                con.Open();
                string delQ = "Delete from ShoppingCart Where Username = '" + uname + "' and Pid='" + PID + "'";
                SqlCommand cmd4 = new SqlCommand(delQ, con);
                res=Convert.ToBoolean(cmd4.ExecuteNonQuery());
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "')</script>");
            }
            return res;
        }

        protected void dlCart_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow row = (GridViewRow)gv_drugdetails.Rows[e.RowIndex];
            //TextBox textBrandName = (TextBox)row.Cells[3].Controls[0];
        }

        protected void btnrefresh_Click(object sender, ImageClickEventArgs e)
        {
            //Button btnrefresh = (Button)sender;
            //DataListItem item = (DataListItem)btnrefresh.NamingContainer;
            //Label NameLabel = (Label)item.FindControl("lblPrice");
        }

        protected void dlCart_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("refresh"))
            {   
                var item = (string)e.Item.DataItem;
                
                var lbl = (Label)e.Item.FindControl("lblPrice");
                var txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
                var lblTotal = (Label)e.Item.FindControl("lblTotal");
                
                lblTotal.Text = (Convert.ToDouble(lbl.Text) * Convert.ToDouble(txtQuantity.Text)).ToString();
                lblAmount.Text = (Convert.ToDouble(lbl.Text) * Convert.ToDouble(txtQuantity.Text)).ToString();

                totAmount();                
            } 
        }
    }
}