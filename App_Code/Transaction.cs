using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Transaction
/// </summary>
public class Transaction


{
    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;
    private int id;
    private string sender;
    private string recipient;
    private double amount;
    private string date;
    private string description;

    public Transaction(int id, string sender, string recipient, double amount, string date, string description)
    {
        this.id = id;
        this.sender = sender;
        this.recipient = recipient;
        this.amount = amount;
        this.date = date;
        this.description = description;
    }

    public string Date
    {
        get { return date; }
        set { date = value; }
    }

    public int Id
    {
        get { return id; }
        set { id = value; }
    }

    public Transaction()
    {
    }

    public string ConnStr
    {
        get { return _connStr; }
        set { _connStr = value; }
    }

    public string Sender
    {
        get { return sender; }
        set { sender = value; }
    }

    public string Recipient
    {
        get { return recipient; }
        set { recipient = value; }
    }

    public double Amount
    {
        get { return amount; }
        set { amount = value; }
    }

    public string Description
    {
        get { return description; }
        set { description = value; }
    }



    public Transaction(string sender, string recipient, double amount, string description)
    {
        this.sender = sender;
        this.recipient = recipient;
        this.amount = amount;
        this.description = description;
    }

 

    public int TransactionInsert()
    {
        string msg = null;
        int result = 0;
        string queryStr =
            "INSERT INTO Transactions (sender,recipeint,amount,date,description) values(@sender,@recipent,@amount,@date,@desc)";
        //+ "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";
        try
        {
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
//            cmd.Parameters.AddWithValue("@id", getCurrentId() + 1);
            cmd.Parameters.AddWithValue("@sender", Sender);
            cmd.Parameters.AddWithValue("@recipent", Recipient);
            cmd.Parameters.AddWithValue("@amount", Amount);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd h:mm tt"));
            cmd.Parameters.AddWithValue("@desc", Description);





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

    public int getCurrentId()
    {
        int amt = 0;


        ArrayList arr = new ArrayList();


        try
        {
            string queryStr = "SELECT Id FROM Transactions";
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);


            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                amt = Convert.ToInt32(dr["Id"].ToString());


                arr.Add(amt);



            }
            conn.Close();
            dr.Close();
            dr.Dispose();

            if (arr.Count > 0)
            {
                ArrayList sort = arr;
                sort.Sort();

                int latest = (int) sort[sort.Count - 1];


                return latest;
            }
            else
            {
                return 0;
            }




        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }
    }


    protected List<Transaction> getAllData()
    {
        int id;
        string sender;
        string recipient;
        double amount;
        string date;
        string desc;


      
            List<Transaction> dataaa = new List<Transaction>();
            

            string queryStr = "SELECT * FROM Customer";
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Continue to read the resultsets row by row if not the end

            while (dr.Read())
            {
                id = Convert.ToInt32(dr["Id"].ToString());
                sender = dr["sender"].ToString();
                recipient = dr["recipeint"].ToString();
                amount = Convert.ToDouble(dr["amount"].ToString());
                date = dr["date"].ToString();
                desc = dr["description"].ToString();
                
                
                Transaction cfsd = new Transaction(id,sender,recipient,amount,date,desc);
                dataaa.Add(cfsd);




            }
            conn.Close();
            dr.Close();
            dr.Dispose();
            return dataaa;
        
}



    protected List<Transaction> getAllDataBySender(string username)
    {
        int id;
        string sender;
        string recipient;
        double amount;
        string date;
        string desc;



        List<Transaction> dataaa = new List<Transaction>();


        string queryStr = "SELECT * FROM Customer where sender=@sender";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@sender", username);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //Continue to read the resultsets row by row if not the end

        while (dr.Read())
        {
            id = Convert.ToInt32(dr["Id"].ToString());
            sender = dr["sender"].ToString();
            recipient = dr["recipeint"].ToString();
            amount = Convert.ToDouble(dr["amount"].ToString());
            date = dr["date"].ToString();
            desc = dr["description"].ToString();


            Transaction cfsd = new Transaction(id, sender, recipient, amount, date, desc);
            dataaa.Add(cfsd);




        }
        conn.Close();
        dr.Close();
        dr.Dispose();
        return dataaa;

    }
}
    