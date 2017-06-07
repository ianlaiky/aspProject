<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="YourAccount.aspx.cs" Inherits="YourAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">What you have:</td>
                <td>What you own:</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1" runat="server" Height="33px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="38px"></asp:TextBox>
                </td>
            </tr>
        </table>
</asp:Content>

