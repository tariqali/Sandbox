using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        reverseResult.InnerHtml = reverseString(strReverse.Value);
    }

    private string reverseString(string p)
    {
        StringBuilder sb = new StringBuilder();
        for (int i = p.Length-1; i >= 0; i--)
        {
            sb.Append(p[i]);
        }
        return sb.ToString();
    }

    protected void PopulateDDL(object sender, EventArgs e)
    {
        using (SqlConnection sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdventureWorksConnection"].ConnectionString))
        {
            using (SqlCommand sqc = new SqlCommand("select top 10 BusinessEntityID, LastName from Person.Person order by BusinessEntityID"))
            {
                sqc.Connection = sConn;
                sConn.Open();
                using (SqlDataReader sqr = sqc.ExecuteReader())
                {
                    if (sqr.HasRows)
                    {
                        while (sqr.Read())
                        {
                            ddlContacts.Items.Add(new ListItem(sqr["LastName"].ToString(), sqr["BusinessEntityID"].ToString()));
                        }
                    }
                }
            }
        }
    }
}
