using Bus;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bus
{
    public class MessageSerializer : IBusSerializer
    {
        public byte[] SerializeObject<TMessage>(TMessage message)
        {
            var json = JsonConvert.SerializeObject(message);
            return Encoding.UTF8.GetBytes(json);
        }
        public T DeserializeObject<T>(byte[] messageData)
        {
            var json = Encoding.UTF8.GetString(messageData);
            var obj = JsonConvert.DeserializeObject<T>(json);

            return obj;
        }
    }
}
