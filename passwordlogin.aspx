<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="passwordlogin.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/aes.js"></script>
    <script src="assets/js/md5.min.js"></script>

    <%
        //check to see if user have keyed in username if username isnt keyed in, auto redirect to login.aspx
        string name = null;
        name = (string) Session["usernameLogin"];
        if (string.IsNullOrEmpty(name))
        {
            // redirect set to true so page is terminated
            Response.Redirect("login.aspx", true);
        }

        //will continue below if username isnt null or empty
        string username = (string) Session["usernameLogin"];

        UserCustomer cu = new UserCustomer();
        cu = cu.getAllDataByName(username);
        string salt = cu.Passwordsalt;
    %>
    <script>
        function hash() {


            if (document.getElementById("<%= TextBox2.ClientID %>").value !== "") {

                //client hash md5

                var passget = document.getElementById("<%= TextBox2.ClientID %>").value;

                var passsalt = passget + "<%= salt %>";

                var hash = md5(passsalt);

                document.getElementById("<%= TextBox2.ClientID %>").value = hash;

                console.log("hash " + hash);


                //sha1 key generation for aes decryption

              var sha1AsKey = sha1.create();
              sha1AsKey.update(passsalt);
              sha1AsKey.hex();

              sha1AsKey = sha1AsKey.toString();
              console.log("password sha1 " + sha1AsKey);

                //local storage of sha1 for key so server doesnt know the key for decryption
                // Check browser support
                if (typeof (Storage) !== "undefined") {
                    // Store
                    localStorage.setItem("sha1Key", sha1AsKey);
                } else {
                    alert("Our website dont support your browser!");
                }

           

                return true;

            } else {

                document.getElementById("error1").innerHTML = "Error! Please enter a password";
                return false;
            }


        }


    </script>

    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <htu4 class="card-title">Login</htu4>

        </div>
        <p class="category text-center">
            <span style="font-size: 20px" class="label label-primary">FAN CLUB BANKINGS</span>
        </p>
        <div class="card-content">

            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">lock_outline</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Password</label>


                    <asp:TextBox class="form-control" type="password" ID="TextBox2" runat="server"></asp:TextBox>
                    <span id="error1" style="color: red"></span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Pls enter a password" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br/>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*Password is invalid" ForeColor="Red" OnServerValidate="CustomValidator1_OnServerValidate"></asp:CustomValidator>
                </div>
            </div>

        </div>
        <div class="footer text-center">


            <asp:Button class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button1" runat="server" Text="Next" OnClientClick="if (!hash()) { return false }" OnClick="Button1_Click"/>


        </div>
        <div class="footer text-center">
            <%--             <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button2" runat="server" Text="Forget Password" OnClick="Button2_Click1"  />--%>

        </div>
    </div>


</asp:Content>