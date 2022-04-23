using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;

namespace ParkingApplication.Helpers
{
    public class User
    {
        public static Dictionary<string, object> Login (string username, string password)
        {
            OracleConnection connection = Database.Connect();

            string query = $"SELECT * FROM users_tbl WHERE username='{username}'";

            OracleCommand cmd = new OracleCommand(query, connection);
            OracleDataReader reader = cmd.ExecuteReader();

            //Check if any user has found, if not throw error.
            if (reader.HasRows != true) throw new InvalidOperationException("No user found");

            reader.Read();

            //Convert reader to dictionary
            Dictionary<string, object> user = new Dictionary<string, object>();
            for (int lp = 0; lp < reader.FieldCount; lp++)
            {
                user.Add(reader.GetName(lp), reader.GetValue(lp));
            }

            if (BCrypt.Net.BCrypt.Verify(password, user["PASSWORD"].ToString()))
            {
                Dictionary<string, string> userdata = new Dictionary<string, string> {
                    {"username", username}, {"password", password}
                };
                Cookie.StoreInCookieDictionary("user", null, userdata, null);
            } else
            {
                throw new InvalidOperationException("Wrong password");
            }

            return user;
        }
    }
}