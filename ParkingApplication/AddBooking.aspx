<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBooking.aspx.cs" Inherits="ParkingApplication.AddBooking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="d-flex justify-content-center flex-grow-1 flex-column my-5 w-100">
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
        <div class="row">
            <div class="col-md-5 my-2">
                <div class="card shadow-lg h-100 bg-warning ">
                    <div class="card-body">
                        <h3 class="font-weight-bold  text-uppercase">Add Booking</h3>
                        <asp:Panel runat="server" ID="pnlCalculateParking" DefaultButton="btnCalculateParking">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Set Start Date:</label>
                                    <asp:TextBox runat="server" TextMode="Date" ID="StartDate" placeholder="Start Date" required="true" CssClass="form-control"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Set Start Time:</label>
                                    <asp:TextBox runat="server" TextMode="Time" ID="StartTime" placeholder="Start Time" required="true" CssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Parking Duration <span class="badge badge-primary">in Hours</span>:</label>
                                <asp:TextBox type="number" runat="server" ID="Duration" placeholder="Duration" required="true" CssClass="form-control"  />
                            </div>
                            <asp:Button runat="server" ID="btnCalculateParking" Text="Calculate Available Parkings" OnClick="btnCalculateParking_Click" CssClass="w-100 btn btn-primary"/>
                        </asp:Panel>
                    </div>
                </div>
            </div>
            <div class="col-md-7 my-2">
                <div class="card shadow-lg bg-info text-light" style="min-height: 100%; max-height: 25rem; overflow-y: scroll;">
                    <div class="card-body d-flex flex-column">
                        <h3 class="font-weight-bold text-uppercase">Parkings List</h3>
                        <% if (!isQueried) {%>
                        <div class="align-self-center flex-grow-1 flex-column d-flex justify-content-center">
                            <div class="text-center" >
                                <i data-feather="alert-circle" style="width: 5em; height: 5em"></i>
                            </div>
                           <div>
                               You need to put your parking date and time first!
                           </div>
                        </div>
                        <%} else {
                                string minDateString = $"{StartDate.Text} {StartTime.Text}";
                                DateTime currentMinDate = DateTime.Parse(minDateString);
                        %>
                            <h6>Showing parkings for <%=minDateString %></h6>
                            <div class="card-columns text-dark">
                                <% for(var parkingNo=1; parkingNo<=ParkingApplication.Helpers.Constants.PARKING_NO_COUNT; parkingNo++) {
                                    bool isDisabled = disabledSlots.Contains(parkingNo);  
                                %>
                                <div class="card <%=isDisabled ? "bg-dark text-light":"" %>">
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            Parking #<%=parkingNo %>
                                        </h5>
                                        <% if (isDisabled) { %>
                                            <div class="badge badge-danger">NOT AVAILABLE</div>
                                        <%} else {%>
                                            <div class="badge badge-success">AVAILABLE</div>
                                        <%} %>
                                    </div>
                                    <div class="card-footer">
                                        <a 
                                            href="BookParking?parkingNo=<%=parkingNo%>&startDate=<%=ParkingApplication.Helpers.Time.ConvertToUnixTimestamp(currentMinDate) %>&duration=<%=Duration.Text %>" 
                                            class="btn w-100 text-uppercase  <%=isDisabled ? "disabled btn-outline-primary":"btn-primary" %>"
                                        >
                                               <%=isDisabled ? "UNAVAILABLE":"BOOK PARKING" %>
                                        </a>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                        <%} %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
