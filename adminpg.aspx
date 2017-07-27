<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="adminpg.aspx.cs" Inherits="adminpg" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <tr>
        <td>
                    <asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label>
                </td>
                <td>
                <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
    </tr>
     <table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Sender</th>
            <th>Recipient</th>
            <th>Amount(SGD)</th>
            <th>Date</th>
           
        </tr>         
        
        
        
        <%
            Transaction uss = new Transaction();
            List<Transaction> gfarr = uss.getAllData();



            for (int i = 0; i < gfarr.Count; i++)
            {
                


           



        %>
        
        
        <tr>
            <td>
                <%=gfarr[i].Id %>
            </td>
            <td>
                <%=gfarr[i].Sender %>
            </td>
            <td>
                <%=gfarr[i].Recipient %>
            </td>
            <td>
                <%=gfarr[i].Amount %>
            </td>
            <td>
                <%=gfarr[i].Date %>
            </td>
        </tr>
        

        
        <%
            } %>
        

        </table>
    <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="btnSubmit" runat="server" Text="Submit"   />
   
    
</asp:Content>

