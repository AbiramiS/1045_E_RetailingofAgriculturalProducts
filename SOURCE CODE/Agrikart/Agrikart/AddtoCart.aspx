<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="Agrikart.AddtoCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Style1.css" rel="stylesheet" type="text/css" />
    <table border="0" cellpadding="1" cellspacing="1" width="100%" style="background-color:#C1D4E6;" align="center">
        <tr>
            <td colspan="2"><br /></td>
        </tr>
        <tr align="center">
            <td align="center" colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="Larger" CssClass="header" Text="Payment"></asp:Label>
            </td>
        </tr>
        <tr align="center">
            
            <td align="center" colspan="2">
                <asp:Label ID="Label5" runat="server" Font-Bold="true" ForeColor="#660033" Text="Cart Details:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2"><br /></td>
        </tr>
        <tr align="center">
            <td align="center" colspan="2">
                <asp:DataList ID="dlCart" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="dlCart_SelectedIndexChanged" OnItemCommand="dlCart_ItemCommand">
                    <HeaderTemplate>
                        <table width="100%">
                            <tr>
                                <td style="width: 10%" align="center">
                                    Select
                                </td>
                                <td style="width: 30%" align="center">
                                    Product
                                </td>
                                <td style="width: 20%" align="center">
                                    Price
                                </td>
                                <td style="width: 20%" align="center">
                                    Available Stock
                                </td>
                                <td style="width: 20%" align="center">
                                    Quantity
                                </td>
                                <td style="width: 20%" align="center">
                                    Amount
                                </td>
                                <td style="width: 20%" align="center">
                                    Refresh
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table width="100%">
                            <tr>
                                <td style="width: 10%">
                                    <asp:CheckBox ID="chkSelect" runat="server" Checked="false" />
                                    <asp:Label ID="lblSessionID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Username") %>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="lblProductID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Pid") %>'
                                        Visible="false"></asp:Label>
                                </td>
                                <td style="width: 35%" align="center">
                                    <asp:Label ID="lblImage" runat="server"> 
                                       <img src='<%#DataBinder.Eval(Container.DataItem,"Photo","ProductImages/{0}")%>' alt='<%#DataBinder.Eval(Container.DataItem,"ProductName")%>' width="30" height="30" /><br>
                                        <%#DataBinder.Eval(Container.DataItem, "ProductName")%>
                                    </asp:Label>
                                </td>
                                <td style="width: 10%" align="left">                                   
                                    Rs.<asp:Label ID="lblPrice" runat="server" Text=' <%#DataBinder.Eval(Container.DataItem,"Price")%>'>
                                    </asp:Label>
                                </td>
                                <td><br /></td>
                                 <td style="width: 10%" align="left">                                   
                                    <asp:Label ID="lblStock" runat="server" Text=' <%#DataBinder.Eval(Container.DataItem,"Stock")%>'>
                                    </asp:Label>KG
                                </td>
                                <td style="width: 20%">
                                    <asp:TextBox ID="txtQuantity" runat="server" MaxLength="2" Width="40%" Text='<%#DataBinder.Eval(Container.DataItem,"Quantity")%>'></asp:TextBox>
                                    <%--<asp:CompareValidator ID="comp" runat="server" Operator="greaterThan" Type=> </asp:CompareValidator>--%>
                                </td>
                                <td style="width: 20%">                                    
                                    Rs.<asp:Label ID="lblTotal" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Total")%>'> 
                                    </asp:Label>
                                </td>
                                <td style="width: 20%">
                                    <asp:ImageButton ID="btnrefresh" CommandName="refresh" runat="server" ImageUrl="~/images/refresh.jpg" Height="30px" OnClick="btnrefresh_Click" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
            </td>
        </tr>
         <tr>
            <td colspan="2"><br /></td>
        </tr>
         <tr>
            <td colspan="2"><br /></td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="100%">
                    <tr align="right">
                        <td>
                            <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMsg" Text="" ForeColor="Red" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label2" runat="server" Text="Account Name:" CssClass="labelcontrol"></asp:Label>
                :</td>
            <td align="left">
                <asp:TextBox ID="txtAccname" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rqdValidator" runat="server" ControlToValidate="txtAccname" ValidationGroup="grpVal1" ForeColor="Red"
                    ErrorMessage="Required!!!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label4" runat="server" Text="Purchasing Amount" CssClass="labelcontrol"></asp:Label>
                :</td>
            <td align="left">
                <asp:Label ID="lblAmount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label6" runat="server" Text="Account Number" CssClass="labelcontrol"></asp:Label>
                :</td>
            <td align="left">
                <asp:TextBox ID="txtAccNo" runat="server" contentEditable="false" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccNo" ValidationGroup="grpVal1"
                   ForeColor="Red"  ErrorMessage="Required!!!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label3" runat="server" Text="BankName" CssClass="labelcontrol"></asp:Label>
                :</td>
            <td align="left">
                <asp:Label ID="Label8" runat="server" Text="Bank Of TamilNadu"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2"><br /></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnConfirm" runat="server" BackColor="#009900" ValidationGroup="grpVal1" Text="Confirm" style="width:100px; height:30px" OnClick="btnConfirm_Click" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="btnSelectAll" runat="server" Text="Select All" style="width:100px; height:30px"
                    OnClick="btnSelectAll_Click" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="btnDelete" runat="server" BackColor="#cc3300" Text="Delete" style="width:100px; height:30px" OnClick="btnDelete_Click" />
            </td>
        </tr>
        <tr align="center">
            <td align="center" colspan="2">
                <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
            </td>
        </tr>

        <tr>
            <td colspan="2"><br /></td>
        </tr>
         <tr>
            <td colspan="2"><br /></td>
        </tr>
         <tr>
            <td colspan="2"><br /></td>
        </tr>
    </table>
</asp:Content>
