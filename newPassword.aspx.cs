using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {


        string passhashfromform = TextBox1.Text.Trim();
        //look here
        Session["md5hashforforgetpassplsthx"] = passhashfromform;

        System.Diagnostics.Debug.WriteLine(passhashfromform);


        string nricFromform = HiddenFieldNricEncrypted.Value;

        string bdfromform =HiddenFieldBirthdayEncrypted.Value;


        string sha1askehy = HiddenFieldsha1askeyforcleint.Value;
        Session["sha1askeyforcleintx"] = sha1askehy;



      UserCustomer cs = new UserCustomer();

        string saltFrodb = cs.getAllDataByName(Session["forgetPassTosaveusername"].ToString()).Passwordsalt;



     


        byte[] saltpls = Convert.FromBase64String(saltFrodb);


        string phonepl = Session["forgetPassTosavephoneNumber"].ToString();
        string emailps = Session["forgetPassTosaveemail"].ToString();



        string encryptedNric = encryptData(nricFromform, passhashfromform, saltpls);
        string encryptebirthdayc = encryptData(bdfromform, passhashfromform, saltpls);
        string encryptephone = encryptData(phonepl, passhashfromform, saltpls);
        string encryptemail = encryptData(emailps, passhashfromform, saltpls);

        Session["encryptedforforgetpassthxnric"] = encryptedNric;
        Session["encryptedforforgetpassthxbirthday"] = encryptebirthdayc;
        Session["encryptedforforgetpassthxphone"] = encryptephone;
        Session["encryptedforforgetpassthxemail"] = encryptemail;
        Session["sha1askeyforcleintx"] = HiddenFieldsha1fornextuser.Value;

        

        //label sucess


        Response.Redirect("addressConfirm.aspx");






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