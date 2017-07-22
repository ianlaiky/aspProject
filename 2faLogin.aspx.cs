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

        //uncomment this
        //        if (tex.Equals(Session["rngPhoneL"].ToString()))
        //        {
        //            Response.Redirect("TransferFund.aspx", true);
        //        }
        //        else
        //        {
        //            Label1.Text="Wrong OTP";
        //        }






        Response.Redirect("TransferFund.aspx", true);
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

        //uncomment this
//        Random rnd = new Random();
//                string digit = rnd.Next(999999).ToString();
//                Session["rngPhoneL"] = digit;
//        
//        
//                string resPhone = "+65" + resultPhone;
//        
//                Tzwilio g = new Tzwilio(resPhone, digit);
//                g.choasSms();


    }
}