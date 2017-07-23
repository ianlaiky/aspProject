<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="newPassword.aspx.cs" Inherits="newPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script src="assets/js/md5.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/aes.js"></script>
    <script src="assets/js/StringEscapeProperly.js"></script>
    <%
        UserCustomer cus = new UserCustomer();
       



 %>
    <script>


        function encrypo() {


            if ((document.getElementById("<%=TextBox1.ClientID%>").value !== "") &&
            ((document.getElementById("<%=TextBox1.ClientID%>").value) ===
                (document.getElementById("<%=TextBox2.ClientID%>").value))) {


               var pass = document.getElementById("<%=TextBox1.ClientID%>").value;

                var saltByUser = pass + "<%= cus.getAllDataByName(Session["forgetPassTosaveusername"].ToString()).Passwordsalt%>";

                document.getElementById("<%=TextBox1.ClientID%>").value = md5(saltByUser);
                document.getElementById("<%=TextBox2.ClientID%>").value = md5(saltByUser);


                var sha1AsKey = sha1.create();
                sha1AsKey.update(saltByUser);
                sha1AsKey.hex();
                sha1AsKey = sha1AsKey.toString();

                console.log("password sha1 " + sha1AsKey);


//                Session["forgetPassTosavephoneNumber"] = phoneNumber;
//                Session["forgetPassTosaveemail"] = email;
                //                Session["forgetPassTosavebirthday"] = birthday;



                //encrypted for nric 
                var retrieveNric = "<%=Session["forgetPassTosavenric"].ToString()%>";
                retrieveNric = retrieveNric.toString();
                var cipherNric = CryptoJS.AES.encrypt(retrieveNric, sha1AsKey);
                //console.log("Debug cipher for nric: " + cipherNric);
                document.getElementById('<%=HiddenFieldNricEncrypted.ClientID%>').value = cipherNric;


                //encrypted for birthday
                var retrievebirthday = "<%=Session["forgetPassTosavebirthday"].ToString()%>";
                retrievebirthday = retrievebirthday.toString();
                var cipherbirthday = CryptoJS.AES.encrypt(retrievebirthday, sha1AsKey);
//                console.log("Debug cipher for birthday: " + cipherbirthday);
                document.getElementById('<%=HiddenFieldBirthdayEncrypted.ClientID%>').value = cipherbirthday;



                return true;
            } else {
                document.getElementById("plscheckpassword").innerHTML = "Type a password OR Password do not match";
                return false;
            }





















        }


    </script>


    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <h4 class="card-title">New Password Confirmation</h4>

        </div>
        <p class="category text-center">
            <span style="font-size: 25px" class="label label-warning">FAN CLUB BANKINGS</span>
        </p>
        
        <asp:HiddenField ID="HiddenFieldNricEncrypted" runat="server" />
        
        <asp:HiddenField ID="HiddenFieldBirthdayEncrypted" runat="server" />

        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">lock</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please enter your new Password</label>


                    <asp:TextBox class="form-control" name="username" ID="TextBox1" runat="server" type="password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Please enter your new password" ForeColor="Red"></asp:RequiredFieldValidator>


                </div>
            </div>

            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">lock</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please confirm your new Password</label>


                    <asp:TextBox class="form-control" name="username" ID="TextBox2" runat="server" type="password"></asp:TextBox>  <span id="plscheckpassword" style="color: red">dsd</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Please confirm your new password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="*Password do not match" ForeColor="Red"></asp:CompareValidator>

                  
                </div>
            </div>


        </div>
        <div class="footer text-center">


            <asp:Button class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" OnClientClick="if(!encrypo()){return false}"/>

        </div>
        <div class="footer text-center">


        </div>
    </div>

</asp:Content>