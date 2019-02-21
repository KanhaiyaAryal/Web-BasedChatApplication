using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using OpenQA.Selenium.Chrome;

namespace Web_BasedChatApplication.Tests
{
    public class WBCATesting
    {     
            protected IWebDriver driver;
            [SetUp]
            public void Setup()
            {
                driver = new ChromeDriver(@"C:\chromedriver");
                driver.Manage().Window.Maximize();
                //driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(50));
            }
            [TearDown]
            public void Cleanup()
            {
                driver.Quit();
            }
        
    }
}
