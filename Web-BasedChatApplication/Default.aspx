<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_BasedChatApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="firstPanel">
        <div class="jumbotron">
            <h1>Web-Based Chat Application</h1>       
        </div>
        <div class="col-sm-6" style="text-align:center;">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/photo.png" Width="100px" CssClass="imageCircle"/>
            <br />
            <br />
            <div style="font-size:25px;">
            <asp:Label ID="txtUserName" runat="server" Font-Bold="true"></asp:Label>
            </div>
            <asp:Image ID="email" runat="server" ImageUrl="~/Images/email.png" CssClass="emailClass" Width="25" Height="20"/>
            <asp:Label ID="txtEmail" runat="server"></asp:Label>
            <br />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/33962.png" CssClass="emailClass" Width="25" Height="25"/>
            <asp:Label ID="txtPhone" runat="server"></asp:Label>
           <br />
            <br />
            <a class="btn btn-default" href="ManageProfile.aspx" style="background-color:#3a7fd8; color:white">Manage Profile &raquo;</a>
            <br />

        </div>
        <div class="col-sm-6">
            <strong><h2>Friend Lists</h2></strong>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/photo.png" Height="40" CssClass="imageCircle"/>                                 
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FriendName") %>'></asp:Label>
                <a class="btn btn-default" href="chatForm.aspx" style="background-color:#3a7fd8; color:white">Message</a>
                <br />
                
                <br /> 
            </ItemTemplate>
        </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web-BasedChatApplication(WBCA)ConnectionString %>" SelectCommand="SELECT [FriendName] FROM [Friends] WHERE (([UserName] = @UserName) AND ([Status] = @Status))">
                <SelectParameters>
                    <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="Status" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
     </div>
</asp:Content>
