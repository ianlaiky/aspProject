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
    //Private string _connStr = Properties.Settings.Default.DBConnStr;
    //System.Configuration.ConnectionStringSettings _connStr;
    string _connStr =
   ConfigurationManager.ConnectionStrings["HealthDBContext"].ConnectionString;
    private string _name = null;
    private string _email = string.Empty;
    private string _accountNo = ""; // this is another way to specify empty string
    private decimal _bal = 0;
    // Default constructor
    public Fund()
    {
    }
    // Constructor that take in all data required to build a Product object
    public Fund(string name, string accountNo, string email, decimal bal)
    {
        _name = name;
        _email = email;
        _accountNo = accountNo;
        _bal = bal;
    }
    // Constructor that take in all except product ID
    public Fund(string accountNo, string email,
    decimal bal)
 : this(null, accountNo, email, bal)
    {
    }


    // Constructor that take in only Product ID. The other attributes will be set to 0 or
    public Fund(string name)
    : this(name, "", "", 0)
    {
    }
    // Get/Set the attributes of the Product object.
    // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
    // This is for ease of referencing.
    public string name
    {
        get { return name; }
        set { _name = value; }
    }
    public string accountNo
    {
        get { return _accountNo; }
        set { _accountNo = value; }
    }
    public string email
    {
        get { return _email; }
        set { _email = value; }
    }
    public decimal bal
    {
        get { return _bal; }
        set { _bal = value; }
    }


    public List<Fund> getFundAll()
    {
        List<Fund> fundList = new List<Fund>();
        string name, accountNo, email;
        decimal bal;
        string queryStr = "SELECT * FROM Account Order By username";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            name = dr["username"].ToString();
            accountNo = dr["accountNo"].ToString();
            email = dr["email"].ToString();
            bal = decimal.Parse(dr["balance"].ToString());
            Fund a = new Fund(name, accountNo, email, bal);
            fundList.Add(a);
        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return fundList;
    }
   
    public int FundInsert()
    {
        int result = 0;
        string queryStr = "INSERT INTO Account(username,accountNo, balance)"
    + "values (@name, @accountNo, @bal)";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@name", this.name);
        cmd.Parameters.AddWithValue("@accountNo", this.accountNo);
        cmd.Parameters.AddWithValue("@bal", this.bal);
        conn.Open();
        result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
        conn.Close();
        return result;
    }
}