<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="EmailOtp.aspx.cs" Inherits="EmailOtp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    

    <%








    %>

    
    

    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <h4 class="card-title">Forget Password</h4>

        </div>
        <p class="category text-center">
            <span style="font-size: 25px" class="label label-info">Fan Club Bankings</span>
            <asp:Label ID="Label2" runat="server" Text="Please enter the otp that was sent to your email"></asp:Label>

        </p>
        <br/>
        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">fingerprint</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please enter the OTP here</label>


                    <asp:TextBox class="form-control" name="username" ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Please enter the OTP" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>


                </div>
            </div>
            <br />
            <asp:Label ID="Label1" runat="server" Text="" ForeColor="red"></asp:Label>
            <center>
                <asp:Button class="btn btn-danger" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"/>

                <br />
                <asp:Label ID="otpError" runat="server" Text="" foreColor="Red"></asp:Label>

            </center>

        </div>

    </div>
</asp:Content>

