using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


public partial class userRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        


        if (!IsPostBack)
        {
            // Validate initially to force asterisks
            // to appear before the first roundtrip.
            Button1.Attributes.Add("onClick", "GeneratePwd();");
         


            Guid token = Guid.NewGuid();
            Session["AntiforgeryToken"] = token;
            antiforgery.Value = token.ToString();


            System.Diagnostics.Debug.WriteLine("Token");
            System.Diagnostics.Debug.WriteLine(token);
            System.Diagnostics.Debug.WriteLine(antiforgery.Value);




            //Testing redirect
            //Response.Redirect("XSS detected");


        }
        else
        {

            Guid stored = (Guid)Session["AntiforgeryToken"];
            Guid sent = new Guid(antiforgery.Value);
            if (sent != stored)
            {
                Response.Redirect("XSS detected");
            }
        }
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            System.Diagnostics.Debug.WriteLine(encodedResponse);
            var isCaptchaValid = ReCaptcha.Validate(encodedResponse);
            System.Diagnostics.Debug.WriteLine(isCaptchaValid);

            if (!isCaptchaValid)
            {
                System.Diagnostics.Debug.WriteLine("testing testing sdrdsofjskjfd");


                // E.g. Return to view or set an error message to visible
            }

            //String a = TextBox1.Text;
            //String c = Text1.Value.ToString();



            //System.Diagnostics.Debug.WriteLine("testing 1 " + a);
            //System.Diagnostics.Debug.WriteLine("testing 1 " + c);

            System.Diagnostics.Debug.WriteLine("testing");

            System.Diagnostics.Debug.WriteLine(TextBox1.Text);



        }
    }


}
public static class AntiforgeryChecker
{
    public static void Check(Page page, HiddenField antiforgery)
    {
        if (!page.IsPostBack)
        {
            Guid antiforgeryToken = Guid.NewGuid();
            page.Session["AntiforgeryToken"] = antiforgeryToken;
            antiforgery.Value = antiforgeryToken.ToString();
        }
        else
        {
            Guid stored = (Guid)page.Session["AntiforgeryToken"];
            Guid sent = new Guid(antiforgery.Value);
            if (sent != stored)
            {
                throw new SecurityException("XSRF Attack Detected!");
            }
        }
    }
}

public class ReCaptcha
{
    public bool Success { get; set; }
    public List<string> ErrorCodes { get; set; }

    public static bool Validate(string encodedResponse)
    {

        System.Diagnostics.Debug.WriteLine("Encoded response");
        System.Diagnostics.Debug.WriteLine(encodedResponse);

        if (string.IsNullOrEmpty(encodedResponse)) return false;

        var client = new System.Net.WebClient();
        var secret = "6Ld9kCMUAAAAAG4heAiQYEfbnd_BG--p7pGNe9wZ";

        System.Diagnostics.Debug.WriteLine("secret");
        System.Diagnostics.Debug.WriteLine(secret);

        if (string.IsNullOrEmpty(secret)) return false;

        var googleReply = client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secret, encodedResponse));

        var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();

        var reCaptcha = serializer.Deserialize<ReCaptcha>(googleReply);

        System.Diagnostics.Debug.WriteLine("JSON");
        System.Diagnostics.Debug.WriteLine(reCaptcha);

        return reCaptcha.Success;
    }
}