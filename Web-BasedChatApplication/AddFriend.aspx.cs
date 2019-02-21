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
    public partial class AddFriend : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=kANAIYAARYA2F15\KANAIYA;Initial Catalog=Web-BasedChatApplication(WBCA);Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand sqlcmd = conn.CreateCommand();
            sqlcmd.CommandText = "select FriendName,UserName from Friends where FriendName=@friendName and UserName=@userName";
        }
        protected void BtnAddFriend_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Server.HtmlEncode(txtSearch.Text)))
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Please Enter Name!'); ", true);
                return;
            }
            else
            {

                msg.Text = "Successfull";
                Button add = (Button)sender;
                DataListItem friendList = (DataListItem)add.NamingContainer;

                Label lbFriendName = (Label)friendList.FindControl("FriendNameLabel");
                Label lbUserName = new Label();
                lbUserName.Text = Session["UserName"].ToString();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "insert into Friends (FriendName,UserName)" + "values (@friendName,@userName)";
                cmd.Parameters.Add("@friendName", SqlDbType.NVarChar).Value = lbFriendName.Text;
                cmd.Parameters.Add("@userName", SqlDbType.NVarChar).Value = lbUserName.Text;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }


        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}