using System;
using System.Collections.Generic;
using System.Text;

namespace Bus
{
    public interface IBusLog
    {
        void Error(string message);
        void Information(string message);
    }
}
