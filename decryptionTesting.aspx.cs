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


    }
}