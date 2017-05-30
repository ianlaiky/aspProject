using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


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