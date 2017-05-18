<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FeedbackForm.aspx.cs" Inherits="FeedbackForm" %>
<%-- ian lai --%>

<%-- aravin --%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 176px;
        }
        .auto-style4 {
            width: 410px;
        }
        .auto-style5 {
            width: 176px;
            height: 100px;
        }
        .auto-style6 {
            width: 410px;
            height: 100px;
        }
        .auto-style7 {
            height: 100px;
        }
        .auto-style8 {
            width: 176px;
            height: 26px;
        }
        <%-- sdlfkdfkd;fksd--%>
        .auto-style9 {
            width: 410px;
            height: 26px;



        }
        .auto-style10 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style5">Comments</td>
            <td class="auto-style6">
                <asp:TextBox ID="tb_Comment" runat="server" Height="90px" TextMode="MultiLine" Width="401px"></asp:TextBox>
            </td>
            <td class="auto-style7">
                <asp:RequiredFieldValidator ID="rfv_Comments" runat="server" ControlToValidate="tb_Comment" ErrorMessage="Please enter your comments" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Email</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_Email" runat="server" TextMode="Email" Width="399px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="Please enter your email" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="rev_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="The email supplied is invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Confirm email</td>
            <td class="auto-style9">
                <asp:TextBox ID="tb_ConfirmEmail" runat="server" Width="397px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:CompareValidator ID="cpv_ConfirmEmail" runat="server" ControlToCompare="tb_Email" ControlToValidate="tb_ConfirmEmail" ErrorMessage="Your email does not match"></asp:CompareValidator>
            </td>
        </tr>
          <tr>
            <td> How would you grade our webssite?</td>
               <td> 
                   <asp:DropDownList ID="ddl_Grade" runat="server">
                       <asp:ListItem>Please Select</asp:ListItem>
                       <asp:ListItem>Excellent</asp:ListItem>
                       <asp:ListItem>Good</asp:ListItem>
                       <asp:ListItem>Not Good</asp:ListItem>
                   </asp:DropDownList>
              </td>
               <td> 
                   <asp:CompareValidator ID="cpv_Grade" runat="server" ControlToValidate="ddl_Grade" ErrorMessage="Please select a choice" Operator="NotEqual" ValueToCompare="Please Select"></asp:CompareValidator>
              </td>
        </tr>

         <tr>
            <td> 


                <asp:Button ID="Button1" runat="server" Text="Button" />
                <asp:Button ID="Button2" runat="server" Text="Button" />


            </td>
              
             
        </tr>
    </table>
</asp:Content>

