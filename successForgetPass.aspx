<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="successForgetPass.aspx.cs" Inherits="successForgetPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <h4 class="card-title">Password Successfully Changed</h4>
           
        </div>
        <p class="category text-center">
            <span style="font-size: 20px" class="label label-warning">FAN CLUB BANKINGS</span>
        </p>
        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">done_all</i>
                </span>
                <div class="form-group label-floating">
                  <span class="label label-success" style="font-size: 7.6px" font-family="Arial">Your Password Has Been Successfully Changed! Click Below to Login
                    </span>

                </div>
            </div>

          
            

    
        </div>
        <div class="footer text-center">
        
            
            <asp:Button  class="btn btn-rose btn-simple btn-wd btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
           
        </div>
        <div class="footer text-center">
           
           
        </div>
    </div>

</asp:Content>

