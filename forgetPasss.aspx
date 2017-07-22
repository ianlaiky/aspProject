<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="forgetPasss.aspx.cs" Inherits="forgetPasss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="card card-login card-hidden">
        <div class="card-header text-center" data-background-color="rose">
            <h4 class="card-title">Login</h4>
           
        </div>
        <p class="category text-center">
            <span style="font-size: 20px" class="label label-info">Forget Password</span>
        </p>
        <div class="card-content">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">face</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please enter Username</label>
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox1" runat="server"></asp:TextBox>

                  

                </div>
            </div>

          
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">face</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please key in your Birthday</label>
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox2" runat="server"></asp:TextBox>

                  

                </div>
            </div>

            <div class="input-group">
                <span class="input-group-addon">
                    <i class="material-icons">face</i>
                </span>
                <div class="form-group label-floating">
                    <label class="control-label">Please key in your Email</label>
                  
                    
                    <asp:TextBox class="form-control" name="username" ID="TextBox3" runat="server"></asp:TextBox>

                  

                </div>
            </div>
            
            <br/>
            <br/>
            
           <center>
               <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
               <asp:Button  class="btn btn-danger" ID="Button1" runat="server" Text="Enter" /></center>
    
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

