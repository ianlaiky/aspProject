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
//        string name = tbName.Text.Trim();
//        string accountNo = tbAcctNo.Text.Trim();
//        string email = tbEmail.Text.Trim();
//        string bal = tbBal.Text.Trim();



    }
}