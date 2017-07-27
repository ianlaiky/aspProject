<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="adminpg.aspx.cs" Inherits="adminpg" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    
     <table class="auto-style1">
            <tr>
                <td class="auto-style2">Username:</td>
                <td>
                    <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                </td>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your name" Font-Bold="False" ControlToValidate="tbName"></asp:RequiredFieldValidator>--%> </tr>
            <tr>
                <td class="auto-style2">Transfer Amount:</td>
                <td>
                    <asp:TextBox ID="tbAmt" runat="server"></asp:TextBox>
                   

                </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Date: "></asp:Label>
                </td>
                <td>
                <asp:TextBox ID="tbDate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Receipiant "></asp:Label>
                </td>
                <td>
                <asp:TextBox ID="Recp" runat="server"></asp:TextBox>
                </td>
            </tr>
         <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
          
          
        </table>
    <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="btnSubmit" runat="server" Text="Submit"   />
   
    
</asp:Content>

