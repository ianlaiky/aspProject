<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="decryptionTesting.aspx.cs" Inherits="decryptionTesting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/aes.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
        

        function decrypt() {

            console.log("dasd");
            var encrypted = document.getElementById("<%=TextBox1.ClientID%>").value;

            console.log("ENcrypted val " + encrypted);

            var key = document.getElementById("<%=TextBox2.ClientID%>").value;

            console.log("KEy is " + key);
          
            var cip = CryptoJS.AES.decrypt(encrypted, key);
            console.log("cipher" + cip);

            var plaintext = cip.toString(CryptoJS.enc.Utf8);

            console.log("dasds " + plaintext);


            document.getElementById("<%=TextBox3.ClientID%>").value = plaintext;



            // must return true; false for testing
            return false;

        }


        //encrypt testing usign crypto-js

        //encrypt
        var ciphertext = CryptoJS.AES.encrypt('my messtage', '12d334');


        console.log("cipher " + ciphertext);

        // Decrypt 
        var bytes = CryptoJS.AES.decrypt(ciphertext.toString(), '12d334');
        var plaintext = bytes.toString(CryptoJS.enc.Utf8);

        console.log("dasds " + plaintext);


    </script>
    
    
    
    Cipher text: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br/>
    Key:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    
    <br/>
    
    Plain: <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    
    
    
    
    
    
    

    
    
    <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="if(!decrypt()){return false}"/>

</asp:Content>

