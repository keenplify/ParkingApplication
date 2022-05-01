<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ParkingApplication.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="d-flex justify-content-center align-items-center flex-grow-1 flex-column my-5">
        <% if (lblError.Text.Length > 0)
            { %>    
        <div class="alert alert-danger flex-grow-1 d-flex flex-column alert-dismissible fade show">
            <h4 class="alert-heading">Login Error!</h4>
            <asp:Label runat="server" ID="lblError"/>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <%} %>
        <div class="card shadow-lg mb-5">
            <div class="card-body">
                <asp:Panel runat="server" ID="pnlLogin" DefaultButton="btnLogin">
                    <div class="form-group">
                        <label>Username:</label>
                        <asp:TextBox runat="server" ID="username" placeholder="Username" required="true" CssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <asp:TextBox type="password" runat="server" ID="password" placeholder="Password" required="true" CssClass="form-control"  />
                    </div>
                    <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" CssClass="w-100 btn btn-primary"/>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
