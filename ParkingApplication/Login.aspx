<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ParkingApplication.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <% if (lblError.Text.Length > 0)
        { %>    
    <div class="alert alert-danger">
        <asp:Label runat="server" ID="lblError"/>
    </div>
    <%} %>
    <asp:Panel runat="server" ID="pnlLogin" DefaultButton="btnLogin">
        <div class="form-group">
            <label>Username:</label>
            <asp:TextBox runat="server" ID="username" placeholder="Username" required="true" />
        </div>
        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox type="password" runat="server" ID="password" placeholder="Password" required="true"  />
        </div>
        <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click"/>
    </asp:Panel>
</asp:Content>
