using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmailOtp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {


            string username = Session["forgetPassTosaveusername"].ToString();
            string Nric = Session["forgetPassTosavenric"].ToString();
            string phoneNumber = Session["forgetPassTosavephoneNumber"].ToString();
            string email = Session["forgetPassTosaveemail"].ToString();
            string birthday = Session["forgetPassTosavebirthday"].ToString();


            Random rnd = new Random();
            string digit = rnd.Next(999999).ToString();
            Session["rngforEmailOTPgere"] = digit;


            EmailSender em = new EmailSender("user", email, "One time password", "Please enter this one time password: " + digit);
            em.SendEmail();



        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string otp = TextBox1.Text.Trim();





        string checkthis = Session["rngforEmailOTPgere"].ToString();


        System.Diagnostics.Debug.Write(otp);
        System.Diagnostics.Debug.Write(checkthis);

        if (otp.Equals(checkthis))
        {

            Response.Redirect("newPassword.aspx");

        }
        else
        {
            Label1.Text = "Wrong OTP entered! Please enter the correct one";
        }






    }
}