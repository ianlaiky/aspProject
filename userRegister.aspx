<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="userRegister.aspx.cs" Inherits="userRegister" %>
<%-- TO DO LISt --%>
<%--<%Response.Write(Session.SessionID)%>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 
<script type="text/javascript">
    
    $(document).ready(function () {
        console.log("readydfsdfg!");

        
    });
   

    function GeneratePwd() {
        if (document.getElementById("<%=TextBox1.ClientID%>").value != "") {
            console.log("readydfsdfg!");
            console.log(document.getElementById("<%=TextBox1.ClientID%>").value);
            document.getElementById("<%=TextBox1.ClientID%>").value = md5(document.getElementById("<%=TextBox1.ClientID%>").value);
        }
    }
   

    var hash = md5("valuejghee");
    console.log("<%=TextBox1.ClientID%>");
</script>


    <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <div class="card-content">
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">face</i>
            </span>
            <input rubat="server" type="text" class="form-control" name="firstName"
                placeholder="First Name..." required>
        </div>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">contact_phone</i>
            </span>
            <input type="text" class="form-control" pattern="[0-9]{8}"
                name="contactPhone" placeholder="Phone number: 12345678" required>
        </div>
        <div ng-app="" class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">lock_outline</i>
            </span>
            <input ng-model="temptest" type="password" placeholder="Password..." name="pPass"
                class="form-control" required>

            <p>Passsword test: {{temptest}}</p>
        </div>--%>
        <!-- If you want to add a checkbox to this form, uncomment this code -->
        <%--<div class="checkbox">--%>
        <%--<label>--%>
        <%--<input type="checkbox" name="optionsCheckboxes" checked> I agree to the--%>
        <%--<a href="#something">terms and conditions</a>.--%>
        <%--</label>--%>
        <%--</div>--%>
    <%--</div>--%>


    <%--form action--%>



    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <asp:HiddenField ID="antiforgery" runat="server"/>


    <div class="footer text-center">
        <asp:Button ID="Button1" class="btn btn-primary btn-round" runat="server" Text="Register" OnClick="Button1_Click1"/>

        
       
    </div>
   

</asp:Content>

