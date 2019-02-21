<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Web_BasedChatApplication.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
    <h2><strong>Feedback</strong></h2>
     <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="name" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="name" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="email" CssClass="form-control" TextMode="Email"/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="subject" CssClass="col-md-2 control-label">Subject</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="subject" CssClass="form-control" />
          </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="message" CssClass="col-md-2 control-label">Feedback Message</asp:Label>
            <div class="col-md-10">
                    <asp:TextBox runat="server" ID="message" CssClass="form-control" Height="78px" TextMode="MultiLine" Width="309px" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Submit" CssClass="btn btn-default" ID="btnAdd" OnClick="btnAdd_Click" style="background-color:#3a7fd8; color:white;"/>
                <br />
                <br />
                <asp:Label ID="lblmessage" runat="server" style="font-weight: 700; font-size: medium"></asp:Label>
            </div>
        </div>
     </div>
</asp:Content>
