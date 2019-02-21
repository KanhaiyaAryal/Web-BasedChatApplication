<%@ Page Title="Manage Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageProfile.aspx.cs" Inherits="Web_BasedChatApplication.ManageProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="firstPanel">
<div class="form-horizontal">
    <h2><strong>Account Details</strong></h2>
     <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">UserName</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
            </div>
        </div>
        
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="email" CssClass="form-control" TextMode="Email" />
          </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="phone" CssClass="col-md-2 control-label">Phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="phone" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Edit" CssClass="btn btn-default" OnClick="Edit_Click" ID="edit" style="background-color:#3a7fd8; color:white;"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" Text="Update" CssClass="btn btn-default" OnClick="Update_Click" ID="update" autopostback="true" style="background-color:#3a7fd8; color:white;"/>
                <br />
            </div>

        </div>
    <asp:Label ID="message" runat="server" Text="" style="font-size: large; font-weight: 700"></asp:Label>
    </div>

</div>
</asp:Content>
