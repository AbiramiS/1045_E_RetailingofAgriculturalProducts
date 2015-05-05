<%@ Page Title="" Language="C#" MasterPageFile="~/Agri.Master" AutoEventWireup="true" CodeBehind="SellProducts.aspx.cs" Inherits="Agrikart.SellProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <link href="Content/Style1.css" rel="stylesheet" />
    <Center>
        <table width="100%" style="background-color:#C1D4E6;">
            <tr>
                <td colspan="4"><br /> </td>
            </tr>
             <tr>
                <td colspan="4" align="center"><span class="header">Sale Products</span> </td>                
            </tr>
             <tr>
                <td colspan="4"><br /> </td>                
            </tr>
            <tr>
                <td> </td>
                <td class="labelcontrol" align="right">Categories:</td>
                <td align="left">  <asp:DropDownList ID="drpList" runat="server" AutoPostBack="True" Height="21px" 
                    Width="205px" AppendDataBoundItems="true" 
                    onselectedindexchanged="drpList_SelectedIndexChanged">
                <asp:ListItem Selected="True">Select</asp:ListItem>
                <asp:ListItem>Rice</asp:ListItem>
                <asp:ListItem>Wheat</asp:ListItem>
                <asp:ListItem>Vegetables</asp:ListItem> 
                <asp:ListItem>Fruits</asp:ListItem>
                <asp:ListItem>Nuts</asp:ListItem>
                <asp:ListItem>Seeds</asp:ListItem>
                </asp:DropDownList></td>
                <td> </td>
            </tr>
             <tr>
                <td colspan="4"> </td>                
            </tr>
            <tr>
                <td colspan="4"><br /> </td>
                
            </tr>
             <tr>
                <td> </td>
                <td colspan="2"> 
                    <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="100%" OnItemCommand="dlProducts_ItemCommand">
                    <ItemTemplate>
                        <table cellpadding="1" cellspacing="2">
                            <tr>
                                <td colspan="2" align="center" valign="top">
                                    <%#DataBinder.Eval(Container.DataItem,"ProductName")%>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                        <img alt='<%#DataBinder.Eval(Container.DataItem,"ProductName")%>' src='<%#DataBinder.Eval(Container.DataItem,"Photo","/ProductImages/{0}")%>'
                                            width="150" height="150" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <b>₹ &nbsp;<%#DataBinder.Eval(Container.DataItem,"Price")%></b></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 50%" align="center">
                                    <asp:ImageButton ID="ibtnDetail" AlternateText="Detail" runat="server" BorderStyle="ridge"
                                        BackColor="Bisque" ImageUrl="~/images/Details.gif" CommandName="Detail" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PID")%>'
                                        Width="65" />
                                </td>
                            </tr> 
                        </table>
                    </ItemTemplate>
                </asp:DataList> </td>
                
                <td> </td>
            </tr>
             <tr>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <td colspan="4"><br /> </td>
            </tr>
        </table>
    </Center>
</asp:Content>
