using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class TransferFund : System.Web.UI.Page
{
    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = tbName.Text.Trim();
        string accountNo = tbAcctNo.Text.Trim();
        string email = tbEmail.Text.Trim();
        string bal = tbBal.Text.Trim();

        try
        {
            using (SqlConnection con = new SqlConnection()) // parameterized queries handles sql injections!!
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Account VALUES(@name,@email,@accountNo,@bal)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {

                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@accountNo", accountNo);
                        cmd.Parameters.AddWithValue("@bal", bal);

                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }



        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }

    }
}