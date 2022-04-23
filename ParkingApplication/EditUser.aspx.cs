using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;

namespace ParkingApplication
{
    public partial class EditUser : System.Web.UI.Page
    {
        Dictionary<string, object> user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Helpers.User.AutoLogin();

            if (!IsPostBack)
            {
                firstName.Text = user["FIRST_NAME"].ToString();
                lastName.Text = user["LAST_NAME"].ToString();
                phoneNumber.Text = user["PHONE_NUMBER"].ToString();
                gender.Items.FindByValue(user["GENDER"].ToString()).Selected = true;
            }
        }

        protected void btnEditUser_Click(object sender, EventArgs e)
        {
            OracleConnection connection = Helpers.Database.Connect();

            string query = $"UPDATE users_tbl SET " +
                $"FIRST_NAME='{firstName.Text}'," +
                $"LAST_NAME='{lastName.Text}'," +
                $"PHONE_NUMBER='{phoneNumber.Text}'," +
                $"GENDER='{gender.Text}'";

            OracleCommand cmd = new OracleCommand(query, connection);
            cmd.ExecuteNonQuery();
        }
    }
}