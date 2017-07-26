using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
        if (Page.IsValid)
        {

            UserCustomer ssdsd = new UserCustomer();

            int cuas = ssdsd.Attempt;


            if (cuas < 4)
            {

                string username = (string) Session["usernameLogin"];
                UserCustomer su = new UserCustomer();
                su = su.getAllDataByName(username);
                //getting salt and hash from db based on username
                string salt = su.Passwordsalt;
                string hashvalueToCheck = su.Passwordhash;

                //server hashing
                string hashvalClient = TextBox2.Text;
                string combine = hashvalClient + salt;

                SHA512Managed hashing = new SHA512Managed();

                byte[] serverHashwithSaltHashed = hashing.ComputeHash(Encoding.UTF8.GetBytes(combine));

                //converting bytes to base64
                string finalval = Convert.ToBase64String(serverHashwithSaltHashed);


                System.Diagnostics.Debug.WriteLine(finalval);

                //validation
                if (hashvalueToCheck == finalval)
                {
                    Session["accountLoginVerified"] = "true";
                    Session["md5Store"] = hashvalClient;
                    Response.Redirect("2faLogin.aspx", false);
                }
                else
                {

                    UserCustomer sd = new UserCustomer();
                    UserCustomer users = new UserCustomer();

                    users = sd.getAllDataByName(username);
                    int curreatt = users.Attempt;

                    sd.updateuserattempts(username, curreatt + 1);


                    Labelerr.Text = "Incorrect password";
                }

            }
            else
            {

                Labelerr.Text = "Account locked, you had 3 failed logon attempts";
            }


        }
    }


 
}