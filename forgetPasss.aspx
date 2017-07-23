<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="forgetPasss.aspx.cs" Inherits="forgetPasss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <script src="assets/js/md5.min.js"></script>








    <script>
          

        function validationnn() {
            console.log("dsds");
            document.getElementById("<%=HiddenFieldCheckForValBu.ClientID%>").value = "hello";
//            var lala = document.getElementById("<%=TextBox1.ClientID%>").value +
//                document.getElementById("<%=TextBox6.ClientID%>").value +
//                document.getElementById("<%=TextBox5.ClientID%>").value +
//                document.getElementById("<%=TextBox3.ClientID%>").value +
//                document.getElementById("<%=TextBox2.ClientID%>").value;
//
//            var saa = md5(lala);
//
//            console.log(saa);
//           
//
//            document.getElementById("<%=HiddenFieldCheckForValBu.ClientID%>").value = saa;

            return false;

        }


        





    </script>
    

    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <h4 class="card-title">Forget Password</h4>

        </div>
        <p class="category text-center">
            <span style="font-size: 23px" class="label label-info">Fan Club Bankings</span>
        </p>
        <br/>
        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">face</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please key in Username</label>


                    <asp:TextBox class="form-control" name="username" ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Please enter your username" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>


                </div>
            </div>
            <asp:HiddenField ID="HiddenFieldCheckForValBu" runat="server" />
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">cake</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please key in your Birthday</label>


                    <asp:TextBox class="form-control" name="username" ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="birthdayInputRequiredFieldValidator" runat="server" ErrorMessage="*Please enter your birthday" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>


                </div>
            </div>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">email</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please key in your Email</label>


                    <asp:TextBox class="form-control" name="username" ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please enter your email" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>


                </div>
            </div>

            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">phone</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please key in your Phone Number</label>


                    <asp:TextBox class="form-control" name="username" ID="TextBox5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please enter your phone number" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">chrome_reader_mode</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please key in Your Nric</label>


                    <asp:TextBox class="form-control" name="username" ID="TextBox6" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please enter your Nric" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>


                </div>
            </div>


            <br/>
            <br/>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <center>
                <asp:Button class="btn btn-danger" ID="Button1" onClientClick="if(!validationnn()){return false}" runat="server" Text="Enter" OnClick="Button1_Click"/>
            </center>

        </div>
        <%--        <div class="footer text-center">--%>
        <%--        --%>
        <%--            --%>
        <%--            <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />--%>
        <%--           --%>
        <%--        </div>--%>
        <%--        <div class="footer text-center">--%>
        <%--            <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button2" runat="server" Text="Forget Password" OnClick="Button2_Click1"  />--%>
        <%--           --%>
        <%--        </div>--%>
    </div>
</asp:Content>