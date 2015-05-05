<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Agrikart.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Style1.css" rel="stylesheet" type="text/css" />
    <div>
        <table width="100%" style="background-color:#C1D4E6;">
            <tr>
                <td colspan="4"><br /> </td>
            </tr>
            <tr>
                <td colspan="4" align="center"><span class="header">Product Details</span></td>
            </tr>
            <tr>
                <td colspan="4"><br /></td>
            </tr>
            <tr>
                <td></td>
                <td align="right"><span class="labelcontrol">Name:</span></td>
                <td align="left"><asp:TextBox ID="txtName" runat="server" Width="120px" ></asp:TextBox></td>
                <td></td>
            </tr>
             <tr>
                <td></td>
                <td align="right"><span class="labelcontrol">Price:</span></td>
                <td align="left"><asp:TextBox ID="txtPrice" runat="server" Width="120px" ></asp:TextBox></td>
                <td></td>
            </tr>
             <tr>
                <td></td>
                <td align="right"><span class="labelcontrol">Category:</span></td>
                <td align="left"><asp:TextBox ID="txtCategory" runat="server" Width="120px" ></asp:TextBox></td>
                <td></td>
            </tr>        
             <tr>
                <td></td>
                <td align="right"><span class="labelcontrol">AvailableStock:</span></td>
                <td align="left"><asp:TextBox ID="txtAvailableStock" runat="server" Width="120px" ></asp:TextBox></td>
                <td></td>
            </tr>          
             <tr>
                <td></td>
                <td align="right"><span class="labelcontrol">ProductImage:</span></td>
                <td align="left"><asp:Image ID="imgproduct" runat="server" Width="120px" Height="90px" BackColor="Wheat" /></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4"><br /></td>
            </tr>
             <tr>
                <td></td>
                <td colspan="2" align="center"><asp:Button ID="btnSubmit" runat="server" Text="Buy" BackColor="Green" style="width:80px; height:30px" OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;<asp:Button ID="btnAddtocart" BackColor="Orange" runat="server" Text="AddToCart" style="width:80px; height:30px" /></td>                
                <td></td>
            </tr>
            <tr>
                <td colspan="4"><br /> </td>
            </tr>
        </table>
    </div>
</asp:Content>
