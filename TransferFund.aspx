<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="TransferFund.aspx.cs" Inherits="TransferFund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <a  class="btn btn-default" href="YourAccount.aspx">Home</a>
    <a  class="btn btn-default" href="TransferFund.aspx">Transfer fund</a>
    <a  class="btn btn-default" href="#">Request New BankBook</a>
    <%
        if (Session["adminlogoncheckpls"].ToString().Equals("true"))
        {
            Response.Redirect("adminpg.aspx",true);
        }
      



    %>
     <table class="auto-style1">
            <tr>
                <td class="auto-style2">Username:</td>
                <td>
                    <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please provide your name" Font-Bold="False" ControlToValidate="tbName"></asp:RequiredFieldValidator></td> </tr>
            <tr>
                <td class="auto-style2">Transfer Amount:</td>
                <td>
                    <asp:TextBox ID="tbAmt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please provide the transfer amount" ControlToValidate="tbAmt"></asp:RequiredFieldValidator>

                </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Description:"></asp:Label>
                </td>
                <td>
                <asp:TextBox ID="tbDes" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please provide some description" Font-Bold="False" ControlToValidate="tbDes"></asp:RequiredFieldValidator> </td>
            </tr>
         <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
          
          
        </table>
    <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"  />
   
    
</asp:Content>

