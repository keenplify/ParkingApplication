﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace ParkingApplication
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                Dictionary<string, object> user = Helpers.User.Login(username.Text, password.Text);
                System.Diagnostics.Debug.Write(user["GUID"]);
            }
            catch (InvalidOperationException error)
            {
                System.Diagnostics.Debug.WriteLine(error.Message);
            }
        }
    }
}