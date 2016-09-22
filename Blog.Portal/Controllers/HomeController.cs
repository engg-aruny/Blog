using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Blog.DataAccess.Service.Blogging;

namespace Blog.Portal.Controllers
{
    public class HomeController : Controller
    {
        private readonly IPostService _postService = null;

        public HomeController(IPostService postService)
        {
            _postService = postService;
        }

        public IActionResult Index()
        {
            var result = _postService.GetByKeyWord("Test");
            return View();
        }

        [Route("home/post")]
        public IActionResult Post()
        {
            return View();
        }

        [Route("home/about")]
        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }


        [Route("home/contact")]
        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
