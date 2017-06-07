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
    	<input type="text" value="$0.00" placeholder="" class="form-control" />
	</div>
                </td>
                <td>
                  <div class="col-sm-4">
	<div class="form-group">
    	<input type="text" value="$0.00" placeholder="" class="form-control" />
	</div>
                </td>
            </tr>
        </table>
</asp:Content>

