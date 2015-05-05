<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Agrikart.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <table>
        <center>
            <tr>

                <td>

                    <asp:Image ID="imgUserImage" runat="server" Width="100px" Height="100px" />

                </td>
                <td>
                      <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />

                </td>
                 <td>
                      <asp:Image ID="Image2" runat="server" Width="100px" Height="100px" />

                </td>

            </tr>
            <tr>
                <td>
                    <asp:Image ID="image3" runat="server" Width="100px" Height="100px" />
                </td>
                <td>
                    <asp:Image ID="image4" runat="server" Width="100px" Height="100px" />

                </td>
                <td>
                    <asp:Image ID="image5" runat="server" Width="100px" Height="100px" />
                </td>

            </tr>
        </center>

    </table>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
</asp:Content>
