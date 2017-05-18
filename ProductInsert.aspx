<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductInsert.aspx.cs" Inherits="ProductInsert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 21px;
        }
        .auto-style4 {
            height: 21px;
            width: 126px;
        }
        .auto-style5 {
            width: 126px;
            height: 22px;
        }
        .auto-style6 {
            height: 22px;
        }
        #Text1 {
            width: 795px;
        }
        #tb_ProductID {
        }
        #TextArea1 {
            height: 84px;
            width: 808px;
        }
        #tb_ProductDesc {
        }
        #tn_UnitPrice {
            width: 797px;
        }
        #tb_UnitPrice {
        }
        #tb_StockLevel {
        }
        .auto-style7 {
            height: 21px;
            width: 425px;
        }
        .auto-style8 {
            height: 22px;
            width: 425px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style4">Product ID</td>
            <td class="auto-style7">
                <asp:TextBox ID="tb_ProductID" runat="server" Height="16px" Width="410px"></asp:TextBox>
            </td>
           
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="rfv_ProductID" runat="server" ControlToValidate="tb_ProductID" ErrorMessage="Please a Product ID" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
        <tr>
            <td class="auto-style5">Product Name</td>
            <td class="auto-style8">
                <asp:TextBox ID="tb_ProductName" runat="server" Width="406px"></asp:TextBox>
            </td>
         
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="rfv_ProductName" runat="server" ControlToValidate="tb_ProductName" ErrorMessage="Please enter a Name for the Product" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
         
        </tr>

           <tr>
            <td class="auto-style5">Product Desc</td>
            <td class="auto-style8">
                <asp:TextBox ID="tb_ProductDesc" runat="server" Height="113px" TextMode="MultiLine" Width="413px"></asp:TextBox>
               </td>
         
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="rfv_ProductDesc" runat="server" ControlToValidate="tb_ProductDesc" ErrorMessage="Please enter a description for the product" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
         
        </tr>
         <tr>
            <td class="auto-style5">Unit Price</td>
            <td class="auto-style8">
                <asp:TextBox ID="tb_UnitPrice" runat="server" Width="414px"></asp:TextBox>
             </td>
         
            <td class="auto-style6">
                <asp:CompareValidator ID="cv_UnitPrice" runat="server" ControlToValidate="tb_UnitPrice" ErrorMessage="Only Numeric value is allowed" ForeColor="Red" Operator="NotEqual"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="rfv_UnitPrice" runat="server" ControlToValidate="tb_UnitPrice" ErrorMessage="Please enter a unit price for the product" ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
         
        </tr>

         <tr>
            <td class="auto-style5">Stock Level</td>
            <td class="auto-style8">
                <asp:TextBox ID="tb_StockLevel" runat="server" Width="418px"></asp:TextBox>
             </td>
         
            <td class="auto-style6">
                <asp:CompareValidator ID="cv_StockLevel" runat="server" ControlToValidate="tb_StockLevel" ErrorMessage="Only Numeric value is allowed" ForeColor="Red" Operator="NotEqual"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="rfv_StockLevel" runat="server" ControlToValidate="tb_StockLevel" ErrorMessage="Please enter a value for the stock level" ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
         
        </tr>

        <tr>
            <td class="auto-style5">Product Image</td>
            <td class="auto-style8">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
         
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="fileupload_Image" runat="server" ErrorMessage="Please select a product image" ForeColor="Red" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
            </td>
         
        </tr>

         <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style8">
                <asp:Label ID="lbl_Result" runat="server" Text="&lt;&lt; &gt;&gt;"></asp:Label>
             </td>
         
            <td class="auto-style6">
                &nbsp;</td>
         
        </tr>

        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style8">
                <asp:Button ID="btn_Insert" runat="server" Text="Insert" OnClick="btn_Insert_Click" />
                <asp:Button ID="btn_ProductView" runat="server" Text="View Product List" Width="102px" OnClick="btn_ProductView_Click" CausesValidation="False" />
            </td>
         
            <td class="auto-style6">
                &nbsp;</td>
         
        </tr>
    </table>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
</asp:Content>

