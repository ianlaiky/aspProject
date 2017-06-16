using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
    //    protected void forgetpassword(object sender, EventArgs e)
    //    {
    //        Response.Redirect("2faLogin.aspx", false);
    //    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("passwordlogin.aspx");
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("forgetpasswordForm.aspx");
    }

    protected void CustomValidator1_OnServerValidate(object source, ServerValidateEventArgs args)
    {

        string username = TextBox1.Text;
     





    }
}