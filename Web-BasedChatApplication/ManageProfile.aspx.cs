using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_BasedChatApplication
{
    public partial class ManageProfile : System.Web.UI.Page
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
                UserName.Text = reader["UserName"].ToString();
                email.Text = reader["Email"].ToString();
                phone.Text = reader["Phone"].ToString();
            }
            conn.Close();
            setFalse();


        }

        private void setFalse()
        {
            UserName.Enabled = false;            
            email.Enabled = false;
            phone.Enabled = false;
            update.Visible = false;
        }
        private void setTrue()
        {
            UserName.Enabled = true;
            email.Enabled = true;
            phone.Enabled = true;
            update.Visible = true;
            edit.Visible = false;
        }
        protected void Edit_Click(object sender, EventArgs e)
        {
            setTrue();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            SqlCommand cmd1 = conn.CreateCommand();
            cmd1.CommandText = "update Register set UserName='" + UserName.Text + "', Email='" + email.Text + "', Phone='" + phone.Text + "' where UserName='" + UserName.Text + "'";
            conn.Open();
            cmd1.ExecuteNonQuery();
            message.Text = "Account Updated!";
            setFalse();
            edit.Visible = true;
        }
    }
}