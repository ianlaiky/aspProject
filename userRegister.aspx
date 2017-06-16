<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="userRegister.aspx.cs" Inherits="userRegister" %>
<%@ Import Namespace="System.Security.Cryptography" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/aes.js"></script>

 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .strong   { color: green}
        .medium   { color: blue}
        .weak     { color: red}
    </style>
    <script type="text/javascript">


       

        $(function () {
            $("#<%=birthdayInput.ClientID%>").datepicker();
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

            
//            document.getElementById("plscheckpassword").innerHTML = "New text!";



        });

    



        function GeneratePwd() {
            if ((document.getElementById("<%=TextBox1.ClientID%>").value !== "") &&
            ((document.getElementById("<%=confirmpassword.ClientID%>").value) ===
                (document.getElementById("<%=TextBox1.ClientID%>").value))) {


                document.getElementById("plscheckpassword").innerHTML = "";

                console.log("readydfsdfg!");
                console.log(document.getElementById("<%=TextBox1.ClientID%>").value);

                var passtemp = document.getElementById("<%=TextBox1.ClientID%>").value;

                document.getElementById("<%=TextBox1.ClientID%>").value =
                    md5(document.getElementById("<%=TextBox1.ClientID%>").value + "<%=salt%>");

                document.getElementById('<%=HiddenFieldForSalt.ClientID%>').value = "<%=salt%>";

//               sha1(document.getElementById("<%=TextBox1.ClientID%>").value);
                var sha1AsKey = sha1.create();
                sha1AsKey.update(passtemp + "<%=salt%>");
                sha1AsKey.hex();


                console.log("SAlt is " + "<%=salt%>");

              


                sha1AsKey = sha1AsKey.toString();
                console.log("password sha1 " + sha1AsKey);
                //using crypto-js, code.google.com/archive/p/crypto-js/
                //encrypt
                var ciphertext = CryptoJS.AES.encrypt('my messtage', sha1AsKey);


                console.log("cipher " + ciphertext);

                // Decrypt 
                var decrypt = CryptoJS.AES.decrypt(ciphertext.toString(), sha1AsKey);
                var plaintext = decrypt.toString(CryptoJS.enc.Utf8);

                console.log("dasds " + plaintext);


                //encryption process starts here
                //encrypted for first name
                var retrievefirstname = document.getElementById('<%=firstNameInput.ClientID%>').value;
                retrievefirstname = retrievefirstname.toString();
                var cipherFirstname = CryptoJS.AES.encrypt(retrievefirstname, sha1AsKey);
//                console.log("Debug cipher for firstname: " + cipherFirstname);
                document.getElementById('<%=HiddenFieldFirstNameEncrypted.ClientID%>').value = cipherFirstname;

                //encrypted for lastname 
                var retrieveLastName = document.getElementById('<%=lastNameInput.ClientID%>').value;
                retrieveLastName = retrieveLastName.toString();
                var cipherLastname = CryptoJS.AES.encrypt(retrieveLastName, sha1AsKey);
//                console.log("Debug cipher for lastname: " + cipherLastname);
                document.getElementById('<%=HiddenFieldLastNameEncrypted.ClientID%>').value = cipherLastname;

                //encrypted for address 
                var retrieveaddress = document.getElementById('<%=addressInput.ClientID%>').value;
                retrieveaddress = retrieveaddress.toString();
                var cipheraddress = CryptoJS.AES.encrypt(retrieveaddress, sha1AsKey);
//                console.log("Debug cipher for address: " + cipheraddress);
                document.getElementById('<%=HiddenFieldAddressEncrypted.ClientID%>').value = cipheraddress;

                //encrypted for birthday
                var retrievebirthday =  document.getElementById('<%=birthdayInput.ClientID%>').value;
                retrievebirthday = retrievebirthday.toString();
                var cipherbirthday = CryptoJS.AES.encrypt(retrievebirthday, sha1AsKey);
//                console.log("Debug cipher for birthday: " + cipherbirthday);
                document.getElementById('<%=HiddenFieldBirthdayEncrypted.ClientID%>').value = cipherbirthday;

                //encrypted for nric 
                var retrieveNric = document.getElementById('<%=nricInput.ClientID%>').value;
                retrieveNric = retrieveNric.toString();
                var cipherNric = CryptoJS.AES.encrypt(retrieveNric, sha1AsKey);
                //console.log("Debug cipher for nric: " + cipherNric);
                document.getElementById('<%=HiddenFieldNricEncrypted.ClientID%>').value = cipherNric;


                //decryp test
//                var t1 = document.getElementById('<%=HiddenFieldFirstNameEncrypted.ClientID%>').value;
//                var d1 = CryptoJS.AES.decrypt(t1.toString(), sha1AsKey);
//                var tex = d1.toString(CryptoJS.enc.Utf8);
//
//                console.log("first name " + tex);



                // must return true; false for testing 
                return true;
            } else {
                document.getElementById("plscheckpassword").innerHTML = "Type a password OR Password do not match";
                return false;
            }
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
        sha1hash = sha1hash.toString();



       

        //encrypt testing usign crypto-js

        //encrypt
        var testval='fd';

        var ciphertext = CryptoJS.AES.encrypt(testval, '123');


        console.log("cipher " + ciphertext);

        // Decrypt 
        var bytes = CryptoJS.AES.decrypt(ciphertext.toString(),'123');
        var plaintext = bytes.toString(CryptoJS.enc.Utf8);

        console.log("dasds " + plaintext);



        //angular js



        var app = angular.module('myApp', []);

        app.controller('AppCtrl', function ($scope) {

        });

        app.directive("passwordStrength", function () {
            return {
                restrict: 'A',
                link: function (scope, element, attrs) {
                    scope.$watch(attrs.passwordStrength, function (value) {
                        console.log(value);
                        if (angular.isDefined(value)) {
                            if (value.length > 8) {
                                scope.strength = 'strong';
                            } else if (value.length > 3) {
                                scope.strength = 'medium';
                            } else {
                                scope.strength = 'weak';
                            }
                        }
                    });
                }
            };
        });




    </script>


    <%--Test phone--%> 

    <%--What is the equiv of response.setattribute--%>
    <%--have first page store all encrypted? data then use above to transfer to the phone page for verifivcation--%>


<%--    todo impt: retrieve username from db to make sure no collision--%>
<%--    todo Phone no, password (see below), passord verify and cap + other data --%>
<%--    DATABASE--%>
<%--    check intellji for reference--%>
<%--    dne pass strength--%>

    

    <%--IMPT:Pass hash on client is done, generate salt to be hashed on client side & hash and salt on server side--%>
    <%--Angularjs check pass strnth--%>

    <div class="card-content">
         <asp:HiddenField ID="antiforgery" runat="server" />
       
        
        
<%--       For debuging purpose: salt: <%=salt %>--%>
        
<%--        salt hidden textbox--%>
        <asp:HiddenField ID="HiddenFieldForSalt" runat="server" />

    
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">account_circle</i>
            </span>
           
        
            <asp:TextBox ID="Username" runat="server" class="form-control" placeholder="Username..."></asp:TextBox>
           
            <asp:RequiredFieldValidator ID="UserNameValidator" runat="server" ErrorMessage="Please key in a username" ControlToValidate="Username" ForeColor="Red"></asp:RequiredFieldValidator>  <br/>
            <asp:CustomValidator ID="UsernameCustomValidator1"  OnServerValidate="existinguser_Validate" runat="server" ErrorMessage="Username taken" ControlToValidate="Username" EnableClientScript="True" ForeColor="Red"></asp:CustomValidator>
            

           

       
        </div>
        
        
        
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons"><i class="material-icons">chrome_reader_mode</i></i>
            </span>
           
           
            <asp:TextBox ID="nricInput" runat="server" class="form-control" placeholder="Nric..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="nircInputRequiredFieldValidator1" runat="server" ErrorMessage="Please key in your Nric" ControlToValidate="nricInput" ForeColor="Red"></asp:RequiredFieldValidator>
            
          

            <asp:HiddenField ID="HiddenFieldNricEncrypted" runat="server" />

            

           

       
        </div>

         <div class="input-group" ng-app="myApp"  ng-controller="AppCtrl">
            <span class="input-group-addon">
                <i class="material-icons">lock_outline</i>
            </span>
          
               <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Password..." ng-model="user.password" password-strength="user.password"></asp:TextBox>
             
            

             <span data-ng-class="strength">Your Password Strength is: {{strength}}</span> 
             <asp:RequiredFieldValidator ID="passwordRequireValidator" runat="server" ErrorMessage="Password not entered" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
             <asp:TextBox ID="confirmpassword" runat="server" class="form-control" placeholder="Confirm password..."></asp:TextBox>
             <span id="plscheckpassword" style="color: red"></span>

        </div>

        <br />

        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">face</i>
            </span>
            <div>
                <asp:TextBox ID="firstNameInput" runat="server" class="form-control" placeholder="First Name..."></asp:TextBox>
                <asp:RequiredFieldValidator ID="firstNameRequiredFieldValidator" runat="server" ErrorMessage="Please enter first name" ControlToValidate="firstNameInput" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="lastNameInput" runat="server" class="form-control" placeholder="Last Name..."></asp:TextBox>
                <asp:RequiredFieldValidator ID="lastNameRequiredFieldValidator" runat="server" ErrorMessage="Please enter last name" ControlToValidate="lastNameInput" ForeColor="Red"></asp:RequiredFieldValidator>
                
                <asp:HiddenField ID="HiddenFieldFirstNameEncrypted" runat="server" />
                <asp:HiddenField ID="HiddenFieldLastNameEncrypted" runat="server" />
            </div>
        </div>





        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">contact_phone</i>
            </span>
            <asp:TextBox ID="phoneNumberInput" runat="server" class="form-control" placeholder="Phone Number..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="PhoneNoRequiredFieldValidator" runat="server" ErrorMessage="Please Key in Phone number" ControlToValidate="phoneNumberInput" ForeColor="Red"></asp:RequiredFieldValidator>


        </div>

        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">location_on</i>
            </span>
            <asp:TextBox ID="addressInput" runat="server" class="form-control" placeholder="Address..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="addressInputRequiredFieldValidator" runat="server" ErrorMessage="Please enter an address" ControlToValidate="addressInput" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:HiddenField ID="HiddenFieldAddressEncrypted" runat="server" />

        </div>

        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">email</i>
            </span>
            <asp:TextBox ID="emailInput" runat="server" class="form-control" placeholder="Email..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="emailInputRequiredFieldValidator" runat="server" ErrorMessage="Please enter an email" ControlToValidate="emailInput" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="emailInput" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

        </div>

        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">cake</i>
            </span>
            <asp:TextBox ID="birthdayInput" runat="server" class="form-control" placeholder="Birthday..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="birthdayInputRequiredFieldValidator" runat="server" ErrorMessage="Please enter your birthday" ControlToValidate="birthdayInput" ForeColor="Red"></asp:RequiredFieldValidator>
              


            <asp:HiddenField ID="HiddenFieldBirthdayEncrypted" runat="server" />
            
            
            

	        

        </div>
      

        <br />


        <center>
 <div class="g-recaptcha" data-sitekey="6Ld9kCMUAAAAAJUvZurvKQGtAybXBjEKmi3w9-Q5" runat="server"></div>
<asp:CustomValidator ID="CaptchaCustomValidator1" OnServerValidate="captcha_validate" runat="server" ErrorMessage="Please do the captcha" ForeColor="Red"></asp:CustomValidator>
</center>

    </div>



    <div class="footer text-center">
        <asp:Button ID="Button1" class="btn btn-primary btn-round" runat="server" Text="Register" OnClick="Button1_Click1" OnClientClick="if(!GeneratePwd()){return false}"/>



    </div>
  
    
<%--todo use this btn for username check--%>
<%--    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click"/>--%>
</asp:Content>

