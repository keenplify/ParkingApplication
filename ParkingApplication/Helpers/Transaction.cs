using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;

namespace ParkingApplication.Helpers
{
    public class Transaction
    {
        public static List<Dictionary<string, object>> GetAll()
        {
            OracleConnection connection = Database.Connect();

            string query = "SELECT * FROM TRANSACTIONS_TBL ORDER BY STARTING_DATE;";

            OracleCommand cmd = new OracleCommand(query, connection);

            var reader = cmd.ExecuteReader();
            List<Dictionary<string, object>> transactions = new List<Dictionary<string, object>>();

            while (reader.Read())
            {
                Dictionary<string, object> transaction = new Dictionary<string, object>();
                for (int lp = 0; lp < reader.FieldCount; lp++)
                {
                    transaction.Add(reader.GetName(lp), reader.GetValue(lp));
                }

                transactions.Add(transaction);
            }

            return transactions;
        }
        public static void Create(string createdBy, int parkingNo, DateTime startingDate, int hoursDuration)
        {
            OracleConnection connection = Database.Connect();

            string query = $"INSERT INTO TRANSACTIONS_TBL " +
                $"(GUID, " +
                $"CREATED_BY, " +
                $"PARKING_NO, " +
                $"STARTING_DATE, " +
                $"HOURS_DURATION" +
                $") VALUES (" +
                $"'{Guid.NewGuid()}'," +
                $"'{createdBy}'" +
                $"'{parkingNo}'," +
                $"'{Time.ConvertToUnixTimestamp(startingDate)}'," +
                $"'{hoursDuration}')";

            OracleCommand cmd = new OracleCommand(query, connection);

            cmd.ExecuteNonQuery();
        }

        
    }
}