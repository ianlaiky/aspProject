<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="userRegister.aspx.cs" Inherits="userRegister" %>

<%-- helllo --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <div class="card-content">
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">face</i>
            </span>
            <input rubat="server" type="text" class="form-control" name="firstName"
                placeholder="First Name..." required>
        </div>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">contact_phone</i>
            </span>
            <input type="text" class="form-control" pattern="[0-9]{8}"
                name="contactPhone" placeholder="Phone number: 12345678" required>
        </div>
        <div ng-app="" class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">lock_outline</i>
            </span>
            <input ng-model="temptest" type="password" placeholder="Password..." name="pPass"
                class="form-control" required>

            <p>Passsword test: {{temptest}}</p>
        </div>
        <!-- If you want to add a checkbox to this form, uncomment this code -->
        <%--<div class="checkbox">--%>
        <%--<label>--%>
        <%--<input type="checkbox" name="optionsCheckboxes" checked> I agree to the--%>
        <%--<a href="#something">terms and conditions</a>.--%>
        <%--</label>--%>
        <%--</div>--%>
    </div>


    <%--form action--%>
    <div class="footer text-center">
        <asp:Button ID="Button1" class="btn btn-primary btn-round" runat="server" Text="Register" />
       
    </div>


</asp:Content>

