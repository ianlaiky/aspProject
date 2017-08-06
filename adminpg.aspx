<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="adminpg.aspx.cs" Inherits="adminpg" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <a  class="btn btn-default" href="adminpg.aspx">Home</a>
    <a  class="btn btn-default" href="adminpgtoviewLost.aspx">View user bankbook request</a>
    <br />
    <br />
    <%

        System.Diagnostics.Debug.WriteLine(Session["adminlogoncheckpls"].ToString());
        if (!Session["adminlogoncheckpls"].ToString().Equals("true"))
        {
            Response.Redirect("YourAccount.aspx",true);
        }

         %>

   
       
    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
     <table class="table" id="myTable">
    
        <tr>
            <th>ID</th>
            <th>Sender</th>
            <th>Recipient</th>
            <th>Amount(SGD)</th>
            <th>Date</th>
            <th>Description</th>
           
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
            <td>
                <%=gfarr[i].Description %>
            </td>
        </tr>
        

        
        <%
            } %>
        

        </table>
    <script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

   
    
</asp:Content>

