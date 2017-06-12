<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="userRegister.aspx.cs" Inherits="userRegister" %>
<%@ Import Namespace="System.Security.Cryptography" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <script type="text/javascript">


       

        $(function () {
            $("#<%=TextBox8.ClientID%>").datepicker();
        });
      

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
            if ((document.getElementById("<%=TextBox1.ClientID%>").value !== "")&&((document.getElementById("<%=confirmpassword.ClientID%>").value) === (document.getElementById("<%=TextBox1.ClientID%>").value))) {
                console.log("readydfsdfg!");
                console.log(document.getElementById("<%=TextBox1.ClientID%>").value);

                var passtemp = document.getElementById("<%=TextBox1.ClientID%>").value;

                document.getElementById("<%=TextBox1.ClientID%>").value = md5(document.getElementById("<%=TextBox1.ClientID%>").value + "<%=salt%>");

                document.getElementById('<%=HiddenFieldForSalt.ClientID%>').value = "<%=salt%>";

//               sha1(document.getElementById("<%=TextBox1.ClientID%>").value);
                var sha1AsKey = sha1.create();
                sha1AsKey.update(passtemp+"<%=salt%>");
                sha1AsKey.hex();


                console.log("SAlt is " + "<%=salt%>");

                console.log("password sha1 " + sha1AsKey);


                // must return true; false for testing 
                return false;
            }
        }



        function encryptData() {




            return true;

        }



        //hash functions test
        var hash = md5("valuejghee");
        console.log("<%=TextBox1.ClientID%>");


        console.log("testr? "+sha1('Message to hash'));


        sha1('Message to hash');
        var sha1hash = sha1.create();
        sha1hash.update('Message to hash');
        sha1hash.hex();

        console.log("SHA 1 test " + sha1hash);

        //end of test






    </script>


    <%--Test phone--%> 

    <%--What is the equiv of response.setattribute--%>
    <%--have first page store all encrypted? data then use above to transfer to the phone page for verifivcation--%>



<%--    todo Phone no, password (see below), passord verify and cap + other data --%>
<%--    DATABASE--%>
<%--    check intellji for reference--%>
<%--    todo pass strength--%>

    

    <%--IMPT:Pass hash on client is done, generate salt to be hashed on client side & hash and salt on server side--%>
    <%--Angularjs check pass strnth--%>

    <div class="card-content">
         <asp:HiddenField ID="antiforgery" runat="server" />
       
        
        
<%--       For debuging purpose: salt: <%=salt %>--%>
        
<%--        salt hidden textbox--%>
        <asp:HiddenField ID="HiddenFieldForSalt" runat="server" />

    
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">perm_identity</i>
            </span>
           
           <%--UpdatePanel controls--%>
            <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Username..."></asp:TextBox>
           
               

            
<%--todo username to be done like last project?            --%>
           

       
        </div>


         <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">lock_outline</i>
            </span>
          
               <asp:TextBox ID="TextBox1" runat="server"  class="form-control" placeholder="Password..."></asp:TextBox>
             <asp:TextBox ID="confirmpassword" runat="server" class="form-control" placeholder="Confirm password..."></asp:TextBox>

        </div>


        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">face</i>
            </span>
            <div>
                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="First Name..."></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Last Name..."></asp:TextBox>
                
                <asp:HiddenField ID="HiddenFieldFirstNameEncrypted" runat="server" />
                <asp:HiddenField ID="HiddenFieldLastNameEncrypted" runat="server" />
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

            <asp:HiddenField ID="HiddenFieldAddressEncrypted" runat="server" />

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

              


            <asp:HiddenField ID="HiddenFieldBirthdayEncrypted" runat="server" />
            
            
            

	

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

