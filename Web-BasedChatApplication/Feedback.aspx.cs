using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_BasedChatApplication
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DBAcme DB = (DBAcme)Session["DB"];
            int numrrow = DB.InsertFeedback(name.Text, email.Text, subject.Text, message.Text);
            lblmessage.Text = "Thank you for your feedback!";
            name.Text = "";
            email.Text = "";
            subject.Text = "";
            message.Text = "";
        }
    }
}