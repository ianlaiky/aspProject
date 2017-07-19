<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="TransferFund.aspx.cs" Inherits="TransferFund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <table class="auto-style1">
            <tr>
                <td class="auto-style2">Name(as per bank&#39;s record):</td>
                <td>
                   <textarea class="form-control" placeholder="Here can be your nice text" rows="1"></textarea>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Account no:</td>
                <td>
                    <textarea class="form-control" placeholder="Here can be your nice text" rows="1"></textarea>
                </td>
            </tr>

            <tr>
                <td class="auto-style2">Email of account holder(if you wish to notify them of payment:</td>
                <td>
                   <textarea class="form-control" placeholder="Here can be your nice text" rows="1"></textarea>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="height: 97px">Your initials:</td>
                <td style="height: 97px">
                    <textarea class="form-control" placeholder="Here can be your nice text" rows="1"></textarea>
                </td>
            </tr>
        </table>
    <button runat="server" id="uxSearch" class="btn btn-default">
    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    Submit
</button>
    
</asp:Content>

