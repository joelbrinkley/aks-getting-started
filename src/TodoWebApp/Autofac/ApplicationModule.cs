using Autofac;
using Bus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TodoWebApp.Logging;

namespace TodoWebApp.Autofac
{
    public class ApplicationModule : Module
    {
        private readonly string natsConnection;

        public ApplicationModule(string natsConnection)
        {
            this.natsConnection = natsConnection;
        }

        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<CommandBus>().As<ICommandBus>().WithParameter("natsConnectionString", natsConnection);
            builder.RegisterType<ConsoleLogger>().AsImplementedInterfaces();
            builder.RegisterType<MessageSerializer>().AsImplementedInterfaces();
        }

    }
}
