﻿<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    
    
    
    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <htu4 class="card-title">Logins</htu4>
           
        </div>
        <p class="category text-center">
            Or Be Classical
        </p>
        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">face</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">First Name</label>
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox1" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">lock_outline</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Password</label>
                   
                    
                    <asp:TextBox class="form-control" type="password" ID="TextBox2" runat="server"></asp:TextBox>

                </div>
            </div>
        </div>
        <div class="footer text-center">
            <button id="loginPageBtn" type="submit"
                    class="btn btn-rose btn-simple btn-wd btn-lg">Let's go
            </button>
        </div>
         <div class="footer text-center">
            <button id="forgetPassword" type="submit"
                    class="btn btn-rose btn-simple btn-wd btn-lg"> Forget Password
            </button>
        </div>
    </div>
    

</asp:Content>

