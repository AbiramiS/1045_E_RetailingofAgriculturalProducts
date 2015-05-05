<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="UsersRegistration.aspx.cs" Inherits="Agrikart.UsersRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Style1.css" rel="stylesheet" type="text/css" />
    <center>
        <table width="100%" style="background-color:#C1D4E6;">
            <tr>
                <td colspan="4"><br /> </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2" align="center" class="header">User Register</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4"><br /></td>
            </tr>
            <tr>
                <td></td>
                <td align="right"><asp:Label ID="lblFarmer" runat="server" Text="UserName:" CssClass="labelcontrol"/></td>
                <td align="left"><asp:TextBox ID="txtusername" runat="server" CausesValidation="True" Width="160px"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="rfvduserid" runat="server" ForeColor="Red" ControlToValidate="txtusername" ErrorMessage="Please enter your name..." ToolTip="UserID must be fill"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td align="right"><asp:Label ID="Label2" runat="server" Text="EmailID:" CssClass="labelcontrol" /></td>
                <td align="left"><asp:TextBox ID="txtemail" runat="server" CausesValidation="True" Width="160px"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="rfvdemail" runat="server" forecolor="red" ControlToValidate="txtemail" ErrorMessage="Please enter your emailid..." Tooltip="Mail must be fill"></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="revdmail" runat="server" forecolor="red" display="Dynamic" ControlToValidate="txtemail" ErrorMesssage="must be enter valid mail" tooltip=" must enter valid mail format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td></td>
                <td align="right"><asp:Label ID="Label3" runat="server" Text="MobileNumber:" CssClass="labelcontrol"/> </td>
                <td align="left"><asp:TextBox ID="txtmobile" runat="server" CausesValidation="True" Width="160px"></asp:TextBox></td>
                <td><asp:requiredfieldvalidator ID="rfvdmobile" runat="server" forecolor="red" ControlToValidate="txtmobile" ErrorMessage="Mobile Number Must not be empty" tooltip="Please enter your mobileno..."></asp:requiredfieldvalidator>
                <asp:regularexpressionvalidator ID="revdmobile" runat="server" forecolor="red" ControlToValidate="txtmobile" ErrorMessage="Mobile Number Must be Integer" tooltip="allowed only numbers" ValidationExpression="^\d+$" ></asp:regularexpressionvalidator></td>
            </tr>
            <tr>
                <td></td>
                <td align="right"><asp:Label ID="Label4" runat="server" Text="Password:" CssClass="labelcontrol" /></td>
                <td align="left"><asp:TextBox ID="txtpassword" runat="server" CausesValidation="true" Width="160px"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="txtpassword" ErrorMessage="Password must not be empty" forecolor="red" tooltip="Password must not be empty"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td align="right"><asp:Label ID="Label5" runat="server" Text="ConfirmPassword:" CssClass="labelcontrol"/></td>
                <td align="left"><asp:TextBox ID="txtconfirmpassword" runat="server" CausesValidation="true" Width="160px"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="rfvconfirm" runat="server" ControlToValidate="txtconfirmpassword" ErrorMessage="Confirm Password must not be empty" ForeColor="Red" ToolTip="Confirm Password must not be empty"></asp:RequiredFieldValidator><asp:CompareValidator ID="cvconfirmpassword" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirmpassword" ErrorMessage="Password and Confirm Password must be match" ForeColor="red" ToolTip="Password and ConfirmPassword must be match"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td colspan="4"><br /></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2" align="center"><asp:Button ID="btnsubmit" runat="server" Text="Submit"  BackColor="Green" style="width:80px; height:30px" OnClick="btnsubmit_Click" />&nbsp;&nbsp;<asp:Button ID="btncancel" BackColor="Orange" runat="server" style="width:80px; height:30px" Text="Cancel" Width="80px" /></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4"><br /> </td>
            </tr>
        </table>
    </center> 
</asp:Content>
