using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using RestSharp.Authenticators;


public partial class userEmailConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
//        SendSimpleMessage();
    }

    public static RestResponse SendSimpleMessage()
    {
        RestClient client = new RestClient();
        client.BaseUrl = new Uri("https://api.mailgun.net/v3");
        client.Authenticator = new HttpBasicAuthenticator("api","key-15734816f9e935f32e85cdfd6e8c1be3");
        RestRequest request = new RestRequest();
        request.AddParameter("domain", "sandbox6c7c4de453b54bcc982d74b9abe2ba12.mailgun.org", ParameterType.UrlSegment);
        request.Resource = "{domain}/messages";
        request.AddParameter("from", "Mailgun Sandbox <postmaster@sandbox6c7c4de453b54bcc982d74b9abe2ba12.mailgun.org>");
        request.AddParameter("to", "Ian <152772a@mymail.nyp.edu.sg>");
        request.AddParameter("subject", "Hello Ian");
        request.AddParameter("text","Congratulations Ian, you just sent an email with Mailgun!  You are truly awesome!");
        request.Method = Method.POST;
        System.Diagnostics.Debug.WriteLine("sa");
        return (RestResponse) client.Execute(request);
    }
}
