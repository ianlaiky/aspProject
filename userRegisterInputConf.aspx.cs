using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userRegisterInputConf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {

        /*

        if (Session["emailClickedRConf"] == null)
        {
            Session["emailClickedRConf"] = "false";
        }


        if (!Session["emailClickedRConf"].ToString().Equals("true"))
        {

          
           DateTime otherDate = DateTime.Now.AddMinutes(1);


            Session["otherDateTimeNow"] = otherDate;

            string email = Session["nextPageUserRegEMail"].ToString();

            System.Diagnostics.Debug.WriteLine(email);
            Random rnd = new Random();
            string digit = rnd.Next(999999).ToString();
            Session["rngPhoneLEmailUserReg"] = digit;


            EmailSender ema = new EmailSender("User",email,"Verification","Input this one time code: "+digit);
            ema.SendEmail();

            System.Diagnostics.Debug.WriteLine("rr" + Session["nextPageUserRegEMail"].ToString());
            Label1.Text = "Message sent";



            Session["emailClickedRConf"] = "true";

           

            
        }
        else
        {

            DateTime otherdate = (DateTime) Session["otherDateTimeNow"];
            System.Diagnostics.Debug.WriteLine(otherdate);
            System.Diagnostics.Debug.WriteLine(DateTime.Now);


            bool d = otherdate < DateTime.Now;

            System.Diagnostics.Debug.WriteLine("check date" + d);

            if (otherdate < DateTime.Now)
            {
                DateTime otherDate = DateTime.Now.AddMinutes(1);
                System.Diagnostics.Debug.WriteLine("rr" + Session["nextPageUserRegEMail"].ToString());
                Random rnd = new Random();
                string digit = rnd.Next(999999).ToString();
                Session["rngPhoneLEmailUserReg"] = digit;

                string email = Session["nextPageUserRegEMail"].ToString();
                EmailSender ema = new EmailSender("User", email, "Verification", "Input this one time code: " + digit);
                ema.SendEmail();

                Session["otherDateTimeNow"] = otherDate;
                Label1.Text = "Message sent";
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("rr" + Session["nextPageUserRegEMail"].ToString());
                Label1.Text = "Please wait one Minute before requesting";
            }



        }
     


    */
    
    



    }

    protected void Button3_OnClick(object sender, EventArgs e)
    {
        

        string tree = Session["rngPhoneLEmailUserReg"].ToString();


        string emailcheckl = enailcheck.Text.Trim();



        if (tree.Equals(emailcheckl))
        {

            UserCustomer us = new UserCustomer();

            string usess = Session["nextPageUserReg"].ToString();



            us.updateStatusEmail(usess, "true");

            Label3.Text = "Email verified";


        }
        else
        {

            Label3.Text = "Incorrect otp";
        }



    }

    protected void Button2_OnClick(object sender, EventArgs e)
    {
        /*

        if (Session["phoneClickedRConf"] == null)
        {
            Session["phoneClickedRConf"] = "false";
        }


        if (!Session["phoneClickedRConf"].ToString().Equals("true"))
        {


            DateTime otherDate = DateTime.Now.AddMinutes(1);


            Session["PotherDateTimeNow"] = otherDate;

            string phone = Session["nextPageUserRegPhone"].ToString();

            System.Diagnostics.Debug.WriteLine(phone);
            Random rnd = new Random();
            string digit = rnd.Next(999999).ToString();
            Session["rngPhoneLPHHlUserReg"] = digit;

            string pdf = "+65" + Session["nextPageUserRegPhone"].ToString();
           Tzwilio oi = new Tzwilio(pdf,"Otp is: "+digit);
            oi.choasSms();


            System.Diagnostics.Debug.WriteLine("rr" + Session["nextPageUserRegPhone"].ToString());
            Label2.Text = "Message sent";



            Session["phoneClickedRConf"] = "true";




        }
        else
        {

            DateTime otherdate = (DateTime)Session["PotherDateTimeNow"];
            System.Diagnostics.Debug.WriteLine(otherdate);
            System.Diagnostics.Debug.WriteLine(DateTime.Now);


            bool d = otherdate < DateTime.Now;

            System.Diagnostics.Debug.WriteLine("check date" + d);

            if (otherdate < DateTime.Now)
            {
                DateTime otherDate = DateTime.Now.AddMinutes(1);
//                System.Diagnostics.Debug.WriteLine("rr" + Session["nextPageUserRegEMail"].ToString());
                Random rnd = new Random();
                string digit = rnd.Next(999999).ToString();
                Session["rngPhoneLPHHlUserReg"] = digit;

                string pfdd = "+65"+Session["nextPageUserRegPhone"].ToString();
               

                Tzwilio ds = new Tzwilio(pfdd, "Otp is: " + digit);
                ds.choasSms();

                Session["PotherDateTimeNow"] = otherDate;
                Label2.Text = "Message sent";
            }
            else
            {

                Label2.Text = "Please wait one Minute before requesting";
            }



        }
        
    */
    }

    protected void Button4_OnClick(object sender, EventArgs e)
    {


        string trer = Session["rngPhoneLPHHlUserReg"].ToString();

        string get = TextBox2.Text.Trim();


        if (trer.Equals(get))
        {

            UserCustomer us = new UserCustomer();

            string usess = Session["nextPageUserReg"].ToString();



            us.updateStatusphone(usess, "true");

            Label4.Text = "Phone verified";


        }
        else
        {

            Label4.Text = "Incorrect otp";
        }




    }
}