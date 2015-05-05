using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Agrikart
{
    public class PaymentDetails
    {
        static string accName = string.Empty;
        static string accNo = string.Empty;
        static string totalAmount = string.Empty;
        static string totalQuantity = string.Empty;
        static string totalPrice = string.Empty;
        static string[] priceList = new string[0];
        static string[] prodQuantity = new string[0];
        static ArrayList productList = new ArrayList();
        static DataTable dt = new DataTable();
        static PaymentDetails()
        {
        }

        public static string UserId
        {
            get
            {
                return accName;
            }
            set
            {
                accName = value;
            }
        }
        public static string AccountNo
        {
            get
            {
                return accNo;
            }
            set
            {
                accNo = value;
            }
        }
        public static string TotalAmount
        {
            get
            {
                return totalAmount;
            }
            set
            {
                totalAmount = value;
            }
        }
        public static void ProductList(string prodId)
        {
            productList.Add(prodId);
        }
        public static ArrayList GetProducts
        {
            get
            {
                return productList;
            }
        }
        public static void PriceList(string price)
        {
            priceList = new string[priceList.Length+1];
            priceList[priceList.Length - 1] = price;
        }
        public static string[] getPriceList
        {
            get
            {
                return priceList;
            }
        }
        public static void ProdQuantity(string qty)
        {
            prodQuantity = new string[prodQuantity.Length + 1];
            prodQuantity[prodQuantity.Length - 1] = qty;
        }
        public static string[] getProdQuantity
        {
            get
            {
                return prodQuantity;
            }
        }
        public static void storeData(DataTable dtt)
        {
            dt = dtt;
        }
        public static DataTable getData
        {
            get
            {
                return dt;
            }
        }
    }
}