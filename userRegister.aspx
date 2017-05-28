<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="userRegister.aspx.cs" Inherits="userRegister" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


   


   

    Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="214px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    <br />
    Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
<%--angualrjs testing--%>
        <div ng-app=""> 
        
           <input id="Text1" runat="server" type="text" ng-model="temptest"/><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Text1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
&nbsp;<p>Name is : {{temptest}}</p>

            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>




   

</asp:Content>

