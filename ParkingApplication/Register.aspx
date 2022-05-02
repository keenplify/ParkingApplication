<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ParkingApplication.Register" %>

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
                <h3>Register</h3>
                <asp:Panel runat="server" ID="pnlRegister" DefaultButton="btnRegister">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>First Name:</label>
                                <asp:TextBox runat="server" ID="firstname" placeholder="First Name" required="true" CssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Last Name:</label>
                                <asp:TextBox runat="server" ID="lastname" placeholder="First Name" required="true" CssClass="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Username:</label>
                                <asp:TextBox runat="server" ID="username" placeholder="Username" required="true" CssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Password:</label>
                                <asp:TextBox type="password" runat="server" ID="password" placeholder="Password" required="true" CssClass="form-control"  />
                            </div>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Phone Number:</label>
                                <asp:TextBox runat="server" ID="phonenumber" placeholder="Phone Number" required="true" CssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Gender:</label>
                                <asp:DropDownList runat="server" ID="gender" CssClass="form-control">
                                    <asp:ListItem Text="Male" Value="MALE" />
                                    <asp:ListItem Text="Female" Value="FEMALE" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                                       
                    <div class="row">
                        <div class="offset-3 col-6">
                            <asp:Button runat="server" ID="btnRegister" Text="Register" OnClick="btnRegister_Click" CssClass="w-100 btn btn-primary"/>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
