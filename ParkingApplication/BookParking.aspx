<%@ Page Title="Book Parking" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookParking.aspx.cs" Inherits="ParkingApplication.BookParking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <h3>
                    You will need to pay <span class="badge badge-success">₱<%=totalPrice %></span> for this transaction.
                </h3>
                <asp:Panel runat="server"  DefaultButton="BookParkingBtn">
                    <div>
                        <label>Select Payment Method</label>
                        <asp:RadioButtonList runat="server" ID="PaymentMethods" CssClass="btn-group colors w-100 my-2" RepeatLayout="Flow" data-toggle="buttons">
                            <asp:ListItem Value="gcash" Text="GCash" Selected="True" class="btn btn-info active" autocomplete="off"/>
                            <asp:ListItem Value="paymaya" Text="Paymaya" Selected="True" class="btn btn-info active" autocomplete="off"/>
                            <asp:ListItem Value="grab_pay" Text="Grab Pay"  class="btn btn-info" autocomplete="off"/>
                            <asp:ListItem Value="pay_on_park" Text="Pay on Park"  class="btn btn-warning" autocomplete="off"/>
                        </asp:RadioButtonList>
                    </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="PhoneNumber">Phone Number:</label>
                                    <asp:TextBox runat="server" ID="PhoneNumberTbx" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Account Name:</label>
                                    <asp:TextBox runat="server" ID="AccountNameTbx" />
                                </div>
                            </div>
                        </div>
                        <p class="text-muted">
                            Phone Number and Account Name is not required if you have chosen <strong>Pay on Park</strong>.
                        </p>
                    <asp:Button runat="server" ID="BookParkingBtn" OnClick="BookParkingBtn_Click" Text="Submit Booking" CssClass="btn btn-success w-100"/>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
