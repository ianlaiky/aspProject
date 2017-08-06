<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="adminpgtoviewLost.aspx.cs" Inherits="adminpgtoviewLost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/aes.js"></script>
    <script src="assets/js/md5.min.js"></script>
    <a  class="btn btn-default" href="adminpg.aspx">Home</a>
    <a  class="btn btn-default" href="adminpgtoviewLost.aspx">View user bankbook request</a>
    <div style="text-align: center;" >
        <h3>Users that request new bankbook</h3>
    </div>
    
    <%

        System.Diagnostics.Debug.WriteLine(Session["adminlogoncheckpls"].ToString());
        if (!Session["adminlogoncheckpls"].ToString().Equals("true"))
        {
            Response.Redirect("YourAccount.aspx", true);
        }

    %>
    
    <table class="table">
        <thead>
        <tr>
            <th>User</th>
            <th>Address</th>
           
           
        </tr>         
        
            
            <tr>
                
                
                <%
                    Tokenrequest trq = new Tokenrequest();

                    List<Tokenrequest> daarr = new List<Tokenrequest>();

                    daarr = trq.getAllUserName();



                    for (int i = 0; i < daarr.Count; i++)
                    {



                    




                %>
                
                <tr>
                    <td>
                        <%=daarr[i].Username %>

                    </td>
                    
                    <td>
                        <%=daarr[i].Address %>
                    </td>
                    
                    

                    
                    

                </tr>
                
                
                
                <% }

                %>
            </tr>
      
        

    </table>

    

</asp:Content>

