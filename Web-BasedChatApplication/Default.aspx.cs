using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_BasedChatApplication
{
    public partial class _Default : Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=kANAIYAARYA2F15\KANAIYA;Initial Catalog=Web-BasedChatApplication(WBCA);Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand com;
            string str;
            str = "select * from Register where UserName='" + Session["UserName"] + "'";
            com = new SqlCommand(str, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();

            if (reader.Read())
            {
                
                txtUserName.Text = reader["UserName"].ToString();
                txtEmail.Text = reader["Email"].ToString();
                txtPhone.Text = reader["Phone"].ToString();
            }
            conn.Close();
        }
    }
}