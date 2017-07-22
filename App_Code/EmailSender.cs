using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using RestSharp.Authenticators;
/// <summary>
/// Summary description for EmailSender
/// </summary>
public class EmailSender
{
    private string realName;
    private string email;
    private string header;
    private string body;


    public EmailSender()
    {
   
    }


    public EmailSender(string realName, string email, string header, string body)
    {
        this.realName = realName;
        this.email = email;
        this.header = header;
        this.body = body;
    }


    public string RealName
    {
        get { return realName; }
        set { realName = value; }
    }

    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    public string Header
    {
        get { return header; }
        set { header = value; }
    }

    public string Body
    {
        get { return body; }
        set { body = value; }
    }

    public RestResponse SendEmail()
    {

        string sendtopara = RealName + " <" + Email + ">";




        RestClient client = new RestClient();
        client.BaseUrl = new Uri("https://api.mailgun.net/v3");
        client.Authenticator = new HttpBasicAuthenticator("api", "key-15734816f9e935f32e85cdfd6e8c1be3");
        RestRequest request = new RestRequest();
        request.AddParameter("domain", "sandbox6c7c4de453b54bcc982d74b9abe2ba12.mailgun.org", ParameterType.UrlSegment);
        request.Resource = "{domain}/messages";
        request.AddParameter("from", "Mailgun Sandbox <postmaster@sandbox6c7c4de453b54bcc982d74b9abe2ba12.mailgun.org>");
        request.AddParameter("to", sendtopara);
        request.AddParameter("subject", Header);
        request.AddParameter("text", Body);
        request.Method = Method.POST;
//        System.Diagnostics.Debug.WriteLine("sa");
        return (RestResponse)client.Execute(request);
    }


}