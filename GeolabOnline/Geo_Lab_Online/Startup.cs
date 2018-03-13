using Microsoft.Owin;
using Owin;
using Hangfire;
using Geo_Lab_Online.Models;

[assembly: OwinStartupAttribute(typeof(Geo_Lab_Online.Startup))]
namespace Geo_Lab_Online
{

    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            GlobalConfiguration.Configuration
                .UseSqlServerStorage("GeoLabOnlinedbConnectionString");

            app.UseHangfireDashboard();
            RecurringJob.AddOrUpdate<Jobs>(j => j.DirectionMigr(), Cron.Monthly(1));
            RecurringJob.AddOrUpdate<Jobs>(j => j.CourseMigr(), Cron.Monthly(2));
            RecurringJob.AddOrUpdate<Jobs>(j => j.SubjectMigr(), Cron.Monthly(3));
            RecurringJob.AddOrUpdate<Jobs>(j => j.LectureMig(), Cron.Monthly(4));
            
            app.UseHangfireServer();
        }
    }
}
