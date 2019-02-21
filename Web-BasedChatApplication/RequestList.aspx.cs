using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_BasedChatApplication
{
    public partial class RequestList : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=kANAIYAARYA2F15\KANAIYA;Initial Catalog=Web-BasedChatApplication(WBCA);Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count == 0)
            {
                dvempty.Visible = true;

            }
        }
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            //IDMail is friend
            Label lbUserName = (Label)GridView2.Rows[0].FindControl("LabelUserName");
            Label lbFriendName = (Label)GridView2.Rows[0].FindControl("LabelFriendName");
            string userName = Session["UserName"].ToString();
            if (lbFriendName.Text == userName)
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "insert into Friends (FriendName,UserName)" + "values (@friendName,@userName)";
                cmd.Parameters.Add("@friendName", SqlDbType.NVarChar).Value = lbUserName.Text;
                cmd.Parameters.Add("@userName", SqlDbType.NVarChar).Value = lbFriendName.Text;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            SqlCommand cmd1 = conn.CreateCommand();
            cmd1.CommandText = "update Friends set Status=1 where (UserName ='" + lbUserName.Text + "' and FriendName ='" + lbFriendName.Text + "') or (UserName ='" + lbFriendName.Text + "' and FriendName ='" + lbUserName.Text + "')";
            conn.Open();
            cmd1.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/RequestList.aspx");


        }

        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            //SqlDataSource1.DataBind();
            GridView2.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}