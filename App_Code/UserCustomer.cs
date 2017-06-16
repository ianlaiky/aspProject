using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for UserCustomer
/// </summary>
public class UserCustomer
{
    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;

    public UserCustomer()
    {
        //
        // TODO: Add constructor logic here
    }


    public UserCustomer(string username, string passwordhash, string passwordsalt, string phoneNo, string address,
        string firstName, string lastName, string email, string birthday, string emailVerified, string phoneVerified,
        string nric)
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
    }

    public string Username { get; set; }

    public string Passwordhash { get; set; }

    public string Passwordsalt { get; set; }

    public string PhoneNo { get; set; }

    public string Address { get; set; }

    public string FirstName { get; set; }

    public string LastName { get; set; }

    public string Email { get; set; }

    public string Birthday { get; set; }

    public string EmailVerified { get; set; }

    public string PhoneVerified { get; set; }

    public string Nric { get; set; }


    public int CustomerInsert()
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "INSERT INTO Customer(username,passwordhash,passwordsalt,phoneNo,address,firstName,lastName,email,birthday,emailVerified,phoneVerified,nric)" +
            "values (@username,@passwordhash,@passwordsalt,@phoneNo,@address,@firstName,@lastname,@email,@birthday,@emailVerified,@phoneVerified,@nric)";
        //+ "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@username", Username);
            cmd.Parameters.AddWithValue("@passwordhash", Passwordhash);
            cmd.Parameters.AddWithValue("@passwordsalt", Passwordsalt);
            cmd.Parameters.AddWithValue("@phoneNo", PhoneNo);
            cmd.Parameters.AddWithValue("@address", Address);
            cmd.Parameters.AddWithValue("@firstName", FirstName);
            cmd.Parameters.AddWithValue("@lastname", LastName);
            cmd.Parameters.AddWithValue("@email", Email);
            cmd.Parameters.AddWithValue("@birthday", Birthday);
            cmd.Parameters.AddWithValue("@emailVerified", EmailVerified);
            cmd.Parameters.AddWithValue("@phoneVerified", PhoneVerified);
            cmd.Parameters.AddWithValue("@nric", Nric);


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
            username = dr["username"].ToString();

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
            username = dr["nric"].ToString();

            names.Add(username);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return names;
    }

    public UserCustomer getAllDataByName(string name)
    {
        UserCustomer cus = null;
      
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
            nric;

        string queryStr = "SELECT* FROM Customer WHERE username = @username";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@username", name);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            username = dr["username"].ToString();
            passwordhash = dr["passwordhash"].ToString();
            passwordsalt = dr["passwordsalt"].ToString();
            phoneNo = dr["phoneNo"].ToString();
            address = dr["address"].ToString();
            firstName = dr["firstName"].ToString();
            lastName = dr["lastName"].ToString();
            email = dr["email"].ToString();
            birthday = dr["birthday"].ToString();
            emailverified = dr["emailVerified"].ToString();
            phoneverified = dr["phoneVerified"].ToString();
            nric = dr["nric"].ToString();

            cus = new UserCustomer(username,passwordhash,passwordsalt,phoneNo,address,firstName,lastName,email,birthday,emailverified,phoneverified,nric);
        

            
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
}