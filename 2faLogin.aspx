<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="2faLogin.aspx.cs" Inherits="_2faLogin" %>
<%@ Import Namespace="System.Security.Cryptography" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/aes.js"></script>
    <script src="assets/js/md5.min.js"></script>
    
    <%
        //check if user is logged in
        string checkers = (string) Session["accountLoginVerified"];
        if (checkers !="true")
        {
            Response.Redirect("login.aspx",true);
        }



        //        Server side decryption

        string username = (string) Session["usernameLogin"];
        string md5hash = (string) Session["md5Store"];

        UserCustomer cu = new UserCustomer();
        cu = cu.getAllDataByName(username);

        string salt = cu.Passwordsalt;

        string firstNameCipher = cu.FirstName;
        string lastNameCipher = cu.LastName;
        string nricCipher = cu.Nric;
        string phone = cu.PhoneNo;

       
        byte[] salttoByte = Convert.FromBase64String(salt);

       
        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(md5hash, salttoByte);


        RijndaelManaged cipher = new RijndaelManaged();

        //set key and initialisation vec from rfc
        cipher.Key = pdb.GetBytes(32);
        cipher.IV = pdb.GetBytes(16);
        ICryptoTransform decryptTransform = cipher.CreateDecryptor();



        byte[] cipherFirstname = Convert.FromBase64String(firstNameCipher);
        byte[] cipherlastName = Convert.FromBase64String(lastNameCipher);
        byte[] cipherNric = Convert.FromBase64String(nricCipher);
        byte[] cipherphone = Convert.FromBase64String(phone);

        byte[]plaintextFirstNam4 = decryptTransform.TransformFinalBlock(cipherFirstname, 0, cipherFirstname.Length);
        byte[]plaintextlastName = decryptTransform.TransformFinalBlock(cipherlastName, 0, cipherlastName.Length);
        byte[]plaintextNric = decryptTransform.TransformFinalBlock(cipherNric, 0, cipherNric.Length);
        byte[]plaintextPhone = decryptTransform.TransformFinalBlock(cipherphone, 0, cipherphone.Length);

        string resultFirstName = Encoding.UTF8.GetString(plaintextFirstNam4);
        string resultlsatName = Encoding.UTF8.GetString(plaintextlastName);
        string resultNric = Encoding.UTF8.GetString(plaintextNric);
        string resultPhone = Encoding.UTF8.GetString(plaintextPhone);

//
//        Random rnd = new Random();
//        string digit = rnd.Next(999999).ToString();
//        Session["rngPhoneL"] = digit;
//
//
//        string resPhone = "+65" + resultPhone;
//
//        Tzwilio g = new Tzwilio(resPhone, digit);
//        g.choasSms();


%>
    
    

    <script>

        var sha1 = localStorage.getItem("sha1Key");
        console.log("sha 1 " + sha1);








        //        clientside decryption


        var decFirstName = CryptoJS.AES.decrypt("<%=resultFirstName%>", sha1).toString(CryptoJS.enc.Utf8);;
        var decLastName = CryptoJS.AES.decrypt("<%=resultlsatName%>", sha1).toString(CryptoJS.enc.Utf8);;
        var decNric = CryptoJS.AES.decrypt("<%=resultNric%>", sha1).toString(CryptoJS.enc.Utf8);;

        console.log("Firstname " + decFirstName);
        console.log("Firstname " + decLastName);

        var print = "Welcome Back, " + decFirstName + " " + decLastName + ", Nric: " + decNric;

        $(document).ready(function () {
            console.log("readydfsdfg!");


         

            document.getElementById("welcomeback").innerHTML = print;

        });
   
   


        

    </script>
    <br />
    <br/>
   
    <div class="card card-login card-hidden">
        <br>

        <%--      <h4 style="font-size: 25px">A one time code has been sent to your number ending ****7766</h4>--%>
        <span class="label label-warning" style="font-size: 11px">A one time code has been sent to your number <%=resultPhone %></span><br/> <br/>
        <span id="welcomeback">gfdg</span>
        <br/>
        <br/>
       <center> <asp:Button  class="btn btn-danger" ID="Button100" runat="server" Text="Request For OTP" OnClick="Button100_Click" /></center>
        

        <br/>
        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">fingerprint</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Insert your OTP Here </label>


                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                    <br/>
                    <asp:Label ID="Label1" runat="server" Text=" " ForeColor="red"></asp:Label>
                </div>
            </div>


        </div>
        <div class="footer text-center">
            <asp:Button ID="Button2" class="btn btn-rose btn-simple btn-wd btn-lg" runat="server" Text="Sign in" OnClick="Button2_Click"/>
        </div>

    </div>
</asp:Content>