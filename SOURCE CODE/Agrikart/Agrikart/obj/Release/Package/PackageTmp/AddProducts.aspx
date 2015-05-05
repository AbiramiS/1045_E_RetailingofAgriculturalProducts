<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="Agrikart.AddProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1
        {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Style1.css" rel="stylesheet" type="text/css" />
    <table border="0" cellpadding="1" cellspacing="1" width="100%" style="background-color:#C1D4E6;" align="center">
        <tr>
            <td colspan="4"><br /> </td>
        </tr>
        <tr>
            <td></td>

            <td align="center"  colspan="2">
                <span class="header"> Add Products</span>
            </td>
             <td></td>
        </tr>
        <tr>
            <td colspan="4"><br /></td>
        </tr>
        <tr>
             <td></td>
            <td align="right">
                <asp:Label ID="lblproduct" runat="server" Text="Product Type:" CssClass="labelcontrol"  />
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlProdType" runat="server" Height="20px" Width="197px">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>Rice</asp:ListItem>
                <asp:ListItem>Wheat</asp:ListItem>
                <asp:ListItem>Vegetables</asp:ListItem> 
                <asp:ListItem>Fruits</asp:ListItem>
                <asp:ListItem>Nuts</asp:ListItem>
                <asp:ListItem>Seeds</asp:ListItem>
                </asp:DropDownList>
            </td>
             <td></td>
        </tr>
        <tr>
             <td></td>
            <td align="right">
               <asp:Label ID="lblproducttype" runat="server" Text="Product Name:" CssClass="labelcontrol" />
            </td>
            <td align="left">
                <asp:TextBox ID="txtProdName" runat="server"></asp:TextBox>
                
            </td>
             <td><asp:requiredfieldvalidator ID="rfvprodtype" runat="server" forecolor="Red" ControlToValidate="txtProdName" ErrorMessage="Please enter the productname..." ToolTip="Must fill Product Type"></asp:requiredfieldvalidator></td>
        </tr>
        
        <tr>
            <td></td>
            <td align="right">
               <asp:Label ID="lblprice" runat="server" Text="Price:" CssClass="labelcontrol" />

            </td>
            <td align="left">
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>&nbsp;&nbsp;<p style="font-family:'Matura MT Script Capitals'; color:green;">eg:1KG</p>
                
             </td>
             <td><asp:RequiredFieldValidator ID="rvprice" runat="server" forecolor="Red" ErrorMessage="Please enter the product price... " ControlToValidate="txtPrice" ToolTip="Must be fill price"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
             <td></td>
            <td align="right">
                <asp:Label ID="lblqnty" runat="server" Text="Quantity:" CssClass="labelcontrol" />
                
            </td>
            <td align="left">
                <asp:TextBox ID="txtQuty" runat="server" OnTextChanged="txtQuty_TextChanged" ></asp:TextBox>
                
            </td>
             <td><asp:RequiredFieldValidator ID="rfvqnty" runat="server" ForeColor="Red" ControlToValidate="txtQuty" ErrorMessage="Please enter the product quantity..." ToolTip="Must be fill Quantity"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
             <td></td>
            <td align="right">
               <asp:Label ID="Label1" runat="server" Text="TotalPrice:" CssClass="labelcontrol" />

            </td>
            <td align="left">
                <asp:TextBox ID="txtTotalPrice" runat="server"></asp:TextBox>
                
             </td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" forecolor="Red" ErrorMessage="Please enter the product totalprice..." ControlToValidate="txtTotalPrice" ToolTip="Must be fill price"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
             <td></td>
            <td align="right">
                <asp:Label ID="lblphoto" runat="server" Text="Photo:" CssClass="labelcontrol" />
                
            </td>
            <td align="left">
                <asp:FileUpload ID="fileupload1" runat="server" />
            </td>
             <td><br /></td>
        </tr>
        <tr>
                <td colspan="4"><br /> </td>
            </tr>
        <tr>
             <td></td>              
            <td align="Center" colspan="2" class="auto-style1">
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" BackColor="Green"  style="width:80px; height:30px" OnClick="btnsubmit_Click" /> &nbsp;&nbsp;
                 <asp:Button ID="btnupdate" runat="server" BackColor="Orange" Text="Cancel" style="width:80px; height:30px" />  
            </td>   
             <td></td>       
        </tr>
        <tr>
                <td colspan="4"><br /> </td>
            </tr>
    </table>
    <br />
</asp:Content>
