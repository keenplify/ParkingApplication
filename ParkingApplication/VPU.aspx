<%@ Page Title="My Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VPU.aspx.cs" Inherits="ParkingApplication.VPU" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <h3 class="text-center">
        Your Bookings
    </h3>
    <table class="table table-hover table table-bordered text-center">
        <thead>
            <tr>
                <th scope="col">Parking Slot</th>
                <th scope="col">Start Date</th>
                <th scope="col">Hours Duration</th>
                <th scope="col">Payment Details</th>
                <th scope="col">Status</th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var transaction in transactions)
                { %>
            <tr>
                <td><%=transaction["PARKING_NO"] %></td>
                <td><%=transaction["minDate"] %></td>
                <td><%=transaction["HOURS_DURATION"] %> hours</td>
                <td>
                    <span class="text-uppercase font-weight-bold"><%=transaction["METHOD_OF_PAYMENT"] %></span>
                    <span><%=transaction["PHONE_NUMBER"] %> - <%=transaction["ACCOUNT_NAME"] %></span>
                </td>
                <td class="d-flex align-items-center justify-content-center">
                    <% if ((bool)transaction["isActive"])
                        { %>
                        <div class="mr-2">
                            Time Left:
                        </div>
                        <div class="badge badge-primary p-2">
                            <%=transaction["timeLeft"] %>
                        </div>
                    <%} else { %>
                        <div class="badge badge-secondary">INACTIVE</div>
                    <%} %>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>

</asp:Content>