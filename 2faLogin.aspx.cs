using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2faLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {


        string tex = TextBox1.Text.Trim();


        if (tex.Equals(Session["rngPhoneL"].ToString()))
        {
            Response.Redirect("TransferFund.aspx", false);
        }
        else
        {
            Label1.Text="Wrong OTP";
        }



       
    }
}