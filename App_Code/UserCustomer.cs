using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for UserCustomer
/// </summary>
public class UserCustomer
{
    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;
    private string forgetHash;
    private string username;
    private string passwordhash;
    private string passwordsalt;
    private string phoneNo;
    private string address;
    private string firstName;
    private string lastName;
    private string email;
    private string birthday;
    private string emailVerified;
    private string phoneVerified;
    private string nric;


    public UserCustomer()
    {
        //
        // TODO: Add constructor logic here
    }
    public UserCustomer(string username, string passwordhash, string passwordsalt, string phoneNo, string address,
        string firstName, string lastName, string email, string birthday, string emailVerified, string phoneVerified,
        string nric, string forgetHash)
    {
        this.Username = username;
        this.Passwordhash = passwordhash;
        this.Passwordsalt = passwordsalt;
        this.PhoneNo = phoneNo;
        this.Address = address;
        this.FirstName = firstName;
        this.LastName = lastName;
        this.Email = email;
        this.Birthday = birthday;
        this.EmailVerified = emailVerified;
        this.PhoneVerified = phoneVerified;
        this.Nric = nric;
        this.ForgetHash = forgetHash;
  

    }

    public UserCustomer(string username, string passwordhash, string passwordsalt, string phoneNo, string address,
        string firstName, string lastName, string email, string birthday, string emailVerified, string phoneVerified,
        string nric,string forgetHash,int attempt)
    {
        this.Username = username;
        this.Passwordhash = passwordhash;
        this.Passwordsalt = passwordsalt;
        this.PhoneNo = phoneNo;
        this.Address = address;
        this.FirstName = firstName;
        this.LastName = lastName;
        this.Email = email;
        this.Birthday = birthday;
        this.EmailVerified = emailVerified;
        this.PhoneVerified = phoneVerified;
        this.Nric = nric;
        this.ForgetHash = forgetHash;
        this.Attempt = attempt;

    }

    public int Attempt { get; set; }
    public string ForgetHash
    {
        get
        {
            return decryptDataString(this.forgetHash);
        }
        set
        {
            this.forgetHash = encryptData(value);
        }
    }

    public string Username
    {
        get
        {
            return decryptDataString(this.username);
        }
        set
        {
            this.username = encryptData(value);
        }
    }

    public string Passwordhash
    {
        get
        {
            return decryptDataString(this.passwordhash);
        }
        set
        {
            this.passwordhash = encryptData(value);
        }
    }

    public string Passwordsalt
    {
        get
        {
            return decryptDataString(this.passwordsalt);
        }
        set
        {
            this.passwordsalt = encryptData(value);
        }
    }

    public string PhoneNo
    {
        get
        {
            return decryptDataString(this.phoneNo);
        }
        set
        {
            this.phoneNo = encryptData(value);
        }
    }

    public string Address
    {
        get
        {
            return decryptDataString(this.address);
        }
        set
        {
            this.address = encryptData(value);
        }
    }

    public string FirstName
    {
        get
        {
            return decryptDataString(this.firstName);
        }
        set
        {
            this.firstName = encryptData(value);
        }
    }

    public string LastName
    {
        get
        {
            return decryptDataString(this.lastName);
        }
        set
        {
            this.lastName = encryptData(value);
        }
    }

    public string Email
    {
        get
        {
            return decryptDataString(this.email);
        }
        set
        {
            this.email = encryptData(value);
        }
    }

    public string Birthday
    {
        get
        {
            return decryptDataString(this.birthday);
        }
        set
        {
            this.birthday = encryptData(value);
        }
    }

    public string EmailVerified
    {
        get
        {
            return decryptDataString(this.emailVerified);
        }
        set
        {
            this.emailVerified = encryptData(value);
        }
    }

    public string PhoneVerified
    {
        get
        {
            return decryptDataString(this.phoneVerified);
        }
        set
        {
            this.phoneVerified = encryptData(value);
        }
    }

    public string Nric
    {
        get
        {
            return decryptDataString(this.nric);
        }
        set
        {
            this.nric = encryptData(value);
        }
    }


