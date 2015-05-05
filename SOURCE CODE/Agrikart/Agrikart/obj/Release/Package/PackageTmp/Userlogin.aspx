<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="Userlogin.aspx.cs" Inherits="Agrikart.Userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >    
    <link href="Content/Style1.css" rel="stylesheet" type="text/css" />
        <center>
          <table width="100%" style="background-color:#C1D4E6;">
              <tr>
                <td colspan="4"><br /> </td>
            </tr>
              <tr>
                  <td align="center" colspan="4"><asp:Label ID="lbl2" runat="server" Text="User Login" CssClass="header"></asp:Label></td>
              </tr>
              <tr>
                  <td colspan="4"><br /></td>
              </tr>
                <tr>
                    <td></td>
                    <td align="right">
                       <asp:Label ID="lbluserid" runat="server" Text="UserName:" CssClass="labelcontrol" />
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtuser" runat="server" Width="160px"></asp:TextBox>
                     </td>
                    <td>
                        <asp:RequiredFieldValidator ID="txtuservalidate" runat="server" Controltovalidate="txtuser" 
                            ErrorMessage="UserName cannot be blank" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                         

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                      <asp:Label ID="lblpassword" runat="server" Text="Password:" CssClass="labelcontrol" />

                    </td>
                    <td align="left">
                    <asp:TextBox ID="txtpassword" runat="server" Width="160px"></asp:TextBox>
                    </td>
                    <td>
                    <asp:RequiredFieldValidator ID="passvalid" runat="server" ControlToValidate="txtpassword" ForeColor="Red" ErrorMessage="Password could not be empty" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>              
              <tr>
                  <td colspan="4"><br /></td>
              </tr>             
                <tr>
                    <td></td>
                    <td colspan="2" align="center" ><asp:Button ID="btnSignin" Text="Login" style="width:80px; height:30px" BackColor="Green" runat="server" OnClick="btnSignin_Click" />&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" BackColor="Orange" Text="Cancel" style="width:80px; height:30px" />
                        </td>
                    <td>                      
                    </td>
                </tr>
                <tr>        
                    <td></td>    
                    <td align="center" colspan="2">Not yet Registered? Click here to               
                <a href="FarmersRegistration.aspx"><u>RegisterNow</u></a>
                    </td>
                    <td></td>           
            </tr>
              <tr>
                <td colspan="4"><br /> </td>
            </tr>
            </table>                
        </center>       
</asp:Content>
