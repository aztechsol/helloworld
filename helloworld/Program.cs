using Serilog;
using Prometheus;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // remove default logging providers
            builder.Logging.ClearProviders();

            // Serilog configuration and register      
            var logger = new LoggerConfiguration().WriteTo.Console().CreateLogger();
            builder.Logging.AddSerilog(logger);

            builder.WebHost.ConfigureKestrel(serverOptions => {
                serverOptions.ListenAnyIP(5005);
            });

            var app = builder.Build();

            // expose prometheus at /metrics and add a demo counter
            app.UseMetricServer();
            var counter = Metrics.CreateCounter("helloworld_counter", "HelloWorld get counter");

            // nothing fancy just use a minimal api with logging and export a prom counter metric
            app.MapGet("/", () => {
                counter.Inc();          // demo custom counter
                return "Hello World!";  // requests here will be logged by serilog to be picked up by k8s later
            });

            app.Run();
        }
    }
}