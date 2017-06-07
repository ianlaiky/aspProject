using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void homeTest(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("testr ");

        Response.Redirect("login.aspx");

    }
}
