using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_BasedChatApplication.App_Start;

namespace Web_BasedChatApplication.Account
{
    public partial class Login : System.Web.UI.Page
    {
        CryptionData cryptionData = new CryptionData();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBAcme DB = (DBAcme)Session["DB"];
            string user = userName.Text;
            string Password = cryptionData.Encrypt(password.Text);
            string newPass = password.Text;
            Boolean flag = DB.GetUser(user, Password);
            if (flag)
            {
                Session["UserName"] = user;
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "Data has been saved", true);

                if (user.Equals("admin") && newPass.Equals("123"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Success')</script>");
                    Response.Redirect("~/ManageUser.aspx");

                }
                else
                {

                    Response.Redirect("~/default.aspx");
                }

            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Fail')</script>");
        }
    }
}