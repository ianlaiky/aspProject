using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
/// <summary>
/// Summary description for Tzwilio
/// </summary>
public class Tzwilio
{
    private string phone;
    private string message;

    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }

    public string Message
    {
        get { return message; }
        set { message = value; }
    }

    public Tzwilio()
    {
        
    }

    public Tzwilio(string phone, string message)
    {
        this.phone = phone;
        this.message = message;
    }


    public bool choasSms()
    {
        bool ht = false;

        try
        {
            // Your Account SID from twilio.com/console
            var accountSid = "ACa1126441199f69f7fe3d08c38004da41";
            // Your Auth Token from twilio.com/console
            var authToken = "e3fdbb9a5b96a5f170be0b455cd4ef8a";

            TwilioClient.Init(accountSid, authToken);

            var message = MessageResource.Create(
                to: new PhoneNumber(Phone),
                from: new PhoneNumber("+16304746289 "),
                body: Message);

            Console.WriteLine(message.Sid);
            Console.Write("Press any key to continue.");
            Console.ReadKey();

            ht = true;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }


        return ht;

    }

}