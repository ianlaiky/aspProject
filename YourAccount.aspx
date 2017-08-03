<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="YourAccount.aspx.cs" Inherits="YourAccount" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%
        if (Session["adminlogoncheckpls"].ToString().Equals("true"))
        {
            Response.Redirect("adminpg.aspx",true);
        }
      
      Fund fd = new Fund();
     double tr =  fd.getCurrentFund(Session["usernameLogin"].ToString());



    %>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">What you have:</td>
                
            </tr>
            <tr>
                <td class="auto-style2">
                    <div class="col-sm-4">
	<div class="form-group">
     <h2>  $<%=tr %></h2>
	</div>
                </div>

                </td>
                <td>
                  <div class="col-sm-4">
	<div class="form-group">
     
	</div>
                <td>
                </div>    </tr>
  
           
        </table>
<!-- markup -->


<!-- javascript -->

<script>$('.datepicker').datepicker({
    weekStart: 1
 
});</script>

    <table class="table">
    <thead>
        <tr>
           
            <th>Transaction No</th>
            <th>Sender</th>
            <th>Recipient</th>
            <th>Amount(SGD)</th>
            <th>Date</th>
            <th>Description</th>
            
            
            

        </tr>
        <%
            Transaction us = new Transaction();
            List<Transaction> objer= us.getAllDataBySender(Session["usernameLogin"].ToString());

            for (int i = 0; i < objer.Count; i++)
            {



        %>
        <tr>
            <td>
                <%=objer[i].Id %>
            </td>
            <td>
                <%=objer[i].Sender %>
            </td>
            <td>
                <%=objer[i].Recipient %>
            </td>
            <td>
                <%=objer[i].Amount %>
            </td>
            <td>
                <%=objer[i].Date %>
            </td>
            <td>
                
                <%=objer[i].Description %>
            </td>
        </tr>
        
        
        <%
            }
        %>

    </thead>
    </table>

</asp:Content>

