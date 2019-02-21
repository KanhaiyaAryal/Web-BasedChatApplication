<%@ Page Title="View Feedback" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewFeeback.aspx.cs" Inherits="Web_BasedChatApplication.ViewFeeback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left:40px;">
    <strong><h2>Feedback List</h2></strong>
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" DataKeyNames="FeedbackId" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
            <asp:BoundField DataField="FeedbackId" HeaderText="FeedbackId" InsertVisible="False" ReadOnly="True" SortExpression="FeedbackId"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"></asp:BoundField>
            <asp:BoundField DataField="FeedbackMessage" HeaderText="FeedbackMessage" SortExpression="FeedbackMessage"></asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <sortedascendingcellstyle backcolor="#F5F7FB" />
        <sortedascendingheaderstyle backcolor="#6D95E1" />
        <sorteddescendingcellstyle backcolor="#E9EBEF" />
        <sorteddescendingheaderstyle backcolor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web-BasedChatApplication(WBCA)ConnectionString %>" SelectCommand="SELECT * FROM [FeedbackTable]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [FeedbackTable] WHERE [FeedbackId] = @original_FeedbackId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([FeedbackMessage] = @original_FeedbackMessage) OR ([FeedbackMessage] IS NULL AND @original_FeedbackMessage IS NULL))" InsertCommand="INSERT INTO [FeedbackTable] ([Name], [Email], [Subject], [FeedbackMessage]) VALUES (@Name, @Email, @Subject, @FeedbackMessage)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [FeedbackTable] SET [Name] = @Name, [Email] = @Email, [Subject] = @Subject, [FeedbackMessage] = @FeedbackMessage WHERE [FeedbackId] = @original_FeedbackId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Subject] = @original_Subject) OR ([Subject] IS NULL AND @original_Subject IS NULL)) AND (([FeedbackMessage] = @original_FeedbackMessage) OR ([FeedbackMessage] IS NULL AND @original_FeedbackMessage IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_FeedbackId" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Subject" Type="String" />
                <asp:Parameter Name="original_FeedbackMessage" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="FeedbackMessage" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="FeedbackMessage" Type="String" />
                <asp:Parameter Name="original_FeedbackId" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Subject" Type="String" />
                <asp:Parameter Name="original_FeedbackMessage" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
        </div>
</asp:Content>
