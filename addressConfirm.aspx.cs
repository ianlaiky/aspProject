using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addressConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        UserCustomer cs = new UserCustomer();

        string saltFrodb = cs.getAllDataByName(Session["forgetPassTosaveusername"].ToString()).Passwordsalt;


        //pass from form
        string passfromform = Session["md5hashforforgetpassplsthx"].ToString();

        //hash on server side
        SHA512Managed hashing = new SHA512Managed();

        string finalHashval;
        string serverhashwithSaltText = passfromform + saltFrodb;

        System.Diagnostics.Debug.WriteLine("combining salt" + serverhashwithSaltText);

        byte[] serverHashwithSaltHashed = hashing.ComputeHash(Encoding.UTF8.GetBytes(serverhashwithSaltText));

        System.Diagnostics.Debug.WriteLine("Server hashed value before convert" + serverHashwithSaltHashed);

        finalHashval = Convert.ToBase64String(serverHashwithSaltHashed);
        System.Diagnostics.Debug.WriteLine("Server hashed value " + finalHashval);






















        string encryptednric = Session["encryptedforforgetpassthxnric"].ToString();
        string encryptedbirthday = Session["encryptedforforgetpassthxbirthday"].ToString();
        string encryotedSession = Session["encryptedforforgetpassthxphone"].ToString();
        string encryptedemail = Session["encryptedforforgetpassthxemail"].ToString();


















    }

    protected string encryptData(string data, string hash, byte[] salttoByte)
    {
        byte[] cipherText;

        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(hash, salttoByte);

        RijndaelManaged cipher = new RijndaelManaged();
        cipher.Key = pdb.GetBytes(32);
        cipher.IV = pdb.GetBytes(16);
        ICryptoTransform enCryptoTransform = cipher.CreateEncryptor();
        byte[] plainText = Encoding.UTF8.GetBytes(data);
        cipherText = enCryptoTransform.TransformFinalBlock(plainText, 0, plainText.Length);


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
}