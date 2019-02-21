using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using NUnit.Framework;

namespace Web_BasedChatApplication.Tests
{
    [TestFixture]
    public class FunctionTest: WBCATesting
    {
      
        [Test]
        public void testValidLogin()
        {
            driver.Url = "http://localhost:1553/Account/Login";
            driver.FindElement(By.Id("userName")).SendKeys("Kanhaiya");
            driver.FindElement(By.Id("password")).SendKeys(("123"));
            driver.FindElement(By.Id("Button1")).Click();
            Console.WriteLine("Login Success");
        }
        [Test]
        public void testInvalidLogin()
        {
            driver.Url = "http://localhost:1553/Account/Login";
            driver.FindElement(By.Id("userName")).SendKeys("");
            driver.FindElement(By.Id("password")).SendKeys((""));
            driver.FindElement(By.Id("Button1")).Click();
            Console.WriteLine("Login Fail");
        }
        [Test]
        public void testValidRegister()
        {
            driver.Url = "http://localhost:1553/Account/Register";
            driver.FindElement(By.Id("userName")).SendKeys("NewUser");
            driver.FindElement(By.Id("email")).SendKeys("kyaw123@gmail.com");
            driver.FindElement(By.Id("password")).SendKeys(("123"));
            driver.FindElement(By.Id("confirmPassword")).SendKeys("123");
            driver.FindElement(By.Id("phone")).SendKeys("1234");
            driver.FindElement(By.Id("Button1")).Click();
            Console.WriteLine("Register Success");
        }
        [Test]
        public void testInvalidRegister()
        {
            driver.Url = "http://localhost:1553/Account/Register";
            driver.FindElement(By.Id("userName")).SendKeys("");
            driver.FindElement(By.Id("email")).SendKeys("");
            driver.FindElement(By.Id("password")).SendKeys((""));
            driver.FindElement(By.Id("confirmPassword")).SendKeys("");
            driver.FindElement(By.Id("phone")).SendKeys("");
            driver.FindElement(By.Id("Button1")).Click();
            Console.WriteLine("Register Fail");
        }
        [Test]
        public void testValidSendRequest()
        {
            driver.Url = "http://localhost:1553/addfriend";
            driver.FindElement(By.Id("MainContent_txtSearch")).SendKeys("Kanhaiya");
            driver.FindElement(By.Id("MainContent_btnSearch")).Click();
            Console.WriteLine("Search Successful");
        }
        [Test]
        public void testInvalidSendRequest()
        {
            driver.Url = "http://localhost:1553/addfriend";
            driver.FindElement(By.Id("MainContent_txtSearch")).SendKeys("");
            driver.FindElement(By.Id("MainContent_btnSearch")).Click();
            Console.WriteLine("Search Fail");
        }

    }
}
