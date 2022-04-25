using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParkingApplication
{
    public partial class SiteMaster : MasterPage
    {
        protected Dictionary<string, object> user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Helpers.User.AutoLogin(false);
        }

        protected void Logout(object sender, EventArgs e)
        {
            Helpers.User.Logout();
            Response.Redirect("/?from=logout");
        }
    }
}