using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for Fund
/// </summary>
public class Fund


{
    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;
    string username;
  
    private double bal;


    public Fund()
    {
        
    }
    public Fund(string username,double bal)
    {
        this.username = username;
      
        this.bal = bal;

    }

    public string Username
    {
        get { return username; }
        set { username = value; }
    }

 

    public double Bal
    {
        get { return bal; }
        set { bal = value; }
    }

    public int FundInsertNewUserOnly()
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "INSERT INTO Account(username,balance)" +
            "values (@username,@bal)";
        //+ "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@username", Username);
         
            cmd.Parameters.AddWithValue("@bal", Bal);
           


            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }
        catch (SqlException ex)
        {
           throw new Exception(ex.ToString());
        }
    } //end Insert






    public void setNewFund(string user,double fund)
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "Update Account set balance=@bal where username=@user";
          
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@user", user);
          
            cmd.Parameters.AddWithValue("@bal", fund);



            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
          
        }
        catch (SqlException ex)
        {
            throw new Exception(ex.ToString());
        }

    }

    public double getCurrentFund(string username)
    {
        double bal = 0;


        try
        {
            string queryStr = "SELECT balance FROM Account WHERE username = @username";
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@username", username);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                bal = Convert.ToDouble(dr["balance"].ToString());






            }
            conn.Close();
            dr.Close();
            dr.Dispose();
            return bal;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }
       
      
  
    }


    public bool chaosTransfer(string fromUser, string toUser, double transferAmount,string description)
    {
        bool hey = false;

        try
        {
            double partyA = getCurrentFund(fromUser);
            double partyANewFund = partyA - transferAmount;

            setNewFund(fromUser, partyANewFund);

            double partyB = getCurrentFund(toUser);
            double partyBNewFund = partyB + transferAmount;

            setNewFund(toUser, partyBNewFund);


            Transaction f = new Transaction(fromUser,toUser,transferAmount,description);
            f.TransactionInsert();



            hey = true;







        }
        catch(Exception ex)
        {
            throw new Exception(ex.ToString());
        }
        return hey;






    }

    //encryp key and iv
    //key: L15I8JAPomQ32PH8jvQr9/aVY7iq5TK1xwNSjLjZJd0=
    //iv: ArK98b41BT/x/3fbsOeiww==



    protected string encryptData(string data)
    {
        byte[] cipherText;

     

        RijndaelManaged cipher = new RijndaelManaged();
        cipher.Key = Convert.FromBase64String("L15I8JAPomQ32PH8jvQr9/aVY7iq5TK1xwNSjLjZJd0=");
        cipher.IV = Convert.FromBase64String("ArK98b41BT/x/3fbsOeiww==");
        ICryptoTransform enCryptoTransform = cipher.CreateEncryptor();
        byte[] plainText = Encoding.UTF8.GetBytes(data);
        cipherText = enCryptoTransform.TransformFinalBlock(plainText, 0, plainText.Length);



        string sendback = Convert.ToBase64String(cipherText);

      



     

        return sendback;
    }

    protected string decryptDataString(string data)
    {
        byte[] cipherText;



        RijndaelManaged cipher = new RijndaelManaged();
        cipher.Key = Convert.FromBase64String("L15I8JAPomQ32PH8jvQr9/aVY7iq5TK1xwNSjLjZJd0=");
        cipher.IV = Convert.FromBase64String("ArK98b41BT/x/3fbsOeiww==");
        ICryptoTransform deCryptoTransform = cipher.CreateDecryptor();


        byte[] ciphertext = Convert.FromBase64String(data);


        cipherText = deCryptoTransform.TransformFinalBlock(ciphertext, 0, ciphertext.Length);



        string sendback = Encoding.UTF8.GetString(cipherText);

     



        //decrypt testing
        //        string decrdfs = decryptData(sendback, hash, salttoByte);
        //       
        //        System.Diagnostics.Debug.WriteLine("Original " + data);
        //        System.Diagnostics.Debug.WriteLine("decrypted cipher test " + decrdfs);


        return sendback;
    }


    protected double decryptDatadouble(string data)
    {
        byte[] cipherText;



        RijndaelManaged cipher = new RijndaelManaged();
        cipher.Key = Convert.FromBase64String("L15I8JAPomQ32PH8jvQr9/aVY7iq5TK1xwNSjLjZJd0=");
        cipher.IV = Convert.FromBase64String("ArK98b41BT/x/3fbsOeiww==");
        ICryptoTransform deCryptoTransform = cipher.CreateDecryptor();


        byte[] ciphertext = Convert.FromBase64String(data);


        cipherText = deCryptoTransform.TransformFinalBlock(ciphertext, 0, ciphertext.Length);




        double sendback = Convert.ToDouble(Encoding.UTF8.GetString(cipherText));





        //decrypt testing
        //        string decrdfs = decryptData(sendback, hash, salttoByte);
        //       
        //        System.Diagnostics.Debug.WriteLine("Original " + data);
        //        System.Diagnostics.Debug.WriteLine("decrypted cipher test " + decrdfs);


        return sendback;
    }

    protected double decryptDataint(string data)
    {
        byte[] cipherText;



        RijndaelManaged cipher = new RijndaelManaged();
        cipher.Key = Convert.FromBase64String("L15I8JAPomQ32PH8jvQr9/aVY7iq5TK1xwNSjLjZJd0=");
        cipher.IV = Convert.FromBase64String("ArK98b41BT/x/3fbsOeiww==");
        ICryptoTransform deCryptoTransform = cipher.CreateDecryptor();


        byte[] ciphertext = Convert.FromBase64String(data);


        cipherText = deCryptoTransform.TransformFinalBlock(ciphertext, 0, ciphertext.Length);




        int sendback =Convert.ToInt32(Encoding.UTF8.GetString(cipherText));





        //decrypt testing
        //        string decrdfs = decryptData(sendback, hash, salttoByte);
        //       
        //        System.Diagnostics.Debug.WriteLine("Original " + data);
        //        System.Diagnostics.Debug.WriteLine("decrypted cipher test " + decrdfs);


        return sendback;
    }
}