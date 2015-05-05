<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="PayProcess.aspx.cs" Inherits="Agrikart.PayProcess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Style1.css" rel="stylesheet" type="text/css" />
    <table width="100%" id="TABLE1" style="background-color:#C1D4E6;">
    <tr>
        <td style="width: auto" colspan="2">
            <asp:Label ID="lbltitle" runat="server" CssClass="header" Text="Payment Details" ForeColor="Gray" Font-Size="Large"
                Width="288px" Height="21px"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblSummary" runat="server" CssClass="labelcontrol" Text="Order Summary" BackColor="Cornsilk">
            </asp:Label>
        </td>
    </tr>
    <tr style="width: 100%">
        <td align="right" style="width: 40%">
            <asp:Label ID="lblCamount" runat="server" CssClass="labelcontrol" Text="Cart Amount:">
            </asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtcamount" runat="server"
                Width="225px" Enabled="False" EnableTheming="True"></asp:TextBox>
        </td>
    </tr>
    <tr style="width: 100%">
        <td align="right" style="width: 40%">
            <asp:Label ID="lbltamount" runat="server" CssClass="labelcontrol" Text="Tax Amount ( 5% ):">
            </asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txttamount" runat="server" Width="225px" Enabled="False"></asp:TextBox>
        </td>
    </tr>    
    <tr style="width: 100%">
        <td align="right" style="width: 40%; height: 26px;">
            <asp:Label ID="lblnamount" runat="server" CssClass="labelcontrol" Text="Net Payable Amount:">
            </asp:Label>
        </td>
        <td style="height: 26px" align="left">
            <asp:TextBox ID="txtnamount" runat="server" Width="225px" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2"><br /></td>  
    </tr>
    <tr>
        <td colspan="2"><br /></td>        
    </tr>
    <tr>
        <td colspan="2" align="left">
            <asp:Label ID="lblcdetails" runat="server" CssClass="header" Text="Purchase Through Online Banking" Font-Size="Larger">
            </asp:Label>
        </td>
    </tr>
         <tr>
            <td colspan="3"><br /></td>
        </tr>
    <tr style="width: 100%">
        <td style="width: 40%" align="right">
            <asp:Label ID="lblcnumber" runat="server" CssClass="labelcontrol" Text="Account Number:" Font-Size="Small">
            </asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtAccNo" runat="server" Width="225px" ValidationGroup="onlineValidate"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="onlineValidate" ErrorMessage="RequiredFieldValidator"
                ControlToValidate="txtAccNo" ForeColor="Red" ToolTip="Must enter account number">*</asp:RequiredFieldValidator>
           
        </td>
    </tr>
    <tr style="width: 100%">
        <td style="width: 40%; height: 59px;" align="right">
            <asp:Label ID="lblccode" runat="server" CssClass="labelcontrol" Font-Size="Small" Text="Account HolderName:">
            </asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtAccName" runat="server" Width="225px" ValidationGroup="onlineValidate"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="onlineValidate" ErrorMessage="RequiredFieldValidator"
                ControlToValidate="txtAccName" ForeColor="Red" ToolTip="Must enter Account Name">*</asp:RequiredFieldValidator>
        </td>
    </tr>
         <tr>
            <td colspan="3"><br /></td>
        </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:Button ID="btnpay" runat="server" style="width:100px; height:30px" Text="PAY NOW" ValidationGroup="onlineValidate" BackColor="Green" OnClick="btnpay_Click" CausesValidation="True" />&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" style="width:100px; height:30px" Text="CANCEL" ValidationGroup="onlineValidate" BackColor="RED"  />
        </td>
    </tr>
        <tr>
            <td colspan="3"><br /></td>
        </tr>
        <tr>
            <td colspan="3"><br /></td>
        </tr>
        </table>

</asp:Content>
