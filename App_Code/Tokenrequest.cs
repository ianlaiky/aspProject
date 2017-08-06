using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for Tokenrequest
/// </summary>
public class Tokenrequest
{
    private string username;
    private string address;

    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;


    public Tokenrequest(string username, string address)
    {
        this.username = username;
        this.address = address;
    }

    public string Username
    {
        get { return username; }
        set { username = value; }
    }

    public string Address
    {
        get { return address; }
        set { address = value; }
    }

    public Tokenrequest()
    {
      
    }


    public int TokenInsert(string user, string add)
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "INSERT INTO Tokenrequest(username,address)" +
            "values (@username,@address)";
       
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@username", user);
            cmd.Parameters.AddWithValue("@address", add);
           


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



    public List<Tokenrequest> getAllUserName()
    {
        List<Tokenrequest> dataa = new List<Tokenrequest>();
      

        string queryStr = "SELECT * FROM Tokenrequest";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end

        while (dr.Read())
        {
            string usernamee = dr["username"].ToString();
            string addresss = dr["address"].ToString();

            Tokenrequest daa = new Tokenrequest(usernamee, addresss);

            dataa.Add(daa);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return dataa;
    }


}
