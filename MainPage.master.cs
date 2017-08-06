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


    protected void logout(object sender, EventArgs e)
    {
        //        Response.Write("It's successful!");
        System.Diagnostics.Debug.WriteLine("wtdsdf");
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();

        

        if (Request.Cookies["ASP.NET_SessionId"] != null)
        {
            Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
            Response.Cookies["ASP.NET_SessionId"].Expires=DateTime.Now.AddMonths(-20);
        }

        if (Request.Cookies["Authtokenforloginlogoutdel"] != null)
        {
            System.Diagnostics.Debug.WriteLine("wtf");
            Response.Cookies["Authtokenforloginlogoutdel"].Value = string.Empty;
            Response.Cookies["Authtokenforloginlogoutdel"].Expires = DateTime.Now.AddMonths(-20);
        }
        Response.Redirect("login.aspx");

    }
}
