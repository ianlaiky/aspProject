using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class decryptionTesting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string retrievemd5hash = TextBox6.Text;
        string salt = TextBox5.Text;

        System.Diagnostics.Debug.WriteLine("retrieved md5 val" + retrievemd5hash);
        System.Diagnostics.Debug.WriteLine("salt value" + salt);

        string serversidecombine = retrievemd5hash + salt;
        System.Diagnostics.Debug.WriteLine("serverside combine" + serversidecombine);


        SHA512Managed hashing = new SHA512Managed();
        byte[] serverHashwithSaltHashed = hashing.ComputeHash(Encoding.UTF8.GetBytes(serversidecombine));

        string finalHashval = Convert.ToBase64String(serverHashwithSaltHashed);


        System.Diagnostics.Debug.WriteLine("serverside final hash val" + finalHashval);

        //decr

       byte[] Key;
        byte[] IV;



        System.Diagnostics.Debug.WriteLine("new te---------------------------------------------------------------" );
        RijndaelManaged cipher = new RijndaelManaged();
        cipher.GenerateKey();
        Key = cipher.Key;
        IV = cipher.IV;
        System.Diagnostics.Debug.Write("The guy key: ");
        for (int i = 0; i < Key.Length; i++)
        {

           
            System.Diagnostics.Debug.Write(Key[i]+" ");
        }
        System.Diagnostics.Debug.Write("IV: ");
        for (int i = 0; i < IV.Length; i++)
        {
           
            System.Diagnostics.Debug.Write( IV[i]+" ");
        }
        System.Diagnostics.Debug.WriteLine("The guy key: " + Key);
        System.Diagnostics.Debug.WriteLine("IV: " + IV);



        System.Diagnostics.Debug.WriteLine("Testing Retrieve Mtd " );
        UserCustomer custTest = new UserCustomer();
        custTest = custTest.getAllDataByName("123");
        System.Diagnostics.Debug.WriteLine("username " + custTest.Username);
        System.Diagnostics.Debug.WriteLine("hash " + custTest.Passwordhash);
        System.Diagnostics.Debug.WriteLine("salt " + custTest.Passwordsalt);
        System.Diagnostics.Debug.WriteLine("PhoneNo " + custTest.PhoneNo);
        System.Diagnostics.Debug.WriteLine("Address " + custTest.Address);
        System.Diagnostics.Debug.WriteLine("FirstName " + custTest.FirstName);
        System.Diagnostics.Debug.WriteLine("LastName " + custTest.LastName);
        System.Diagnostics.Debug.WriteLine("Email " + custTest.Email);
        System.Diagnostics.Debug.WriteLine("Birthday " + custTest.Birthday);
        System.Diagnostics.Debug.WriteLine("EmailVerified " + custTest.EmailVerified);
        System.Diagnostics.Debug.WriteLine("PhoneVerified " + custTest.PhoneVerified);
        System.Diagnostics.Debug.WriteLine("Nric " + custTest.Nric);





    }

    protected void Button3_OnClick(object sender, EventArgs e)
    {
        string retrievedata = TextBox7.Text;
        string rethashKey = TextBox8.Text;
        string retrSalt = TextBox9.Text;

        byte[] salttoByte = Convert.FromBase64String(retrSalt);
        string hash = rethashKey;
        string data = retrievedata;

        byte[] cipherText;

        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(hash, salttoByte);

        RijndaelManaged cipher = new RijndaelManaged();
        cipher.Key = pdb.GetBytes(32);
        cipher.IV = pdb.GetBytes(16);
        ICryptoTransform decryptTransform = cipher.CreateDecryptor();

        byte[] plainText = Convert.FromBase64String(data);
        cipherText = decryptTransform.TransformFinalBlock(plainText, 0, plainText.Length);


        string resu = Encoding.UTF8.GetString(cipherText);


        System.Diagnostics.Debug.WriteLine("THE DATA IS: " + resu);



    }

    protected void Button4_OnClick(object sender, EventArgs e)
    {
        RijndaelManaged kesa = new RijndaelManaged();

        string keyyy = Convert.ToBase64String(kesa.Key);
        string ibvvv = Convert.ToBase64String(kesa.IV);

        System.Diagnostics.Debug.WriteLine("THE Key IS: " + keyyy);
        System.Diagnostics.Debug.WriteLine("THE IV IS: " + ibvvv);




    }
}