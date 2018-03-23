using Bus;
using System;

namespace TodoMessages
{
    public class CreateTodo : ICommand
    {
        public CreateTodo(string name, string description)
        {
            Name = name;
            Description = description;
        }

        public string Name { get; }
        public string Description { get; }
        public static string Namespace => "Todo.CreateTodo";
    }
}
