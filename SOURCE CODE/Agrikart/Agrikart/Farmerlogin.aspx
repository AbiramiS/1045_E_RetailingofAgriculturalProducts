<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="Farmerlogin.aspx.cs" Inherits="Agrikart.Farmerlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Style1.css" rel="stylesheet" type="text/css" />
    <Center>        
        <table width="100%" style="background-color:#C1D4E6;">
            <tr>
                <td colspan="4"><br /> </td>
            </tr>
             <tr>
                 <td></td>
                 <td colspan="2" align="center"><span class="header" >Farmer Login</span></td>                 
                 <td></td>
             </tr>
            <tr>
                <td colspan="4"><br /></td>
            </tr>
             <tr>
                 <td></td>
                 <td align="right"><asp:Label ID="lblFarmer" runat="server" Text="UserName:" CssClass="labelcontrol"/></td>
                 <td align="left"><asp:TextBox ID="txtfrmname" runat="server" font-size="10pt" height="25"  Width="160px"></asp:TextBox></td>
                 <td><asp:RequiredFieldValidator ID="txtuservalidate" runat="server" Controltovalidate="txtfrmname" ErrorMessage="Please enter your name..."
                            tooltip="UserName cannot be blank" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></td>
             </tr>
             <tr>
                 <td></td>
                 <td align="right"><asp:Label ID="Label1" runat="server" Text="Password:" CssClass="labelcontrol"/></td>
                 <td align="left"><asp:TextBox ID="txtpassword" TextMode="Password" runat="server" Height="25" Width="160px" Font-Size="10pt"></asp:TextBox></td>
                 <td><asp:RequiredFieldValidator ID="passvalid" ForeColor="Red" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please enter your password..." ToolTip="password cannot be empty" Display="Dynamic"></asp:RequiredFieldValidator></td>
             </tr>
             <tr>                 
                 <td colspan="4"><br /></td>
             </tr>
             <tr>
                 <td></td>
                 <td colspan="2" align="center"><asp:Button ID="btnSignin" Text="Login" BackColor="Green" style="width:80px; height:30px" runat="server" OnClick="btnSignin_Click" />&nbsp;&nbsp;<asp:Button ID="btnCancel" Text="Cancel" runat="server" BackColor="Orange" style="width:80px; height:30px" OnClick="btnCancel_Click" /></td>
                 <td></td>
             </tr>
             <tr>
                 <td colspan="4" align="center">Not yet Registered? Click here to               
                <a href="FarmersRegistration.aspx"><u>RegisterNow</u></a></td>                 
             </tr>    
            <tr>
                <td colspan="4"><br /> </td>
            </tr>
        </table>
    </Center>
</asp:Content>
