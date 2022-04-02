using System;
using System.Net;
using System.Net.Http;
using Flurl;
using Flurl.Http;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace weather_api
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGet("/", async context =>
                {
                    await context.Response.WriteAsync("Hello World!");
                });

                endpoints.MapGet("/health", async context =>
                {
                    context.Response.ContentType = "application/json; charset=utf-8";
                    string json = "{\"status\":\"200\"}";
                    Console.WriteLine("health check from weather api");
                    await context.Response.WriteAsync(json);
                });

                endpoints.MapGet("/latest", async context =>
                {

                    string url = "https://restapi.amap.com/v3/weather/weatherInfo?city=310112&key=951e2df1b1d11de910eacd470e7f41ef";
                    var response = await url
                                 .GetStringAsync();
                    context.Response.ContentType = "application/json; charset=utf-8";
                    await context.Response.WriteAsync(response);
                });
            });
        }
    }
}
