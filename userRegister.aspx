<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="userRegister.aspx.cs" Inherits="userRegister" %>
<%@ Import Namespace="System.Security.Cryptography" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <script type="text/javascript">
        

        <%
     

        //Generate random "salt"
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        byte[] saltByte = new byte[8];

        //Fills array of bytes with a cryptographically strong sequence of random values. 
        rng.GetBytes(saltByte);
          string salt = Convert.ToBase64String(saltByte);

         %>

        $(document).ready(function () {
            console.log("readydfsdfg!");

            
            //var node = document.createElement("LI");                 // Create a <li> node
            //var textnode = document.createTextNode("Water");
            //node.appendChild(textnode);

            //document.getElementById("<%=TextBox3.ClientID%>").appendChild(node);

            //$("#form-group is-empty").append('<p>Test</p>');



        });

    



        function GeneratePwd() {
            if (document.getElementById("<%=TextBox1.ClientID%>").value != "") {
                console.log("readydfsdfg!");
                console.log(document.getElementById("<%=TextBox1.ClientID%>").value);



                document.getElementById("<%=TextBox1.ClientID%>").value = md5(document.getElementById("<%=TextBox1.ClientID%>").value + "<%=salt%>");

                document.getElementById('<%=HiddenFieldForSalt.ClientID%>').value = "<%=salt%>";

                return true;
            }
        }


        var hash = md5("valuejghee");
        console.log("<%=TextBox1.ClientID%>");


    </script>


    <%--Test phone--%> 

    <%--What is the equiv of response.setattribute--%>
    <%--have first page store all encrypted? data then use above to transfer to the phone page for verifivcation--%>



<%--    todo Phone no, password (see below), pass verify and cap + other data --%>
<%--    DATABASE--%>
<%--    check intellji for reference--%>


    

    <%--IMPT:Pass hash on client is done, generate salt to be hashed on client side & hash and salt on server side--%>
    <%--Angularjs check pass strnth--%>

    <div class="card-content">
         <asp:HiddenField ID="antiforgery" runat="server" />
       
        
        
       For debuging purpose: salt: <%=salt %>
        
<%--        salt hidden textbox--%>
        <asp:HiddenField ID="HiddenFieldForSalt" runat="server" />


        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">perm_identity</i>
            </span>
           
           <%--UpdatePanel controls--%>
            <asp:TextBox ID="TextBox3" width="50%" alight="left" runat="server" class="form-control" placeholder="Username..."></asp:TextBox>
           
               

         
<%--todo username to be done like last project?            --%>
           

         
           
        

        </div>


         <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">lock_outline</i>
            </span>
          
               <asp:TextBox ID="TextBox1" runat="server"  class="form-control" placeholder="Password..."></asp:TextBox>


        </div>


        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">face</i>
            </span>
            <div>
                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="First Name..."></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Last Name..."></asp:TextBox>

            </div>
        </div>





        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">contact_phone</i>
            </span>
            <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Phone Number..."></asp:TextBox>



        </div>

        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">location_on</i>
            </span>
            <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="Address..."></asp:TextBox>



        </div>

        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">email</i>
            </span>
            <asp:TextBox ID="TextBox7" runat="server" class="form-control" placeholder="Email..."></asp:TextBox>



        </div>

        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">cake</i>
            </span>
            <asp:TextBox ID="TextBox8" runat="server" class="form-control" placeholder="Birthday..."></asp:TextBox>

              



            <%--do angular js datepicker--%>

        </div>



        <br />


        <center>
 <div class="g-recaptcha" data-sitekey="6Ld9kCMUAAAAAJUvZurvKQGtAybXBjEKmi3w9-Q5" runat="server"></div>

</center>

    </div>



    <div class="footer text-center">
        <asp:Button ID="Button1" class="btn btn-primary btn-round" runat="server" Text="Register" OnClick="Button1_Click1" OnClientClick="if(!GeneratePwd()){return false}"/>



    </div>
    
    
<%--todo use this btn for username check--%>
<%--    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click"/>--%>
</asp:Content>

