<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="userRegisterInputConf.aspx.cs" Inherits="userRegisterInputConf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <%
        
        UserCustomer u = new UserCustomer();
        UserCustomer ux = new UserCustomer();

        ux = u.getAllDataByName(Session["nextPageUserReg"].ToString());

        string emailveri = ux.EmailVerified;
        string smsveri = ux.PhoneVerified;









    %>
    <script>


        var emailveri = <%=emailveri%>;
        console.log("ds"+emailveri);

        var smsveri = <%=smsveri%>;


        $(document).ready(function () {
         
       


            if (emailveri.toString() === "true") {
           

                document.getElementById("<%=enailcheck.ClientID%>").readOnly = true;
                document.getElementById("<%=enailcheck.ClientID%>").disabled = true;
                document.getElementById("<%=enailcheck.ClientID%>").placeholder = "Verified";
                document.getElementById("<%=Button1.ClientID%>").disabled = true;
                document.getElementById("<%=Button1.ClientID%>").value = "Verified";
                document.getElementById("<%=Button3.ClientID%>").style.visibility = "hidden";






            }


            if (smsveri.toString() === "true") {


                document.getElementById("<%=TextBox2.ClientID%>").readOnly = true;
                document.getElementById("<%=TextBox2.ClientID%>").disabled = true;
                document.getElementById("<%=TextBox2.ClientID%>").placeholder = "Verified";
                document.getElementById("<%=Button2.ClientID%>").disabled = true;
                document.getElementById("<%=Button2.ClientID%>").value = "Verified";

                document.getElementById("<%=Button4.ClientID%>").style.visibility = "hidden";
            
            }

        });


    </script>
    
    <div>
  
    
    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon">
                
              <span>Email: </span>      
                <i class="material-icons">email</i>
            </span>
            <asp:TextBox ID="enailcheck" runat="server" type="text" class="form-control" placeholder="Enter Confirmation OTP"></asp:TextBox>
            
           
        </div>
        
    </div>
<%--   <a class="btn btn-primary">Send confirmation</a>--%>
        
        <asp:Button ID="Button1" runat="server" Text="Request Email" class="btn btn-primary" OnClick="Button1_OnClick"/>
        
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" ></asp:Label>
    
    <br/>
        
        <asp:Button ID="Button3" runat="server" class="btn btn-primary" Text="Verify Email" OnClick="Button3_OnClick"/>
        
        <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red"></asp:Label>

    <br/>
    <br/>
    <br/>
  
    
    
    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon">
                <span>Phone: </span>  
                
                <i class="material-icons"><i class="material-icons">contact_phone</i></i>
            </span>
           
            <asp:TextBox ID="TextBox2" runat="server" type="text" class="form-control" placeholder="Enter Confirmation OTP "></asp:TextBox>
        </div>
    </div>
        <asp:Button ID="Button2" runat="server" Text="Request Sms" class="btn btn-primary" OnClick="Button2_OnClick"/>
        <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"></asp:Label>
 
    <br/>
        <asp:Button ID="Button4" runat="server" class="btn btn-primary" Text="Verify Phone" OnClick="Button4_OnClick"/>
        <asp:Label ID="Label4" runat="server" Text="" ForeColor="Red"></asp:Label>
    <br/>
    <br/>
    <br/>

        <div style="text-align: center;" >
            
            <a class="btn btn-primary" href="login.aspx">Login</a>
        </div>

    </div>
</asp:Content>



