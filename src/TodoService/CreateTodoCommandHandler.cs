using Bus;
using System;
using System.Collections.Generic;
using System.Text;
using TodoMessages;

namespace TodoService
{
    public class CreateTodoCommandHandler : ICommandHandler<CreateTodo>
    {
        private readonly ILog log;

        public CreateTodoCommandHandler(ILog log)
        {
            this.log = log;
        }

        public void Handle(CreateTodo command)
        {
            this.log.Information($"Processing create todo command: {command.Name}, {command.Description}");
        }
    }
}
