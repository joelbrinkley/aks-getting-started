using Autofac;
using Bus;
using System;
using System.Collections.Generic;
using System.Text;

namespace TodoService
{
    public static class Bootstrapper
    {
        public static IContainer Run()
        {
            var builder = new ContainerBuilder();

            builder.RegisterType<MessageSerializer>().As<IBusSerializer>();

            builder.RegisterType<CommandBus>().As<ICommandBus>().WithParameter("natsConnectionString", Config.NATS_CONNECTION);

            builder.RegisterType<ConsoleLogger>().AsImplementedInterfaces();

            builder.RegisterType<CreateTodoCommandHandler>().AsSelf().AsImplementedInterfaces();
            
            return builder.Build();
        }
    }
}
