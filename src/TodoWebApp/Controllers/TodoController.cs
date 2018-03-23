using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bus;
using Microsoft.AspNetCore.Mvc;
using TodoMessages;
using TodoWebApp.Models;

namespace TodoWebApp.Controllers
{
    public class TodoController : Controller
    {
        private readonly ICommandBus bus;

        public TodoController(ICommandBus bus)
        {
            this.bus = bus;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ActionName("Create")]
        public IActionResult Create(TodoViewModel model)
        {
            var createTodo = new CreateTodo(model.Name, model.Description);

            var reply = this.bus.RequestReply<CreateTodo, dynamic>(CreateTodo.Namespace, createTodo);

            ViewData["Response"] = reply["response"];

            return View("Index");
        }
    }
}