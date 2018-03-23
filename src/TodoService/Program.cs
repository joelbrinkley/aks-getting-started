using Autofac;
using Bus;
using System;
using System.Threading;
using TodoMessages;

namespace TodoService
{
    class Program
    {
        static ManualResetEvent shutdown = new ManualResetEvent(false);

        static void Main(string[] args)
        {
            var container = Bootstrapper.Run();
            
            var commandBus = container.Resolve<ICommandBus>();
            var createToDoHandler = container.Resolve<CreateTodoCommandHandler>();

            commandBus.Connect();

            commandBus.Handle(CreateTodo.Namespace, createToDoHandler);

            shutdown.WaitOne();
        }
    }
}