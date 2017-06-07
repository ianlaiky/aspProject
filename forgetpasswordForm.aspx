<%@ Page Title="" Language="C#" MasterPageFile="~/testingofform.master" AutoEventWireup="true" CodeFile="forgetpasswordForm.aspx.cs" Inherits="ttt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!--        You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->
    <div class="wizard-header">
        <h3 class="wizard-title">
            Forget Your Passoword
        </h3>
        <h5>Why can't you sign in?</h5>
    </div>
    <div class="wizard-navigation">
        <ul>
            <li>
                <a href="#about" data-toggle="tab">I forgot my password</a>
            </li>
            <li>
                <a href="#account" data-toggle="tab">I know my password but i can't sign in</a>
            </li>
            <li>
                <a href="#address" data-toggle="tab">I think someone else is using my account</a>
            </li>
        </ul>
    </div>
    <div class="tab-content">
        <div class="tab-pane" id="about">
            <div class="row">
                <h4 class="info-text"> Let's start with the basic information </h4>
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="picture-container">
                        <div class="picture">
                            <img src="../../assets/img/default-avatar.png" class="picture-src" id="wizardPicturePreview" title="" />
                            <input type="file" id="wizard-picture">
                        </div>
                        <h6>Choose Picture</h6>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">face</i>
                        </span>
                        <div class="form-group label-floating">
                            <label class="control-label">Name
                            </label>
                            <%--                                                    <input name="name" type="text" class="form-control" value="<%=session.getAttribute("firstName")%>">--%>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">mood</i>
                        </span>
                        <div class="form-group label-floating">
                            <label class="control-label">Age
                            </label>
                            <input name="age" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div>
                            <label class="control-label">Gender
                            </label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="gender" value="male"> Male
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="gender" value="female"> Female
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="tab-pane" id="account">
            <h4 class="info-text"> What is your physical activity intensity?  </h4>
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="col-sm-4">
                        <div class="choice" data-toggle="wizard-radio">
                            <input type="radio" name="intensity" value="sedentary">
                            <div class="icon">
                                <i class="fa fa-meh-o fa-5x"></i>
                            </div>
                            <h6>Sedentary</h6>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="choice" data-toggle="wizard-radio">
                            <input type="radio" name="intensity" value="moderate">
                            <div class="icon">
                                <i class="fa fa-heart"></i>
                            </div>
                            <h6>Moderately Active</h6>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="choice" data-toggle="wizard-radio">
                            <input type="radio" name="intensity" value="active">
                            <div class="icon">
                                <i class="fa fa-bicycle"></i>
                            </div>
                            <h6>Active</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="address">
            <div class="row">
                <div class="col-sm-12 ">
                    <h4 class="info-text"> Your measurements will help us in more accurate calculation </h4>
                </div>
                <div class="col-sm-7 col-sm-offset-2">
                    <div class="form-group label-floating">
                        <label class="control-label">Height</label>
                        <input type="text" name="height" class="form-control">
                    </div>
                </div>

                <div class="col-sm-7 col-sm-offset-2">
                    <div class="form-group label-floating">
                        <label class="control-label">Weight</label>
                        <input type="text" name="weight" class="form-control">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="wizard-footer">
        <div class="pull-right">
            <input type='button' class='btn btn-next btn-fill btn-rose btn-wd' name='next' value='Next' />
            <input type='submit' class='btn btn-finish btn-fill btn-rose btn-wd' name='finish' value='Finish' />
        </div>
        <div class="pull-left">
            <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>

