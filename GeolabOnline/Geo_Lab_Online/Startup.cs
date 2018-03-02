using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Geo_Lab_Online.Startup))]
namespace Geo_Lab_Online
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
