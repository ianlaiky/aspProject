using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

public partial class userTwilioTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {




        // Your Account SID from twilio.com/console
        var accountSid = "ACa1126441199f69f7fe3d08c38004da41";
        // Your Auth Token from twilio.com/console
        var authToken = "e3fdbb9a5b96a5f170be0b455cd4ef8a";

        TwilioClient.Init(accountSid, authToken);

        var message = MessageResource.Create(
            to: new PhoneNumber("+6598517761"),
            from: new PhoneNumber("+16304746289 "),
            body: "Hello from C#");

        Console.WriteLine(message.Sid);
        Console.Write("Press any key to continue.");
        Console.ReadKey();



    }
}