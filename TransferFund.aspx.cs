using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;using System.Configuration;

public partial class TransferFund : System.Web.UI.Page
{
    string _connStr = ConfigurationManager.ConnectionStrings["FanclubContext"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string name = tbName.Text.Trim();

            double amt = Convert.ToDouble(tbAmt.Text.Trim());
            string des = tbDes.Text.Trim();
        
            Fund f = new Fund();
            f.chaosTransfer(Session["usernameLogin"].ToString(), name, amt, des);


            Label2.Text = "Successful transfered";
        }
        catch (Exception exception)
        {
           throw new Exception(exception.ToString());
        }

    }
}