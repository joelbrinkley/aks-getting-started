using System;

namespace Bus
{
    public interface ICommandBus
    {
        void Connect();
        void Disconnect();
        void Send<TCommand>(string name, TCommand command);
        void Handle<TCommand>(string name, ICommandHandler<TCommand> command);
        TResponse RequestReply<TCommand, TResponse>(string name, TCommand command);
    }
}
