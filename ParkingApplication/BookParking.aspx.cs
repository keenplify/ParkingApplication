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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var user = Helpers.User.AutoLogin();

                var connection = Helpers.Database.Connect();
                var query = new OracleCommand("INSERT INTO TRANSACTIONS_TBL (" +
                    "GUID, " +
                    "CREATED_BY, " +
                    "PARKING_NO, " +
                    "STARTING_DATE, " +
                    "HOURS_DURATION" +
                    ") VALUES (" +
                    $"'{Guid.NewGuid()}' , " +
                    $"'{user["GUID"]}' , " +
                    $"'{Request.QueryString["parkingNo"]}' , " +
                    $"'{Request.QueryString["startDate"]}' , " +
                    $"'{Request.QueryString["duration"]}' " +
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