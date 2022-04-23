using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;

namespace ParkingApplication.Helpers
{
    public class Database
    {
        public static OracleConnection Connect()
        {
            string SERVICENAME = "xe";
            string USERID = "SYSTEM";
            string PASSWORD = "*8*S5Kz2drNc";
            string ConnectString = $"data source=(DESCRIPTION =(ADDRESS_LIST =(ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521)))(CONNECT_DATA =(SERVICE_NAME = {SERVICENAME})));USER ID={USERID};PASSWORD={PASSWORD}";

            OracleConnection connection = new OracleConnection(ConnectString);

            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
            connection.Open();
            return connection;
        }
    }
}