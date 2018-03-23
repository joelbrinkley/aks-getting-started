using Bus;
using System;
using System.Collections.Generic;
using System.Text;

namespace TodoService
{
    public class ConsoleLogger : ILog, IBusLog
    {
        public void Error(string message)
        {
            Console.WriteLine(message);
        }

        public void Information(string message)
        {
            Console.WriteLine(message);
        }
    }
}
