using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace ParkingApplication
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                Dictionary<string, object> user = Helpers.User.Register(firstname.Text, lastname.Text, phonenumber.Text, gender.Text, username.Text, password.Text);
                Response.Redirect("/");
            }
            catch (InvalidOperationException error)
            {
                lblError.Text = error.Message;
            }
        }
    }
}