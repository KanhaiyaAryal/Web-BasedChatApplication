<%@ Page Title="RequestList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestList.aspx.cs" Inherits="Web_BasedChatApplication.RequestList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="firstPanel">
        <div class="col-sm-6">
        <h2><strong>Friend Request Lists</strong></h2>
            <hr />
            <br />
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick1"></asp:Timer>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowHeader="False" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            
            <Columns>                             
                <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    
                    <asp:Image ID="Image1" runat="server" CssClass="imageCircle" ImageUrl="~/Images/photo.png" Width="45px"/>&nbsp;&nbsp;
                    <asp:Label ID="LabelUserName" Font-Bold="true" runat="server" Text='<%# Eval("UserName") %>' />&nbsp;&nbsp;
                    <asp:Label ID="LabelFriendName" Font-Bold="true" runat="server" Text='<%# Eval("FriendName") %>' Visible="false"/>
                    <asp:Button ID="btnAccept" runat="server" CausesValidation="false" Text="Accept" OnClick="btnAccept_Click" CssClass="btn btn-default"/>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web-BasedChatApplication(WBCA)ConnectionString %>" SelectCommand="SELECT [FriendName], [UserName] FROM [Friends] WHERE (([FriendName] = @FriendName) AND ([Status] = @Status))">
            <SelectParameters>
                <asp:SessionParameter Name="FriendName" SessionField="UserName" Type="String" />
                <asp:Parameter DefaultValue="0" Name="Status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            <div style="width: 100%;" align="center" id="dvempty" runat="server" visible="false">
                <div>
                    <table cellspacing="2" cellpadding="3" rules="cols" style="background-color: White; border-width: 1px; border-style: None; height: 100px; width: 574px;">
                        <tr align="center" style="color: black; background-color: #EEEEEE; border-color: Black; border-width: 1px; border-style: Solid; font-size: Large;">
                            <td colspan="6">There Are no Friend Request!  <a href="AddFriend.aspx" class="btn btn-default">Add Friend</a></td>
                           
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <h2><strong>Friend List</strong></h2>
            <hr />
            <br />
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/photo.png" Height="40" CssClass="imageCircle"/> &nbsp;&nbsp;                                
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FriendName") %>'></asp:Label> &nbsp;&nbsp;
                    <a class="btn btn-default" href="ChatForm.aspx">Message</a>
                </ItemTemplate>
        </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Web-BasedChatApplication(WBCA)ConnectionString %>" SelectCommand="SELECT [FriendName] FROM [Friends] WHERE ([UserName] = @UserName)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        
    </div>
</asp:Content>
