<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="newPassword.aspx.cs" Inherits="newPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
   

    
    

    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <h4 class="card-title">New Password Confirmation</h4>
           
        </div>
        <p class="category text-center">
            <span style="font-size: 25px" class="label label-warning">FAN CLUB BANKINGS</span>
        </p>
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
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox2" runat="server" type="password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Please confirm your new password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="*Password do not match" ForeColor="Red"></asp:CompareValidator>

                

                </div>
            </div>
            

    
        </div>
        <div class="footer text-center">
        
            
            <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />
           
        </div>
        <div class="footer text-center">
       
           
        </div>
    </div>
    
</asp:Content>

