<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="TransferFund.aspx.cs" Inherits="TransferFund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    
     <table class="auto-style1">
            <tr>
                <td class="auto-style2">Name(as per bank&#39;s record):</td>
                <td>
                    <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your name" Font-Bold="False" ControlToValidate="tbName"></asp:RequiredFieldValidator> </tr>
            <tr>
                <td class="auto-style2">Account no:</td>
                <td>
                    <asp:TextBox ID="tbAcctNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter account no" ControlToValidate="tbAcctNo"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td class="auto-style2">Email of account holder(if you wish to notify them of payment:</td>
                <td>
                    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your email" ControlToValidate="tbEmail"></asp:RequiredFieldValidator> </td>
            </tr>
            <tr>
                <td class="auto-style2" style="height: 97px">Your initials:</td>
                <td style="height: 97px">
                    <asp:TextBox ID="tbInt" runat="server"></asp:TextBox> 
                </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your initials" ControlToValidate="tbInt"></asp:RequiredFieldValidator>
                 </tr>
        </table>
    <button runat="server" id="uxSearch" class="btn btn-default">
    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    Submit
</button>
    
</asp:Content>

