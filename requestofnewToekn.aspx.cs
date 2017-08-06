using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class requestofnewToekn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Tokenrequest rw = new Tokenrequest();

        Tokenrequest qw = new Tokenrequest();

        qw = rw.getAlldatavianame((string) Session["usernameLogin"]);


        if (qw != null)
        {
            Button1.Enabled = false;
            Button1.CssClass = "btn btn-default";
            Button1.Text = "Request sent!";
        }



    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {

        Tokenrequest rw = new Tokenrequest();

        Tokenrequest qw = new Tokenrequest();

        qw = rw.getAlldatavianame((string)Session["usernameLogin"]);


        if (qw == null)
        {
            //do mtd
            string username = (string)Session["usernameLogin"];
            string addressss = HiddenFieldtosendaddress.Value;

            Tokenrequest trq = new Tokenrequest();
            trq.TokenInsert(username, addressss);

            Response.Redirect("requestofnewToekn.aspx");
        }


    

    }
}