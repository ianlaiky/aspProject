using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;


public partial class userRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        


        if (!IsPostBack)
        {
            // Validate initially to force asterisks
            // to appear before the first roundtrip.
            
         


            Guid token = Guid.NewGuid();
            Session["AntiforgeryToken"] = token;
            antiforgery.Value = token.ToString();


            System.Diagnostics.Debug.WriteLine("Token");
            System.Diagnostics.Debug.WriteLine(token);
            System.Diagnostics.Debug.WriteLine(antiforgery.Value);




            //Testing redirect
            //Response.Redirect("XSS detected");


        }
        else
        {

            Guid stored = (Guid)Session["AntiforgeryToken"];
            string tokenstored = stored.ToString();
            string sent = antiforgery.Value;
            string tokensent = antiforgery.Value.ToString();
            if (tokenstored!=tokensent)
            {
                Response.Redirect("errorxss.aspx",false);
            }
        }
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            System.Diagnostics.Debug.WriteLine("testing");
//            Response.Redirect("errorxss.aspx", false);


            //captcha start :)
            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            System.Diagnostics.Debug.WriteLine(encodedResponse);
            var isCaptchaValid = ReCaptcha.Validate(encodedResponse);
            System.Diagnostics.Debug.WriteLine(isCaptchaValid);

            //done at the customvalidator side
            if (!isCaptchaValid)
            {
                System.Diagnostics.Debug.WriteLine("Captcha failure");


                // E.g. Return to view or set an error message to visible
            }
            //captcha end :(



            //String a = TextBox1.Text;
            //String c = Text1.Value.ToString();



            //System.Diagnostics.Debug.WriteLine("testing 1 " + a);
            //System.Diagnostics.Debug.WriteLine("testing 1 " + c);

            System.Diagnostics.Debug.WriteLine("testing");

            System.Diagnostics.Debug.WriteLine("Password is: "+TextBox1.Text);
            System.Diagnostics.Debug.WriteLine("Salt value: "+HiddenFieldForSalt.Value);
            System.Diagnostics.Debug.WriteLine("Cipher received from first name: "+ HiddenFieldFirstNameEncrypted.Value);
            System.Diagnostics.Debug.WriteLine("Cipher received from last name: "+ HiddenFieldLastNameEncrypted.Value);
            System.Diagnostics.Debug.WriteLine("Cipher received from address: "+ HiddenFieldAddressEncrypted.Value);
            System.Diagnostics.Debug.WriteLine("Cipher received from birthday: "+ HiddenFieldBirthdayEncrypted.Value);
            System.Diagnostics.Debug.WriteLine("Cipher received from nric: "+ HiddenFieldNricEncrypted.Value);



            string uUsername = Server.HtmlEncode(Username.Text);
            string uPasswordhash = TextBox1.Text;
            string uPasswordSalt = HiddenFieldForSalt.Value;
            string uFirstName = HiddenFieldFirstNameEncrypted.Value;
            string uLastName = HiddenFieldLastNameEncrypted.Value;
            string uPhoneNo = Server.HtmlEncode(phoneNumberInput.Text);
            string uAddress = HiddenFieldAddressEncrypted.Value;
            string uEmail = Server.HtmlEncode(emailInput.Text);
            string uBirthday = HiddenFieldBirthdayEncrypted.Value;
            string uemailverified = "false";
            string uphoneVerified = "false";
            string uNric = HiddenFieldNricEncrypted.Value;

            //hash on server side
            SHA512Managed hashing = new SHA512Managed();

            string finalHashval;
            string serverhashwithSaltText = uPasswordhash + uPasswordSalt;

            System.Diagnostics.Debug.WriteLine("combining salt" + serverhashwithSaltText);

            byte[] serverHashwithSaltHashed = hashing.ComputeHash(Encoding.UTF8.GetBytes(serverhashwithSaltText));

            System.Diagnostics.Debug.WriteLine("Server hashed value before convert" + serverHashwithSaltHashed);

            finalHashval = Convert.ToBase64String(serverHashwithSaltHashed);
            System.Diagnostics.Debug.WriteLine("Server hashed value " + finalHashval);


            //            System.Diagnostics.Debug.WriteLine("DEBUGGING__???");
            //
            //            string teststring = "hello";
            //
            //            byte[] encodedteststring = hashing.ComputeHash(Encoding.UTF8.GetBytes(teststring));
            //
            //            string resultingtest = Convert.ToBase64String(encodedteststring);
            //
            //            System.Diagnostics.Debug.WriteLine("test hash val " + resultingtest);



            //todo look into this for rfc2928 for key derivation

            byte[] salttoByte = Convert.FromBase64String(uPasswordSalt);
            System.Diagnostics.Debug.WriteLine(" ");
            System.Diagnostics.Debug.Write("Salt in byte array: ");
            for (int i = 0; i < salttoByte.Length; i++)
            {
                System.Diagnostics.Debug.Write(salttoByte[i]);
            }


         //metd for encrypot
            string encryptedPhone = encryptData(uPhoneNo, uPasswordhash, salttoByte);
            string enryptedAddress = encryptData(uAddress, uPasswordhash, salttoByte);
            string encryptedFirstName = encryptData(uFirstName, uPasswordhash, salttoByte);
            string encryptedLastName = encryptData(uLastName, uPasswordhash, salttoByte);
            string encryptedEmail = encryptData(uEmail, uPasswordhash, salttoByte);
            string encryptedBirthday = encryptData(uBirthday, uPasswordhash, salttoByte);
            string encryptedNric = encryptData(uNric, uPasswordhash, salttoByte);

            Session["nextPageUserRegEMail"] = uEmail;
            Session["nextPageUserRegPhone"] = uPhoneNo;

            Session["nextPageUserReg"] = uUsername;


            UserCustomer newuser = new UserCustomer(uUsername, finalHashval, uPasswordSalt, encryptedPhone, enryptedAddress, encryptedFirstName, encryptedLastName, encryptedEmail, encryptedBirthday, uemailverified,uphoneVerified, encryptedNric,HiddenFieldForsavingHashOfForget.Value.Trim());
            newuser.CustomerInsert();


            Fund fd = new Fund(uUsername, 0.0);
            fd.FundInsertNewUserOnly();

            Response.Redirect("userRegisterInputConf.aspx");


        }

      
    }

    protected void existinguser_Validate(object source, ServerValidateEventArgs args)
    {

        UserCustomer customer = new UserCustomer();
        List<String> usernamelist = customer.getAllUserName();

        //auto random data insert to db incase of failure; prevent null 
        try
        {
            System.Diagnostics.Debug.WriteLine("validator custom check " + usernamelist.Count + usernamelist[0]);
        }
        catch (Exception e)
        {
            string dummydata = "091dummydataOnlyonce";
     
            UserCustomer n = new UserCustomer(dummydata, dummydata, dummydata, dummydata, dummydata, dummydata, dummydata, dummydata, dummydata, dummydata, dummydata, dummydata,dummydata);
            n.CustomerInsert();


        }

        string currentUsername = Username.Text;

        int valtest = 0;

        for (int i = 0; i < usernamelist.Count; i++)
        {


            if (currentUsername.Equals(usernamelist[i]))
            {
                valtest++;
            }
           
           



            System.Diagnostics.Debug.WriteLine("Usernames in list :"+usernamelist[i]);

        }


        if (valtest != 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }


    }

    protected Boolean specialCharCheck(String data)
    {
        Regex r = new Regex("^[a-zA-Z0-9\\-\\s]+$");
        if (r.IsMatch(data))
        {
           return true;
        }
        else
        {
            return false;
        }

    }

    protected Boolean specialCharCheckEmail(String data)
    {
        Regex r = new Regex(@"^[a-zA-Z0-9#,-]*$");
        if (r.IsMatch(data))
        {
            return true;
        }
        else
        {
            return false;
        }

    }


    protected void captcha_validate(object source, ServerValidateEventArgs args)
    {


        //captcha start
        var encodedResponse = Request.Form["g-Recaptcha-Response"];
        System.Diagnostics.Debug.WriteLine(encodedResponse);
        var isCaptchaValid = ReCaptcha.Validate(encodedResponse);
        System.Diagnostics.Debug.WriteLine(isCaptchaValid);

        //done at the customvalidator side
        if (!isCaptchaValid)
        {
            System.Diagnostics.Debug.WriteLine("Captcha failure");
            args.IsValid = false;

            // E.g. Return to view or set an error message to visible
        }
        else
        {
            args.IsValid = true;
        }
        //captcha end
    }

    // did this for nothing TT; forgot that server does not know user's data so check is pointless; at least it knows the username tho TT
    //    protected void existingNric_validate(object source, ServerValidateEventArgs args)
    //    {
    //        
    //        UserCustomer customer = new UserCustomer();
    //        List<string> cusList = customer.getAllNric();
    //        System.Diagnostics.Debug.WriteLine("nric in list :" + cusList.Count);
    //
    //        string currentnirc = nricInput.Text;
    //        System.Diagnostics.Debug.WriteLine("curr nric :" + currentnirc);
    //
    //        int validateme = 0;
    //
    //        for (int i = 0; i < cusList.Count; i++)
    //        {
    //            if (currentnirc.Equals(cusList[i]))
    //            {
    //                validateme++;
    //            }
    //
    //
    //
    //
    //
    //        }
    //        if (validateme != 0)
    //        {
    //            args.IsValid = false;
    //        }
    //        else
    //        {
    //            args.IsValid = true;
    //        }
    //
    //
    //
    //    }


    protected string encryptData(string data,string hash,byte[] salttoByte)
    {
        byte[] cipherText;

        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(hash, salttoByte);

        RijndaelManaged cipher = new RijndaelManaged();
        cipher.Key = pdb.GetBytes(32);
        cipher.IV = pdb.GetBytes(16);
        ICryptoTransform enCryptoTransform = cipher.CreateEncryptor();
        byte[] plainText = Encoding.UTF8.GetBytes(data);
        cipherText = enCryptoTransform.TransformFinalBlock(plainText, 0,plainText.Length);

       

        string sendback = Convert.ToBase64String(cipherText);

        System.Diagnostics.Debug.WriteLine("Encrypted cipher test " + sendback);

        byte[] testingtodelete = Convert.FromBase64String(sendback);
        string testing2 = Convert.ToBase64String(testingtodelete);
        System.Diagnostics.Debug.WriteLine("Encrypted cipher testINGGG " + testing2);



        //decrypt testing
//        string decrdfs = decryptData(sendback, hash, salttoByte);
//       
//        System.Diagnostics.Debug.WriteLine("Original " + data);
//        System.Diagnostics.Debug.WriteLine("decrypted cipher test " + decrdfs);


        return sendback;
    }

    //confu
    protected string decryptData(string data, string hash, byte[] salttoByte)
    {
        byte[] cipherText;

        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(hash, salttoByte);

        RijndaelManaged cipher = new RijndaelManaged();
        cipher.Key = pdb.GetBytes(32);
        cipher.IV = pdb.GetBytes(16);
        ICryptoTransform decryptTransform = cipher.CreateDecryptor();

        byte[] plainText = Convert.FromBase64String(data);
        cipherText = decryptTransform.TransformFinalBlock(plainText, 0, plainText.Length);


        string resu = Encoding.UTF8.GetString(cipherText);

        return resu;
    }


    protected void usernameRex_OnServerValidate(object source, ServerValidateEventArgs args)
    {

        String data = Username.Text;

        args.IsValid = specialCharCheck(data);





    }

    protected void nricRex_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        String data = nricInput.Text;
        args.IsValid = specialCharCheck(data);
    }

    protected void firstNameRex_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        String data = firstNameInput.Text;
        args.IsValid = specialCharCheck(data);
    }

    protected void lastNameRex_OnServerValidate(object source, ServerValidateEventArgs args)
    {
        String data = lastNameInput.Text;
        args.IsValid = specialCharCheck(data);
    }

   
}
public static class AntiforgeryChecker
{
    public static void Check(Page page, HiddenField antiforgery)
    {
        if (!page.IsPostBack)
        {
            Guid antiforgeryToken = Guid.NewGuid();
            page.Session["AntiforgeryToken"] = antiforgeryToken;
            antiforgery.Value = antiforgeryToken.ToString();
        }
        else
        {
            Guid stored = (Guid)page.Session["AntiforgeryToken"];
            Guid sent = new Guid(antiforgery.Value);
            if (sent != stored)
            {
                throw new SecurityException("XSRF Attack Detected!");
            }
        }
    }
}

public class ReCaptcha
{
    public bool Success { get; set; }
    public List<string> ErrorCodes { get; set; }

    public static bool Validate(string encodedResponse)
    {

        System.Diagnostics.Debug.WriteLine("Encoded response");
        System.Diagnostics.Debug.WriteLine(encodedResponse);

        if (string.IsNullOrEmpty(encodedResponse)) return false;

        var client = new System.Net.WebClient();
        var secret = "6Ld9kCMUAAAAAG4heAiQYEfbnd_BG--p7pGNe9wZ";

        System.Diagnostics.Debug.WriteLine("secret");
        System.Diagnostics.Debug.WriteLine(secret);

        if (string.IsNullOrEmpty(secret)) return false;

        var googleReply = client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secret, encodedResponse));

        var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();

        var reCaptcha = serializer.Deserialize<ReCaptcha>(googleReply);

        System.Diagnostics.Debug.WriteLine("JSON");
        System.Diagnostics.Debug.WriteLine(reCaptcha);

        return reCaptcha.Success;
    }
}