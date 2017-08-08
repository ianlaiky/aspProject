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


        //check if requst otp button is clicked before sign in
        if (Session["2faotptimeoutdatetimecheckthis"] == null)
        {
            Label1.Text = "Please request an otp first";
        }
        else
        {

            DateTime checkwiththis = (DateTime) Session["2faotptimeoutdatetimecheckthis"];

            System.Diagnostics.Debug.WriteLine(checkwiththis);
            System.Diagnostics.Debug.WriteLine(DateTime.Now);
            System.Diagnostics.Debug.WriteLine(checkwiththis < DateTime.Now);


            //check if time of request is smaller than current time, if smaller, allow to proceed
            if (checkwiththis > DateTime.Now)
            {
                if (Session["rngPhoneL"] == null)
                {
                    Session["rngPhoneL"] = "";
                }


                string tex = TextBox1.Text.Trim();

                //uncomment this
                if (tex.Equals(Session["rngPhoneL"].ToString()))
                {
                    string guid = Guid.NewGuid().ToString();
                    Session["Authtokenforloginlogoutdel"] = guid;

                    Response.Cookies.Add(new HttpCookie("Authtokenforloginlogoutdel", guid));


                    if (Session["usernameLogin"].ToString().Equals("admin"))
                    {
                        System.Diagnostics.Debug.WriteLine("adm");
                        Session["loggedInCheckCfm"] = "true";
                        Session["adminlogoncheckpls"] = "true";
                        Response.Redirect("adminpg.aspx", true);
                    }
                    else
                    {
                        Session["adminlogoncheckpls"] = "false";
                        Session["loggedInCheckCfm"] = "true";
                        Response.Redirect("YourAccount.aspx", true);
                    }
                }
                else
                {
                    Label1.Text = "Wrong OTP inputed, Please key in the correct one";
                }
            }
            else
            {
                Label1.Text = "30 seconds has eslapsed, OTP expired, Please request again";
            }

           


        }




        //no need to uncommnet unless necessary
        //toggle
        //        string guidd = Guid.NewGuid().ToString();
        //        Session["Authtokenforloginlogoutdel"] = guidd;
        //
        //        Response.Cookies.Add(new HttpCookie("Authtokenforloginlogoutdel", guidd));
        //        Session["loggedInCheckCfm"] = "true";
        //        Response.Redirect("YourAccount.aspx", true);
    }

    protected void Button100_Click(object sender, EventArgs e)
    {
      

        string username = (string)Session["usernameLogin"];
        string md5hash = (string)Session["md5Store"];

        UserCustomer cu = new UserCustomer();
        cu = cu.getAllDataByName(username);

        string salt = cu.Passwordsalt;

        string firstNameCipher = cu.FirstName;
        string lastNameCipher = cu.LastName;
        string nricCipher = cu.Nric;
        string phone = cu.PhoneNo;


        byte[] salttoByte = Convert.FromBase64String(salt);


        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(md5hash, salttoByte);


        RijndaelManaged cipher = new RijndaelManaged();

        //set key and initialisation vec from rfc
        cipher.Key = pdb.GetBytes(32);
        cipher.IV = pdb.GetBytes(16);
        ICryptoTransform decryptTransform = cipher.CreateDecryptor();


        byte[] cipherphone = Convert.FromBase64String(phone);

        byte[] plaintextPhone = decryptTransform.TransformFinalBlock(cipherphone, 0, cipherphone.Length);

        string resultPhone = Encoding.UTF8.GetString(plaintextPhone);






   

        //save current date and time at the point of request

        DateTime timeofrequesttimeout = DateTime.Now.AddSeconds(30);
       System.Diagnostics.Debug.WriteLine(timeofrequesttimeout);
        Session["2faotptimeoutdatetimecheckthis"] = timeofrequesttimeout;






        Random rnd = new Random();
                string digit = rnd.Next(999999).ToString();
                Session["rngPhoneL"] = digit;
        System.Diagnostics.Debug.WriteLine(digit);
        //uncomment this

        
                string resPhone = "+65" + resultPhone;
        
                Tzwilio g = new Tzwilio(resPhone, digit);
                g.choasSms();

    
    }
}