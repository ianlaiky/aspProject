using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {


            UserCustomer ds = new UserCustomer();
            UserCustomer aq = new UserCustomer();
            aq = ds.getAllDataByName(TextBox1.Text);



            int att = aq.Attempt;

            if (att < 4)
            {

                Session["usernameLogin"] = Server.HtmlEncode(TextBox1.Text);
                Response.Redirect("passwordlogin.aspx");

            }
            else
            {
                Labelatte.Text = "Account locked, you had 3 failed logon attempts";

            }








        }
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("forgetPasss.aspx");
    }

    protected void CustomValidator1_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        string username = Server.HtmlEncode(TextBox1.Text);

        UserCustomer cu = new UserCustomer();
        cu = cu.getAllDataByName(username);


        if (cu == null)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }

    protected void usernameRe_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        Regex r = new Regex("^[a-zA-Z0-9]*$");

        String data = TextBox1.Text;

        if (r.IsMatch(data))
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
}
