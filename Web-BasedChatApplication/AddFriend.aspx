<%@ Page Title="Add Friend" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddFriend.aspx.cs" Inherits="Web_BasedChatApplication.AddFriend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="firstPanel">  
        <div>    
            <table>
                <tr>
                    <td>
                       <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server" placeholder="Search......" Width="376px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" CssClass="form-control" Width="90px" runat="server" Text="Search" style="background-color:#3a7fd8; color:white;"/>
                    </td>
                </tr>
            </table>         
        </div>  
    <asp:DataList ID="DataList1" runat="server" DataKeyField="UserName" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" Width="408px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" >
       
            <ItemTemplate>
            <div style="text-align: center;">
                <asp:Image ID="Image1" runat="server" CssClass="imageCircle" ImageUrl='~/Images/photo.png' Width="200" Height="200"/>        
            <br />    
            <div style="font-size:25px;">
                <asp:Label ID="FriendNameLabel" Font-Bold="true" runat="server" Text='<%# Eval("UserName") %>' />
            </div>
            
                <asp:Image ID="email" runat="server" ImageUrl="~/Images/email.png" CssClass="emailClass" Width="25" Height="20"/>
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            </div>
            <br />
            <div  style="text-align:center">
                <asp:Button ID="btnSelect" Text="Add Friend" onclick="BtnAddFriend_Click" runat="server" Style=" background-repeat:no-repeat; width:90px; height:35px;"/>
            </div>
        </ItemTemplate>
        
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web-BasedChatApplication(WBCA)ConnectionString %>" SelectCommand="SELECT [UserName], [Email] FROM [Register] WHERE ([UserName] = @UserName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="UserName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="msg" runat="server"></asp:Label>
        </div>
</asp:Content>
