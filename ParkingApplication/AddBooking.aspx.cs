using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Oracle.ManagedDataAccess.Client;
using System.Diagnostics;

namespace ParkingApplication
{
    public partial class AddBooking : Page
    {
        protected List<Dictionary<string, object>> transactions;
        protected bool isQueried;
        protected List<int> disabledSlots;
        protected Dictionary<string, object> user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Helpers.User.AutoLogin();
        }

        protected void btnCalculateParking_Click(object sender, EventArgs e)
        {
            isQueried = false;
            DateTime currentMinDate;
            DateTime currentMaxDate;
            try
            {
                currentMinDate = DateTime.Parse($"{StartDate.Text} {StartTime.Text}");
                currentMaxDate = currentMinDate.AddHours(int.Parse(Duration.Text));
            } catch
            {
                lblError.Text = "Unable to set parking date!";
                return;
            }

            try
            {
                transactions = new List<Dictionary<string, object>>();

                var connection = Helpers.Database.Connect();
                var query = new OracleCommand("SELECT * FROM TRANSACTIONS_TBL", connection);
                var reader = query.ExecuteReader();
                //Convert reader to dictionary
                while (reader.Read())
                {
                    Dictionary<string, object> transaction = new Dictionary<string, object>();
                    for (int lp = 0; lp < reader.FieldCount; lp++)
                    {
                        transaction.Add(reader.GetName(lp), reader.GetValue(lp));
                    }
                    transactions.Add(transaction);
                }
            } catch
            {
                lblError.Text = "Unable to fetch parking transactions!";
                return;
            }

            try
            {
                disabledSlots = new List<int>();
                foreach (var transaction in transactions)
                {
                    DateTime minDate = Helpers.Time.UnixTimeStampToDateTime(double.Parse(transaction["STARTING_DATE"].ToString()));
                    DateTime maxDate = minDate.AddHours(int.Parse(transaction["HOURS_DURATION"].ToString()));

                    if (currentMinDate <= maxDate && currentMaxDate >= minDate)
                    {
                        int slot = int.Parse(transaction["PARKING_NO"].ToString());
                        if (!disabledSlots.Contains(slot)) disabledSlots.Add(slot);
                    }
                }
            } catch (Exception err)
            {
                lblError.Text = "An error has occured while calculating available bookings!";
                throw err;
            };
            isQueried = true;
        }
    }
}