using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Oracle.ManagedDataAccess.Client;

namespace ParkingApplication
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var connection = Helpers.Database.Connect();
            string query = "SELECT * FROM users_tbl";

            var command = new OracleCommand(query, connection);
            OracleDataReader reader = command.ExecuteReader();

            Console.WriteLine("GUID");
            while (reader.Read())
                Console.WriteLine("{0}", reader[0]);
        }
    }
}