<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
    
    
    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <h4 class="card-title">Login</h4>
           
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
                    <label class="control-label">Enter Username</label>
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox1" runat="server"></asp:TextBox>

                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Account is not Valid" ControlToValidate="TextBox1" OnServerValidate="CustomValidator1_OnServerValidate"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter username" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </div>
            </div>

          
            

    
        </div>
        <div class="footer text-center">
        
            
            <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />
           
        </div>
         <div class="footer text-center">
             <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button2" runat="server" Text="Forget Password" OnClick="Button2_Click1"  />
           
        </div>
    </div>
    

</asp:Content>

