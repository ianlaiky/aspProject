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

    
    private string _username;
    private string _passwordhash;
    private string _passwordsalt;
    private string _phoneNo;
    private string _address;
    private string _firstName;
    private string _lastName;
    private string _email;
    private string _age;
    private string _nric;
    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;

    public UserCustomer()
    {
        //
        // TODO: Add constructor logic here

    }


    public UserCustomer(string username, string passwordhash, string passwordsalt, string phoneNo, string address, string firstName, string lastname, string email, string age, string nric)
    {

        this.Username = username;
        this.Passwordhash = passwordhash;
        this.Passwordsalt = passwordsalt;
        this.PhoneNo = phoneNo;
        this.Address = address;
        this.FirstName = firstName;
        this.LastName = lastname;
        this.Email = email;
        this.Age = age;
        this.Nric = nric;
    }

    public string Username
    {
        get
        {
            return _username;
        }

        set
        {
            _username = value;
        }
    }

    public string Passwordhash
    {
        get
        {
            return _passwordhash;
        }

        set
        {
            _passwordhash = value;
        }
    }

    public string Passwordsalt
    {
        get
        {
            return _passwordsalt;
        }

        set
        {
            _passwordsalt = value;
        }
    }

    public string PhoneNo
    {
        get
        {
            return _phoneNo;
        }

        set
        {
            _phoneNo = value;
        }
    }

    public string Address
    {
        get
        {
            return _address;
        }

        set
        {
            _address = value;
        }
    }

    public string FirstName
    {
        get
        {
            return _firstName;
        }

        set
        {
            _firstName = value;
        }
    }

    public string LastName
    {
        get
        {
            return _lastName;
        }

        set
        {
            _lastName = value;
        }
    }

    public string Email
    {
        get
        {
            return _email;
        }

        set
        {
            _email = value;
        }
    }

    public string Age
    {
        get
        {
            return _age;
        }

        set
        {
            _age = value;
        }
    }

    public string Nric
    {
        get
        {
            return _nric;
        }

        set
        {
            _nric = value;
        }
    }

   

   

    public int CustomerInsert()
    {
        string msg = null;
        int result = 0;
        string queryStr = "INSERT INTO Products(username,passwordhash,passwordsalt,phoneNo,address,firstName,lastName,email,age,nric)" + "values (@username,@passwordhash,@passwordsalt,@phoneNo,@address,@firstName,@lastname,@email,@age,@nric)";
        //+ "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@username", this.Username);
            cmd.Parameters.AddWithValue("@passwordhash", this.Passwordhash);
            cmd.Parameters.AddWithValue("@passwordsalt", this.Passwordsalt);
            cmd.Parameters.AddWithValue("@phoneNo", this.PhoneNo);
            cmd.Parameters.AddWithValue("@address", this.Address);
            cmd.Parameters.AddWithValue("@firstName", this.FirstName);
            cmd.Parameters.AddWithValue("@lastname", this.LastName);
            cmd.Parameters.AddWithValue("@email", this.Email);
            cmd.Parameters.AddWithValue("@age", this.Age);
            cmd.Parameters.AddWithValue("@nric", this.Nric);

            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
            return result;
        }
        catch (SqlException ex)
        {
            return 0;
        }
    }//end Insert



}