<%@ Page Title="Chat Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChatForm.aspx.cs" Inherits="Web_BasedChatApplication.ChatForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="firstPanel">       
       <div class="col-sm-3">
           <div class="profileForm">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/photo.png" Height="60" CssClass="imageCircle"/>
               <asp:Label ID="txtUserName" runat="server" Text=""></asp:Label>                                  
           </div>
           <hr /> 
           <div>      
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/photo.png" Height="40" CssClass="imageCircle"/>                                 
                <asp:LinkButton Text='<%# Eval("FriendName") %>' ForeColor="Black" runat="server" ID="FEmailBtn" OnClick="UsernameLabel_Click"/> 
                <br />
                
                <br /> 
            </ItemTemplate>
        </asp:DataList>
                 </div>
           </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web-BasedChatApplication(WBCA)ConnectionString %>" SelectCommand="SELECT [FriendName] FROM [Friends] WHERE (([UserName] = @UserName) AND ([Status] = @Status))">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
                <asp:Parameter DefaultValue="1" Name="Status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <div class="col-sm-9">
        <div class="selectUser">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/photo.png" Height="40" CssClass="imageCircle"/>                                 
                <asp:Label ID="friendName" runat="server" Text=""></asp:Label>
        </div>
        <br />
        <hr />
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                    <asp:Panel runat="server" ID="chatPanel">
                            <div style="vertical-align: middle;">
                                <div>
                                    <asp:DataList ID="DataList2" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="left" CssClass="datalistcss" Width="100%">
                                        <ItemTemplate>
                                            <div class="media-body"> 
                                                
                                                <div class="ms-item">
                                                    <style>
                                                          .from-them {
	                                                        position:relative;
	                                                        padding:7px 20px;
	                                                        background:#E5E5EA;
	                                                        border-radius:25px;
	                                                        color: black;
  	                                                        float: left;		
                                                        }
                                                    </style>
                                                        <div>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/photo.png" Height="30" CssClass="imageCircle"/>
                                                            <asp:Label ID="showUser" CssClass="showUser" runat="server" Text='<%# Eval("Sender") %>'></asp:Label>                                 
                                                        </div>
                                                        <div>
                                                            <asp:Label ID="MessageID" runat="server" CssClass="from-them" Text='<%# Eval("Message") %>' Width="100%"></asp:Label>
                                                        </div>
                                                    <br />
                                                    
                                                </div>
                                                    
                                                 </div>
                                                    <div>
                                                            <small class="ms-date"><span class="glyphicon glyphicon-time"></span><asp:Label ID="SendID" runat="server" Text='<%# Eval("SendDate") %>'></asp:Label></small>

                                                    </div>
                                                </div>                                                   
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <br />
                                    <br />
                                </div>
                            </div>
                        
                        </asp:Panel>
                
                 </ContentTemplate>
        </asp:UpdatePanel>
        
        </div>
        
        

  </div>
    <div style="padding: 0px 0px 0px 380px">
            <table style="width: 76%">
                <tr class="col1">
                    <td style="width: 629px">
                        <asp:TextBox ID="MessageBox" runat="server" Width="563px" CssClass="form-control" style="max-width:650px" placeholder="Enter your message..."></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-default" width="100%" OnClick="btnSend_Click" autopostback="false" style="background-color:#3a7fd8; color:white;"/>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
