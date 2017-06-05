<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="forgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <form id="RegisterValidation" action="" method="">
        <div class="card-header card-header-icon" data-background-color="rose">
            <i class="material-icons">mail_outline</i>
        </div>
        <div class="card-content">
            <h4 class="card-title">Forget Password</h4>
            <div class="form-group label-floating">
                <label class="control-label">
                    Email Address
                    <small>*</small>
                </label>
                <input class="form-control" name="email" type="email" required="true" />
            </div>
            <div class="form-group label-floating">
                <label class="control-label">
                    Password
                    <small>*</small>
                </label>
                <input class="form-control" name="password" id="registerPassword" type="password" required="true" />
            </div>
            <div class="form-group label-floating">
                <label class="control-label">
                    Confirm Password
                    <small>*</small>
                </label>
                <input class="form-control" name="password_confirmation" id="registerPasswordConfirmation" type="password" required="true" equalTo="#registerPassword" />
            </div>
            <div class="category form-category">
                <small>*</small> Required fields</div>
            <div class="form-footer text-right">
                <div class="checkbox pull-left">
                    <label>
                        <input type="checkbox" name="optionsCheckboxes"> Subscribe to newsletter
                    </label>
                </div>
                <button type="submit" class="btn btn-rose btn-fill">Register</button>
            </div>
        </div>
    </form>
</asp:Content>

