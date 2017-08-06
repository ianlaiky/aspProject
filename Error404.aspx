<%@ Page Title="" Language="C#" MasterPageFile="~/RPageBlank.master" AutoEventWireup="true" CodeFile="Error404.aspx.cs" Inherits="Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div style="text-align: center;" >
     
        <h2>Error 404: Page not found</h2>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <div style="text-align: center;" >
<%--        <asp:Button ID="Button1" runat="server" Text="Back Home" class="btn btn-primary" OnClick="Button1_OnClick"/>--%>
        
       
        <a class="btn btn-primary" href="login.aspx">Home</a>
    </div>


</asp:Content>



