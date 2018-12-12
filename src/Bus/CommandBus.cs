using System;
using System.Collections.Generic;
using System.Text;
using NATS.Client;

namespace Bus
{
    public class CommandBus : ICommandBus
    {
        private readonly string natsConnectionString;
        private readonly IBusLog log;
        private readonly IBusSerializer serializer;
        private IConnection connection;
        private List<IAsyncSubscription> subscriptions;

        public CommandBus(string natsConnectionString, IBusLog log, IBusSerializer serializer)
        {
            log.Information($"Using natsconnection string: {natsConnectionString}");
            this.natsConnectionString = natsConnectionString;
            this.log = log;
            this.serializer = serializer;
            this.subscriptions = new List<IAsyncSubscription>();
        }

        public void Handle<TCommand>(string name, ICommandHandler<TCommand> commandHandler)
        {
            this.log.Information($"Starting subscription for command handler {typeof(TCommand).ToString()}");

            var subscription = connection.SubscribeAsync(name, "${name}.Handle.Queue");

            subscription.MessageHandler += (sender, args) =>
            {
                var command = serializer.DeserializeObject<TCommand>(args.Message.Data);

                commandHandler.Handle(command);

                if (!string.IsNullOrEmpty(args.Message.Reply))
                {
                    Msg replyMsg = new Msg(args.Message.Reply);

                    replyMsg.Data = this.serializer.SerializeObject(new { response = $"Processed {Encoding.UTF8.GetString(args.Message.Data)}" });

                    this.connection.Publish(replyMsg);

                    connection.Flush();
                }
            };

            subscription.Start();
            subscriptions.Add(subscription);
        }

        public void Connect()
        {
            connection = new ConnectionFactory().CreateConnection(this.natsConnectionString);

            this.log.Information($"Command Bus connected to {this.natsConnectionString}");
        }

        public void Disconnect()
        {
            this.subscriptions.ForEach(x => x.Unsubscribe());

            if (connection != null)
            {
                this.connection.Close();

                this.connection = null;

                this.log.Information("Closed the event processor nats connection.");
            }
        }

        public void Send<TCommand>(string name, TCommand command)
        {
            using(var connection = new ConnectionFactory().CreateConnection(natsConnectionString))
            {
                try
                {
                    var msg = serializer.SerializeObject(command);

                    connection.Publish(name, msg);

                    this.log.Information($"Message sent: {name}");
                }
                catch (Exception e)
                {
                    this.log.Error($"Failed to publish command to {name}");
                }

                connection.Close();
            }
        }

        public TResponse RequestReply<TCommand, TResponse>(string name, TCommand command)
        {
            this.log.Information($"usings nats:connection {natsConnectionString}");

            using(var connection = new ConnectionFactory().CreateConnection(natsConnectionString))
            {
                try
                {
                    var msg = serializer.SerializeObject(command);

                    var reply = connection.Request(name, msg);

                    var replyMsg = this.serializer.DeserializeObject<TResponse>(reply.Data);

                    this.log.Information($"Reply Received: {replyMsg}");

                    return replyMsg;
                }
                catch (Exception e)
                {
                    this.log.Error($"Failed to publish command to {name}");
                }
                finally
                {
                    connection.Close();
                }
                return default(TResponse);
            }
        }
    }
}