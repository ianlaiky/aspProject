using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


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

    public int FundInsert()
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






    public void setNewFund(string user)
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "Update Account set balance=@bal where username=@user";
          
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@username", user);
          
            cmd.Parameters.AddWithValue("@bal", Bal);



            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();
          
        }
        catch (SqlException ex)
        {
            throw new Exception(ex.ToString());
        }

    }

//    public double getCurrentFund(string username)
//    {
//        
//
//    }



}