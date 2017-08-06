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

    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {


        //do mtd
        string username = (string)Session["usernameLogin"];
        string addressss = HiddenFieldtosendaddress.Value;

        Tokenrequest trq = new Tokenrequest();
        trq.TokenInsert(username, addressss);



    }
}