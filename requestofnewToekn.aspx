<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="requestofnewToekn.aspx.cs" Inherits="requestofnewToekn" %>
<%@ Import Namespace="System.Security.Cryptography" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/aes.js"></script>
    <script src="assets/js/md5.min.js"></script>
    <a  class="btn btn-default" href="YourAccount.aspx">Home</a>
    <a  class="btn btn-default" href="TransferFund.aspx">Transfer fund</a>
    <a  class="btn btn-default" href="requestofnewToekn.aspx">Request New BankBook</a>
    <div style="text-align: center;" >
        
        <h2>Requests for new bankbook</h2>
    </div>
    


           
           
      <%

          if (Session["adminlogoncheckpls"].ToString().Equals("true"))
          {
              Response.Redirect("adminpg.aspx",true);
          }

          string username = (string)Session["usernameLogin"];
          string md5hash = (string)Session["md5Store"];
          UserCustomer cu = new UserCustomer();
          cu = cu.getAllDataByName(username);
          string salt = cu.Passwordsalt;

          string addres = cu.Address;

          byte[] salttoByte = Convert.FromBase64String(salt);

          
          Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(md5hash, salttoByte);


          RijndaelManaged cipher = new RijndaelManaged();

          //set key and initialisation vec from rfc
          cipher.Key = pdb.GetBytes(32);
          cipher.IV = pdb.GetBytes(16);
          ICryptoTransform decryptTransform = cipher.CreateDecryptor();



          byte[] cipheraddress = Convert.FromBase64String(addres);

          byte[]plaintextaddre = decryptTransform.TransformFinalBlock(cipheraddress, 0, cipheraddress.Length);

          string resultaddrr = Encoding.UTF8.GetString(plaintextaddre);

           %>
        
    
    <script>
        

        var sha1 = localStorage.getItem("sha1Key");
        console.log("sha 1 " + sha1);


        var decNric = CryptoJS.AES.decrypt("<%=resultaddrr%>", sha1).toString(CryptoJS.enc.Utf8);


        console.log("Firstname " + decNric);

      



        $(document).ready(function () {
            console.log("readydfsdfg!");


            var dsds = decNric;
            document.getElementById("addreeee").innerHTML = dsds;


            document.getElementById('<%=HiddenFieldtosendaddress.ClientID%>').value = dsds;

        });
    </script>

          
    <div class="input-group">
        <span class="input-group-addon" style="font-size: 20px">Your Address:
            <i class="material-icons"><i class="material-icons">location_on</i></i>
            <span style="font-size: 20px;text-decoration: underline;color: red " id="addreeee"></span>
        </span>

      
        <asp:HiddenField ID="HiddenFieldtosendaddress" runat="server" />
            

           

       
    </div>
    
    <br/>
    <br/>
    <br/>

    <div style="text-align: center;" >
        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Decrypt and Send request" OnClick="Button1_OnClick"/><br/>
        *By submitting this form, you are decrypting only your address field for the admin; Your key is not disclosed. 
    </div>


</asp:Content>