    public int CustomerInsert()
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "INSERT INTO Customer(username,passwordhash,passwordsalt,phoneNo,address,firstName,lastName,email,birthday,emailVerified,phoneVerified,nric,forgethash,attempts)" +
            "values (@username,@passwordhash,@passwordsalt,@phoneNo,@address,@firstName,@lastname,@email,@birthday,@emailVerified,@phoneVerified,@nric,@forgethash,@att)";
        //+ "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@username", encryptData(Username));
            cmd.Parameters.AddWithValue("@passwordhash", encryptData(Passwordhash));
            cmd.Parameters.AddWithValue("@passwordsalt", encryptData(Passwordsalt));
            cmd.Parameters.AddWithValue("@phoneNo", encryptData(PhoneNo));
            cmd.Parameters.AddWithValue("@address", encryptData(Address));
            cmd.Parameters.AddWithValue("@firstName", encryptData(FirstName));
            cmd.Parameters.AddWithValue("@lastname", encryptData(LastName));
            cmd.Parameters.AddWithValue("@email", encryptData(Email));
            cmd.Parameters.AddWithValue("@birthday", encryptData(Birthday));
            cmd.Parameters.AddWithValue("@emailVerified", encryptData(EmailVerified));
            cmd.Parameters.AddWithValue("@phoneVerified", encryptData(PhoneVerified));
            cmd.Parameters.AddWithValue("@nric", encryptData(Nric));
            cmd.Parameters.AddWithValue("@forgethash", encryptData(ForgetHash));
            cmd.Parameters.AddWithValue("@att", 0);


            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }
        catch (SqlException ex)
        {
            return 0;
        }
    } //end Insert


    public List<String> getAllUserName()
    {
        List<String> names = new List<String>();
        string username;

        string queryStr = "SELECT username FROM Customer";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end

        while (dr.Read())
        {
            username = decryptDataString(dr["username"].ToString());

            names.Add(username);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return names;
    }

    public List<String> getAllNric()
    {
        List<String> names = new List<String>();
        string username;

        string queryStr = "SELECT nric FROM Customer";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end

        while (dr.Read())
        {
            username = decryptDataString(dr["nric"].ToString());

            names.Add(username);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return names;
    }

    public UserCustomer getAllDataByName(string name)
    {
        UserCustomer cus;

        string username,
            passwordhash,
            passwordsalt,
            phoneNo,
            address,
            firstName,
            lastName,
            email,
            birthday,
            emailverified,
            phoneverified,
            nric,
            forgetHash;
            int attempt;

        string queryStr = "SELECT* FROM Customer WHERE username = @username";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@username", encryptData(name));
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            username = decryptDataString(dr["username"].ToString());
            passwordhash = decryptDataString(dr["passwordhash"].ToString());
            passwordsalt = decryptDataString(dr["passwordsalt"].ToString());
            phoneNo = decryptDataString(dr["phoneNo"].ToString());
            address = decryptDataString(dr["address"].ToString());
            firstName = decryptDataString(dr["firstName"].ToString());
            lastName = decryptDataString(dr["lastName"].ToString());
            email = decryptDataString(dr["email"].ToString());
            birthday = decryptDataString(dr["birthday"].ToString());
            emailverified = decryptDataString(dr["emailVerified"].ToString());
            phoneverified = decryptDataString(dr["phoneVerified"].ToString());
            nric = decryptDataString(dr["nric"].ToString());
            forgetHash= decryptDataString(dr["forgethash"].ToString());
            attempt= Convert.ToInt32(dr["attempts"].ToString());

            cus = new UserCustomer(username,passwordhash,passwordsalt,phoneNo,address,firstName,lastName,email,birthday,emailverified,phoneverified,nric, forgetHash, attempt);
        

            
        }
        else
        {
            cus = null;
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return cus;

    }

    public void updateStatusEmail(string user,string status)
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "Update Customer set emailVerified=@emailver where username=@user";

        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@user", encryptData(user));

            cmd.Parameters.AddWithValue("@emailver", encryptData(status));



            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();

        }
        catch (SqlException ex)
        {
            throw new Exception(ex.ToString());
        }

    }

    public void updateStatusphone(string user, string status)
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "Update Customer set phoneVerified=@lver where username=@user";

        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@user", encryptData(user));

            cmd.Parameters.AddWithValue("@lver", encryptData(status));



            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();

        }
        catch (SqlException ex)
        {
            throw new Exception(ex.ToString());
        }

    }


    public void updateuserattempts(string user, int att)
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "Update Customer set attempts=@lver where username=@user";

        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@user", encryptData(user));

            cmd.Parameters.AddWithValue("@lver", att);



            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();

        }
        catch (SqlException ex)
        {
            throw new Exception(ex.ToString());
        }

    }

    public void updateforForgetpass(string user,string passwordHash, string phoneNo,string address, string firstName, string lastname, string email, string birthday, string nric)
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "Update Customer set passwordhash=@passwordHash,phoneNo=@phoneNo,address=@address,firstName=@fname,lastName=@lname,email=@email,birthday=@birthday,nric=@nric where username=@user";

        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@user", encryptData(user));
            cmd.Parameters.AddWithValue("@passwordHash", encryptData(passwordHash));
            cmd.Parameters.AddWithValue("@phoneNo", encryptData(phoneNo));
            cmd.Parameters.AddWithValue("@address", encryptData(address));
            cmd.Parameters.AddWithValue("@fname", encryptData(firstName));
            cmd.Parameters.AddWithValue("@lname", encryptData(lastname));
            cmd.Parameters.AddWithValue("@email", encryptData(email));
            cmd.Parameters.AddWithValue("@birthday", encryptData(birthday));
            cmd.Parameters.AddWithValue("@nric", encryptData(nric));

           



            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();

        }
        catch (SqlException ex)
        {
            throw new Exception(ex.ToString());
        }

    }



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




        int sendback = Convert.ToInt32(Encoding.UTF8.GetString(cipherText));








        return sendback;
    }


}