using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_BasedChatApplication.App_Start;

namespace Web_BasedChatApplication.Account
{
    public partial class Register : System.Web.UI.Page
    {
        CryptionData cryptData = new CryptionData();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DBAcme DB = (DBAcme)Session["DB"];

            string txtUserName = userName.Text;
            string pass = cryptData.Encrypt(password.Text);
            string conPassword = cryptData.Encrypt(confirmPassword.Text);
            string mail = email.Text;
            string Phone = phone.Text;
            int numrow = DB.InsertUser(mail, txtUserName, pass, conPassword, Phone);
            Response.Redirect("/Account/Login");
            Session["reg"] = "Registered";

        }
        /*private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }*/
    }
}