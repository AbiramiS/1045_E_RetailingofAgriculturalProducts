<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="FarmersRegistration.aspx.cs" Inherits="Agrikart.FarmersRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Style1.css" type="text/css" rel="stylesheet" />
    <center>
    <table cellpadding="5" cellspacing="3" width="100%" style="background-color:#C1D4E6;">
        <tr>
            <td colspan="4"><br /> </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2" align="center"><asp:Label ID="Label1" runat="server" Text="Farmer Register" CssClass="header" /></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="4"><br /></td>
        </tr>
        <tr>
            <td></td>
            <td align="right"><asp:Label ID="label3" runat="server" Text="Name:" CssClass="labelcontrol" /></td>
            <td align="left"><asp:TextBox ID="txtname" runat="server" width="160px"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvname" ForeColor="Red" runat="server" ErrorMessage="Name should not be empty" ControlTOValidate="txtname"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label4" runat="server" Text="Gender:" CssClass="labelcontrol" /></td>
            <td align="left"><asp:RadioButtonList ID="rdgender" runat="server" RepeatDirection="Horizontal" Height="29px">
                    <asp:ListItem Text="Male" Value="Male">
                    </asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female">
                    </asp:ListItem></asp:RadioButtonList></td>
            <td><asp:RequiredFieldValidator ID="GenderValidator" ForeColor="Red" runat="server" ErrorMessage="Please Select the gender!!!"
                    ControlToValidate="rdgender" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label5" runat="server" Text="Address:" CssClass="labelcontrol" /></td>
            <td align="left"><asp:TextBox ID="txtaddress" runat="server" width="160px" Textmode="MultiLine"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvaddress" ForeColor="Red" runat="server" ErrorMessage="Address should not be empty" ToolTip="Address should not be empty" ControlToValidate="txtaddress"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label6" runat="server" Text="CellNo:" CssClass="labelcontrol" /></td>
            <td align="left"><asp:TextBox ID="txtcontact" runat="server" MaxLength="12" Width="160px"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rvcontact" ForeColor="Red" runat="server" ErrorMessage="Contact number should not be empty" ToolTip="Contact number should not be empty" ControlToValidate="txtcontact"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label7" runat="server" Text="Pincode:" CssClass="labelcontrol" /></td>
            <td align="left"><asp:TextBox ID="txtpin" runat="server" Width="160px" ></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvpin" ForeColor="Red" runat="server" ErrorMessage="Pincode should not be empty" ToolTip="Pincode should not be empty" ControlToValidate="txtpin"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label8" runat="server" Text="AccountNumber:" CssClass="labelcontrol" /></td>
            <td align="left"><asp:TextBox ID="txtacno" runat="server" Width="160px"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rvacno" ForeColor="Red" runat="server" ErrorMessage="Account should not be empty" ToolTip="Account should not be empty" ControlToValidate="txtacno"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label9" runat="server" Text="EmailID:" CssClass="labelcontrol"/></td>
            <td align="left"><asp:TextBox ID="txtemail" runat="server" Width="160px"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvmail" runat="server" forecolor="Red" errormessage="MailID should not be empty" ControlToValidate="txtemail" ToolTip="MailID should not be empty"></asp:RequiredFieldValidator>&nbsp;&nbsp;
               <asp:RegularExpressionValidator ID="rvemail" runat="server" forecolor="Red" errormessage="Must be enter valid emilid" ControlToValidate="txtemail" ToolTip="Must fill Mailid" Display="Dynamic" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator></td>
        </tr>
         <tr>
            <td></td>
            <td align="right"><asp:Label ID="label10" runat="server" Text="Password:" CssClass="labelcontrol"/></td>
            <td align="left"><asp:TextBox ID="txtpass" runat="server" CausesValidation="true" textmode="Password"  Width="160px"></asp:TextBox></td>
            <td><small style="color:green">(minimum 3-10 characters)</small>&nbsp;
        <asp:RequiredFieldValidator ID="rfpassword" runat="server" ControlToValidate="txtpass" ErrorMessage="Password should not be empty" ToolTip="Password should not be empty" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label11" runat="server" Text="ConfirmPassword:" CssClass="labelcontrol" /></td>
            <td align="left"><asp:TextBox ID="txtconfrmpassword" runat="server" CausesValidation="true" Width="160px" TextMode="Password"></asp:TextBox></td>
            <td><asp:CompareValidator ID="cvdconfrmpassword" runat="server" CausesValidation="true" ForeColor="Red" ControlToCompare="txtpass" ControlToValidate="txtconfrmpassword" ErrorMessage="Password and ConfirmPassword Must be Match" ToolTip="Password and ConfirmPassword Must be Match"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="rvconfrmpassword" runat="server" controltovalidate="txtconfrmpassword" errormessage="Must be enter your confirm password" forecolor="red"></asp:RequiredFieldValidator></td>
        </tr>
       
        <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label12" runat="server" Text="Hint:" CssClass="labelcontrol"/></td>
            <td align="left"><asp:dropdownlist ID="ddlhint" runat="server" Width="210px" >
                <asp:ListItem>what is your favourite book?</asp:ListItem>
                <asp:ListItem>what is your timepass?</asp:ListItem>
                <asp:ListItem>where did you born?</asp:ListItem>
                <asp:ListItem>what is your favourite food?</asp:ListItem>
                <asp:ListItem>what is favorite color?</asp:ListItem>
                 </asp:dropdownlist></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td align="right"><asp:Label ID="Label13" runat="server" Text="Answer:" CssClass="labelcontrol" /></td>
            <td align="left"><asp:TextBox ID="txtans" runat="server" width="160px"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><br /></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2" align="center"><asp:Button ID="btnsubmit"  Text="Submit"  runat="server" BackColor="Green" style="width:80px; height:30px" OnClick="btnsubmit_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" BackColor="Orange" runat="server" Text="Cancel" style="width:80px; height:30px" OnClick="btnCancel_Click" /></td>            
            <td></td>
        </tr>
        <tr>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
        </tr>    
        <tr>
             <td colspan="4"><br /> </td>
        </tr>   
    </table>
    </center>
</asp:Content>
