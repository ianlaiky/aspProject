<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="userRegister.aspx.cs" Inherits="userRegister" %>

<%-- TO DO LISt --%>
<%--<%Response.Write(Session.SessionID)%>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

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




    <%-- TODO: Phone no, password (see below), pass verify****** and cap + other data --%>
    <%--DATABASE--%>
    <%--check intellji for reference--%>




    <%--IMPT:Pass hash on client is done, generate salt to be hashed on client side & hash and salt on server side--%>
    <%--Angularjs check pass strnth--%>

    <div class="card-content">

        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">face</i>
            </span>
            <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="First Name..."></asp:TextBox>



        </div>






    </div>

    <%--TODO: add these guys down here to the main div--%>
    <%--ME\/--%>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <%--AND ME \/--%>
    <asp:HiddenField ID="antiforgery" runat="server" />


    <div class="footer text-center">
        <asp:Button ID="Button1" class="btn btn-primary btn-round" runat="server" Text="Register" OnClick="Button1_Click1" />



    </div>


</asp:Content>

