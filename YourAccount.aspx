<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="YourAccount.aspx.cs" Inherits="YourAccount" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

        <table class="auto-style1">
            <tr>
                <td class="auto-style2">What you have:</td>
                <td>What you own:</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <div class="col-sm-4">
	<div class="form-group">
       $
	</div>
                </td>
                <td>
                  <div class="col-sm-4">
	<div class="form-group">
     $
	</div>
                </td>
            </tr>
        </table>
<!-- markup -->
<input class="datepicker form-control" type="text" value="03/12/2016"/>

<!-- javascript -->

<script>$('.datepicker').datepicker({
    weekStart: 1
 
});</script>

    <table class="table">
    <thead>
        <tr>
            <th class="text-center">#</th>
            <th>Transaction</th>
            <th>Value Date</th>
            <th>Description</th>
            <th>Withdrawels(SGD)</th>
            <th>Deposits(SGD)</th>
        </tr>
    </thead>
    </table>

</asp:Content>

