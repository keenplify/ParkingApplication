using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;

namespace ParkingApplication
{
    public partial class VPU : System.Web.UI.Page
    {
        protected Dictionary<string, object> user;
        protected List<Dictionary<string, object>> transactions;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = Helpers.User.AutoLogin();
            transactions = new List<Dictionary<string, object>>();

            // Get current date
            var currentDate = DateTime.Now;

            var connection = Helpers.Database.Connect();
            var query = new OracleCommand("SELECT * FROM TRANSACTIONS_TBL WHERE CREATED_BY=:createdBy ORDER BY STARTING_DATE DESC", connection);
            query.Parameters.Add(":createdBy", user["GUID"]);

            var reader = query.ExecuteReader();
            //Convert reader to dictionary
            while (reader.Read())
            {
                Dictionary<string, object> transaction = new Dictionary<string, object>();
                for (int lp = 0; lp < reader.FieldCount; lp++)
                {
                    transaction.Add(reader.GetName(lp), reader.GetValue(lp));
                }

                // Calculate if starting date is now
                DateTime minDate = Helpers.Time.UnixTimeStampToDateTime(double.Parse(transaction["STARTING_DATE"].ToString()));
                DateTime maxDate = minDate.AddHours(int.Parse(transaction["HOURS_DURATION"].ToString()));
                transaction.Add("minDate", minDate);
                transaction.Add("maxDate", maxDate);

                // https://stackoverflow.com/questions/16080378/check-if-one-date-is-between-two-dates
                // Check if date is between two date, if between then show time remaining else show inactive
                if (currentDate <= maxDate && currentDate >= minDate)
                {
                    transaction.Add("isActive", true);
                    var timeleft = maxDate - currentDate;
                    transaction.Add("timeLeft", Helpers.Time.ToHumanTimeString(timeleft));
                } else
                {
                    transaction.Add("isActive", false);
                }
                transactions.Add(transaction);
            }
        }
    }
}