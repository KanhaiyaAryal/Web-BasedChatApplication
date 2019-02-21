using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Web_BasedChatApplication.Startup))]
namespace Web_BasedChatApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
