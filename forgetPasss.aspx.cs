using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgetPasss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string username = TextBox1.Text.Trim();
        string Nric = TextBox6.Text.Trim();
        string phoneNumber = TextBox5.Text.Trim();
        string email = TextBox3.Text.Trim();
        string birthday = TextBox2.Text.Trim();

        UserCustomer dsa = new UserCustomer();
        string dbgetPo = dsa.getAllDataByName(username).ForgetHash;




        string checkVali = HiddenFieldCheckForValBu.Value.Trim();

        if (dbgetPo.Equals(checkVali))
        {
            Response.Redirect("EmailOtp.aspx");
        }
        else
        {
            Label1.Text = "One of the fields is incorrect";
        }









        //    Tzwilio d = new Tzwilio("+6598517761","testung");
        //        d.choasSms();


        //        EmailSender s = new EmailSender("Aravin", "aravinmanokaran10@gmail.com","21/09/1997","Hi, Reagrds");
        //        s.SendSimpleMessage();
    }
}