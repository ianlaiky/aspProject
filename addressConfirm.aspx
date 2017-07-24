<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="addressConfirm.aspx.cs" Inherits="addressConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="assets/js/sha1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/aes.js"></script>
    <script src="assets/js/StringEscapeProperly.js"></script>
    <script src="assets/js/md5.min.js"></script>
    
    <script>
        $(function () {


            var sha1AsKey = sha1.create();
            sha1AsKey =  "<%=Session["sha1askeyforcleintx"].ToString()%>";

            console.log("fd");
            var ciphertext = CryptoJS.AES.encrypt('my messtage', sha1AsKey);


            console.log("cipher " + ciphertext);

        });

        function encrypt() {
//
//            var firstname = document.getElementById("<%=TextBox1.ClientID%>").value;
//            var lastname = document.getElementById("<%=TextBox2.ClientID%>").value;
//            var address = document.getElementById("<%=TextBox4.ClientID%>").value;
//
//
          

            var sha1AsKey = sha1.create();
            sha1AsKey =  "<%=Session["sha1askeyforcleintx"].ToString()%>";


            console.log(sha1asKey);
            console.log(htmlEncode(document.getElementById('<%=TextBox1.ClientID%>').value));


//            
//
//
           //encrypted for first name
//            var retrievefirstname = htmlEncode(document.getElementById('<%=TextBox1.ClientID%>').value);
//            retrievefirstname = retrievefirstname.toString();
//
//            var cipherFirstname = CryptoJS.AES.encrypt(retrievefirstname, sha1AsKey);
////
//            document.getElementById('<%=HiddenFieldFirstNameEncrypted.ClientID%>').value = cipherFirstname;
//
//            console.log(cipherFirstname);
//            //            

//
//
//
//
//
//            //encrypted for lastname 
//            var retrieveLastName = htmlEncode(document.getElementById('<%=TextBox2.ClientID%>').value);
//            retrieveLastName = retrieveLastName.toString();
//            var cipherLastname = CryptoJS.AES.encrypt(retrieveLastName, sha1AsKey);
////                console.log("Debug cipher for lastname: " + cipherLastname);
//            document.getElementById('<%=HiddenFieldLastNameEncrypted.ClientID%>').value = cipherLastname;
//
//
//
//
//            //encrypted for address 
//            var retrieveaddress = htmlEncode(document.getElementById('<%=TextBox4.ClientID%>').value);
//            retrieveaddress = retrieveaddress.toString();
//            var cipheraddress = CryptoJS.AES.encrypt(retrieveaddress, sha1AsKey);
////                console.log("Debug cipher for address: " + cipheraddress);
//            document.getElementById('<%=HiddenFieldAddressEncrypted.ClientID%>').value = cipheraddress;


            return false;

        }





    </script>
    <asp:HiddenField ID="HiddenFieldAddressEncrypted" runat="server" />
    <asp:HiddenField ID="HiddenFieldLastNameEncrypted" runat="server" />
    <asp:HiddenField ID="HiddenFieldFirstNameEncrypted" runat="server" />
    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <h4 class="card-title">Updating your Details...</h4>
           
        </div>
        <p class="category text-center">
            <span style="font-size: 20px" class="label label-warning">FAN CLUB BANKINGS</span>
        </p>
        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">face</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please enter your First Name</label>
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox1" runat="server"></asp:TextBox>

                 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Pls enter your first name" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                

                </div>
            </div>

          
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">face</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please enter Last Name</label>
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox2" runat="server"></asp:TextBox>

<%--                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="*Account is not valid" ControlToValidate="TextBox1" ForeColor="Red" OnServerValidate="CustomValidator1_OnServerValidate"></asp:CustomValidator>--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Pls enter your First Name" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
<%--                    <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="*Only alphanumeric characters allowed" ControlToValidate="TextBox1" ForeColor="Red" OnServerValidate="usernameRe_OnServerValidate"></asp:CustomValidator>--%>

                </div>
            </div>
            
          
            </div>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">face</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please enter Address</label>
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox4" runat="server"></asp:TextBox>

                    <%--                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="*Account is not valid" ControlToValidate="TextBox1" ForeColor="Red" OnServerValidate="CustomValidator1_OnServerValidate"></asp:CustomValidator>--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Pls enter your Address" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>
                    <%--                    <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="*Only alphanumeric characters allowed" ControlToValidate="TextBox1" ForeColor="Red" OnServerValidate="usernameRe_OnServerValidate"></asp:CustomValidator>--%>

                </div>
            </div>
    
        </div>
        <div class="footer text-center">
        
            
            <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button1" runat="server" Text="Next" OnClientClick="if(!encrypt()){return false}" OnClick="Button1_Click" />
           
        </div>
        <div class="footer text-center">
<%--            <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button2" runat="server" Text="Forget Password" OnClick="Button2_Click1"  />--%>
           
        </div>


</asp:Content>

