<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 373px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Product Details</h2>
    <table class="auto-style2" style="width: 50%">
        <tr>
            <td rowspan="3">
                <asp:Image ID="img_Product" runat="server" Height="143px" Width="127px" />
            </td>
            <td class="auto-style3">
                <asp:Label ID="lbl_ProdName" runat="server" Font-Bold="True"></asp:Label>
                &nbsp;
                <br />
                <br />
                <asp:Label ID="lbl_ProdDesc" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lbl_Price" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:Button ID="Btn_Add" runat="server" onclick="Btn_Add_Click" Text="Add to Cart" />
            </td>
        </tr>
    </table>
Product ID =
<asp:Label ID="lbl_ProdID" runat="server"></asp:Label>
</asp:Content>

