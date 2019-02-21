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
    public partial class ChatForm : System.Web.UI.Page
    {
        SqlConnection sqlconn = new SqlConnection(@"Data Source=kANAIYAARYA2F15\KANAIYA;Initial Catalog=Web-BasedChatApplication(WBCA);Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Text = Session["UserName"].ToString();

        }
        protected void UsernameLabel_Click(object sender, EventArgs e)
        {

            friendName.Text = Server.HtmlEncode(((LinkButton)sender).Text);
            LoadMessage();

        }
        protected void LoadMessage()
        {
            SqlCommand sqlcmd;
            DataSet ds = new DataSet();
            string strCmd = "select Message,Sender,Receiver,SendDate from MessageTable where (sender = @sender and receiver = @receiver) or (sender = @newReceiver and receiver = @newSender) order by ChatID";
            sqlcmd = new SqlCommand(strCmd, sqlconn);
            sqlcmd.Parameters.AddWithValue("@sender", Server.HtmlEncode(Session["UserName"].ToString()));
            sqlcmd.Parameters.AddWithValue("@receiver", Server.HtmlEncode(friendName.Text));
            sqlcmd.Parameters.AddWithValue("@newReceiver", Server.HtmlEncode(friendName.Text));
            sqlcmd.Parameters.AddWithValue("@newSender", Server.HtmlEncode(Session["UserName"].ToString()));
            sqlconn.Open();

            /*SqlDataReader reader = sqlcmd.ExecuteReader();
            string message,sender,receiver;
            DataRow dr = null;
            if (reader.Read())
            {
                message = reader["Message"].ToString();
                sender= reader["Sender"].ToString();
                receiver = reader["Receiver"].ToString();
                if (sender == Session["UserName"].ToString())
                {
                    dt.Columns.Add(new DataColumn("showUser",typeof(String)));
                    dr = dt.NewRow();
                    dr["showUser"] = sender;
                    dt.Rows.Add(dr);
                    DataList2.DataSource = dt;
                    DataList2.DataBind();
                    ds.Tables.Add(sender);
                }
            }
            sqlconn.Close();
            
            sqlconn.Open();*/
            SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcmd);
            sqlDA.Fill(ds);
            DataList2.DataSource = ds.Tables[0];
            DataList2.DataBind();
            sqlconn.Close();

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Server.HtmlEncode(MessageBox.Text)))
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Please! Enter Message'); ", true);
                return;
            }
            if (string.IsNullOrWhiteSpace(Server.HtmlEncode(friendName.Text)))
            {
                Response.Redirect("~/ChatMessage.aspx");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Select Recevier'); ", true);

            }
            DBAcme DB = (DBAcme)Session["DB"];
            Label userName = new Label();
            userName.Text = Session["UserName"].ToString();
            string chatMessage = MessageBox.Text;
            DateTime sendTime = DateTime.Now;
            int numrow = DB.InsertMessage(chatMessage, userName.Text, friendName.Text, sendTime);
            MessageBox.Text = "";
            //Response.Redirect(Request.Url.AbsoluteUri);

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DataListItem friendList = (DataListItem).NamingContainer;
            // Label firstlb = (Label)friendList.FindControl("FirstNameLabel");
            //Label fir = (Label).Equals(Session["UserName"]);
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {


        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SqlCommand sqlcmd1;
            DataSet ds1 = new DataSet();
            string strCmd1 = "select Message,Sender,Receiver,SendDate from MessageTable where (sender = @sender and receiver = @receiver) or (sender = @newReceiver and receiver = @newSender) order by ChatID";
            sqlcmd1 = new SqlCommand(strCmd1, sqlconn);
            sqlcmd1.Parameters.AddWithValue("@sender", Server.HtmlEncode(Session["UserName"].ToString()));
            sqlcmd1.Parameters.AddWithValue("@receiver", Server.HtmlEncode(friendName.Text));
            sqlcmd1.Parameters.AddWithValue("@newReceiver", Server.HtmlEncode(friendName.Text));
            sqlcmd1.Parameters.AddWithValue("@newSender", Server.HtmlEncode(Session["UserName"].ToString()));
            sqlconn.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter(sqlcmd1);
            sqlDA.Fill(ds1);
            DataList2.DataSource = ds1.Tables[0];
            DataList2.DataBind();
            sqlconn.Close();
        }
    }
}