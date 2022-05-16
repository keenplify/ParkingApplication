using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Diagnostics;

namespace ParkingApplication
{
    public partial class BookParking : System.Web.UI.Page
    {
        protected Dictionary<string, object> user;
        protected double pricePerHour = 20;
        protected double totalPrice;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                user = Helpers.User.AutoLogin();

                totalPrice = int.Parse(Request.QueryString["duration"]) * pricePerHour;
            } catch
            {
                Response.Redirect("~/AddBooking?err=BAD_REQUEST");
            }
        }

        protected void BookParkingBtn_Click(object sender, EventArgs e)
        {
            try
            {

                var connection = Helpers.Database.Connect();
                var query = new OracleCommand("INSERT INTO TRANSACTIONS_TBL (" +
                    "GUID, " +
                    "CREATED_BY, " +
                    "PARKING_NO, " +
                    "STARTING_DATE, " +
                    "HOURS_DURATION," +
                    "METHOD_OF_PAYMENT," +
                    "PHONE_NUMBER," +
                    "ACCOUNT_NAME," +
                    "PRICE" +
                    ") VALUES (" +
                    $"'{Guid.NewGuid()}' , " +
                    $"'{user["GUID"]}' , " +
                    $"'{Request.QueryString["parkingNo"]}' , " +
                    $"'{Request.QueryString["startDate"]}' , " +
                    $"'{Request.QueryString["duration"]}' ," +
                    $"'{PaymentMethods.Text}' ," +
                    $"'{PhoneNumberTbx.Text}' ," +
                    $"'{AccountNameTbx.Text}' ," +
                    $"'{totalPrice}'" +
                    ")", connection);
                query.ExecuteNonQuery();

                Response.Redirect("~/VPU");
            } catch
            {
                Response.Redirect("~/AddBooking?err=BAD_REQUEST");

            }
        }
    }
}