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

    
    private string username;
    private string passwordhash;
    private string passwordsalt;
    private string phoneNo;
    private string address;
    private string firstName;
    private string lastname;
    private string email;
    private string age;
    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;

    public UserCustomer()
    {
        //
        // TODO: Add constructor logic here

    }


    public UserCustomer(string username, string passwordhash, string passwordsalt, string phoneNo, string address, string firstName, string lastname, string email, string age)
    {
        
        this.username = username;
        this.passwordhash = passwordhash;
        this.passwordsalt = passwordsalt;
        this.phoneNo = phoneNo;
        this.address = address;
        this.firstName = firstName;
        this.lastname = lastname;
        this.email = email;
        this.age = age;
    }


    public string Username
    {
        get
        {
            return username;
        }

        set
        {
            username = value;
        }
    }

    public string Passwordhash
    {
        get
        {
            return passwordhash;
        }

        set
        {
            passwordhash = value;
        }
    }

    public string Passwordsalt
    {
        get
        {
            return passwordsalt;
        }

        set
        {
            passwordsalt = value;
        }
    }

    public string PhoneNo
    {
        get
        {
            return phoneNo;
        }

        set
        {
            phoneNo = value;
        }
    }

    public string Address
    {
        get
        {
            return address;
        }

        set
        {
            address = value;
        }
    }

    public string FirstName
    {
        get
        {
            return firstName;
        }

        set
        {
            firstName = value;
        }
    }

    public string Lastname
    {
        get
        {
            return lastname;
        }

        set
        {
            lastname = value;
        }
    }

    public string Email
    {
        get
        {
            return email;
        }

        set
        {
            email = value;
        }
    }





    public int customerInsert()
    {
        string msg = null;
        int result = 0;
        string queryStr = "INSERT INTO Products(username,passwordhash,passwordsalt,phoneNo,address,firstName,lastName,email,age)" + "values (@username,@passwordhash,@passwordsalt,@phoneNo,@address,@firstName,@lastname,@email,@age)";
        //+ "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@username", this.username);
            cmd.Parameters.AddWithValue("@passwordhash", this.passwordhash);
            cmd.Parameters.AddWithValue("@passwordsalt", this.passwordsalt);
            cmd.Parameters.AddWithValue("@phoneNo", this.phoneNo);
            cmd.Parameters.AddWithValue("@address", this.address);
            cmd.Parameters.AddWithValue("@firstName", this.firstName);
            cmd.Parameters.AddWithValue("@lastname", this.firstName);
            cmd.Parameters.AddWithValue("@email", this.firstName);
            cmd.Parameters.AddWithValue("@age", this.age);

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