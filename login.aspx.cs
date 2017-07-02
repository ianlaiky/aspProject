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
            Session["usernameLogin"] = Server.HtmlEncode(TextBox1.Text);
            Response.Redirect("passwordlogin.aspx");
        }
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("forgetpasswordForm.aspx");
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

    protected void username_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        Regex r = new Regex("^[a-zA-Z0-9]*$");
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