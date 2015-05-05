using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Agrikart
{
    public partial class SellProducts : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                DataTable dttbl = GetProductType("");

                BindDropDown(dttbl);
            }
        }
        protected void drpList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpList.SelectedItem.Text != "Select")
            {
                DataTable tbl = GetProductType(drpList.SelectedItem.Text);

                bindDataList(tbl);
            }
        }

        public void bindDataList(DataTable dt)
        {
            dlProducts.DataSource = dt;
            dlProducts.DataBind();
        }

        public DataTable GetProductType(string catname)
        {
            DataTable dt = new System.Data.DataTable();
            try
            {
                con.Open();
                string sQ = "Select * from AddProducts where ProductType ='" + catname + "'";
                SqlDataAdapter da = new SqlDataAdapter(sQ, con);
                da.Fill(dt);
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>window.alert('" + ex.Message + "');</script>");               
            }
            return dt;
        }


        private void BindDropDown(DataTable ds)
        {
            drpList.DataSource = ds;
            drpList.DataTextField = "ProductType";
            drpList.DataBind();
        }

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Detail")
            {
                Response.Redirect("ProductDetails.aspx?pid=" + e.CommandArgument.ToString());
            }                  
        }

        protected void dlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }        
    }
}