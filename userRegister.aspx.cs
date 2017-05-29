using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Attributes.Add("onClick", "GeneratePwd();");
    }

  
    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {


            //String a = TextBox1.Text;
            //String c = Text1.Value.ToString();



            //System.Diagnostics.Debug.WriteLine("testing 1 " + a);
            //System.Diagnostics.Debug.WriteLine("testing 1 " + c);

            System.Diagnostics.Debug.WriteLine("testing");

            System.Diagnostics.Debug.WriteLine(TextBox1.Text);


        }
    }
}