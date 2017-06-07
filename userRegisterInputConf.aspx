<%@ Page Title="" Language="C#" MasterPageFile="~/register.master" AutoEventWireup="true" CodeFile="userRegisterInputConf.aspx.cs" Inherits="userRegisterInputConf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div>
  
    
    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon">
                
              <span>Email: </span>      
                <i class="material-icons">email</i>
            </span>
            <input type="text" class="form-control" placeholder="With Material Icons">
           
        </div>
        
    </div>
   <a class="btn btn-primary">Send confirmation</a>
    
    <br/>
    <br/>
    <br/>
    <br/>
  
    
    
    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon">
                <span>Phone: </span>  
                
                <i class="material-icons"><i class="material-icons">contact_phone</i></i>
            </span>
            <input type="text" class="form-control" placeholder="With Material Icons">
        </div>
    </div>
    
    
    <a class="btn btn-primary">Send confirmation</a>
    <br/>
    <br/>
    <br/>
    <br/>
   
    </div>
</asp:Content>

