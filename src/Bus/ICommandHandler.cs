using System;
using System.Collections.Generic;
using System.Text;

namespace Bus
{
    public interface ICommandHandler<TCommand>
    {
        void Handle(TCommand command);                
    }
}
