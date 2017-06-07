<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="TransferFund.aspx.cs" Inherits="TransferFund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <table class="auto-style1">
            <tr>
                <td class="auto-style2">Name(as per bank&#39;s record):</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="247px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Account no:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="245px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email of account holder(if you wish to notify them of payment:</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="246px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Your initials:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="244px"></asp:TextBox>
                </td>
            </tr>
        </table>
    
</asp:Content>

