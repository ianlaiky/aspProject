<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="adminpg.aspx.cs" Inherits="adminpg" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    
     <table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Sender</th>
            <th>Recipient</th>
            <th>Amount(SGD)</th>
            <th>Date</th>
            <th>Description</th>     
        </tr>         
        </table>
    <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="btnSubmit" runat="server" Text="Submit"   />
   
    
</asp:Content>

