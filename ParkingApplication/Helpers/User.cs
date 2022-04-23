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

        public static Dictionary<string, object> AutoLogin(bool redirect=true)
        {
            if (!Cookie.CookieExist("user", "username") || !Cookie.CookieExist("user", "password"))
            {
                Logout();
                if (redirect) HttpContext.Current.Response.Redirect("/");
                return null;
            }
            try
            {
                var user = Login(Cookie.GetFromCookie("user", "username"), Cookie.GetFromCookie("user", "password"));
                return user;
            }
            catch(Exception)
            {
                Logout();
                if (redirect) HttpContext.Current.Response.Redirect("/");
                return null;
            }
        }

        public static void LoginRedirect()
        {
            Dictionary<string, object> user = AutoLogin();
            
            if (user == null)
            {
                Logout();
            }
        }

        public static void LoginWithRedirect()
        {
            Dictionary<string, object> user = AutoLogin();

            if (user["TYPE"].ToString() == "ADMIN")
            {
                HttpContext.Current.Response.Redirect("~/adminDashboard");
            }
            else
            {
                HttpContext.Current.Response.Redirect("~/userDashboard");
            }
        }

        public static void Logout()
        {
            Cookie.RemoveCookie("user", "username", null);
            Cookie.RemoveCookie("user", "password", null);
        }
    }
}