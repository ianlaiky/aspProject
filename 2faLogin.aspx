<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="2faLogin.aspx.cs" Inherits="_2faLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="card card-login card-hidden">
        <br>
        
<%--      <h4 style="font-size: 25px">A one time code has been sent to your number ending ****7766</h4>--%>
        <span class ="label label-warning">A one time code has been sent to your number ending ****7766</span>
        <br/>
        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">fingerprint</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Insert your OTP Here </label>
                  
                    
                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                </div>
            </div>

           
        </div>
        <div class="footer text-center">
            <asp:Button ID="Button2" class="btn btn-rose btn-simple btn-wd btn-lg" runat="server" Text="Sign in" OnClick="Button2_Click" />
        </div>
       
    </div>
</asp:Content>

