using System;
using System.Collections.Generic;
using System.Text;

namespace TodoService
{
    public class Config
    {
      

        public static string NATS_CONNECTION
        {
            get
            {
                return Environment.GetEnvironmentVariable("NATS_CONNECTION");
            }
        }       
    }
}
