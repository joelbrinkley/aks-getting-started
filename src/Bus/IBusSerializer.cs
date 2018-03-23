using System;
using System.Collections.Generic;
using System.Text;

namespace Bus
{
    public interface IBusSerializer
    {
        byte[] SerializeObject<TMessage>(TMessage message);
        T DeserializeObject<T>(byte[] messageData);
    }
}
