<%@ Page Title="Edit Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="ParkingApplication.EditUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="accordion">
        <div class="card">
        <div class="card-header" id="headingOne">
            <h5 class="mb-0">
            <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                Edit User Account Details
            </button>
            </h5>
        </div>

        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
            <div class="card-body">
                <asp:Panel runat="server" ID="pnlEditUser" DefaultButton="btnEditUser">
                    <div class="container" style="max-width: 576px">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">First Name</label>
                                    <asp:TextBox runat="server" ID="firstName" placeholder="First Name" CssClass="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">Last Name</label>
                                    <asp:TextBox runat="server" ID="lastName" placeholder="Last Name" CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold">Phone Number</label>
                            <asp:TextBox runat="server" ID="phoneNumber" placeholder="Phone Number" CssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold">Gender</label>
                            <asp:RadioButtonList ID="gender" runat="server">
                                <asp:ListItem Value="MALE">Male</asp:ListItem>
                                <asp:ListItem Value="FEMALE">Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <asp:Button runat="server" ID="btnEditUser" Text="Update User" CssClass="btn btn-primary" OnClick="btnEditUser_Click"/>
                    </div>
                </asp:Panel>
            </div>
        </div>
        </div>
        <div class="card">
        <div class="card-header" id="headingTwo">
            <h5 class="mb-0">
            <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                Collapsible Group Item #2
            </button>
            </h5>
        </div>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
            <div class="card-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
        </div>
        <div class="card">
        <div class="card-header" id="headingThree">
            <h5 class="mb-0">
            <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                Collapsible Group Item #3
            </button>
            </h5>
        </div>
        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
            <div class="card-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
            </div>
        </div>
        </div>
    </div>
</asp:Content>
