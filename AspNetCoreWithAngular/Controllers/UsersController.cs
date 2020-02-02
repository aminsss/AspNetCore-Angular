using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreWithAngular.DomainClasses;
using AspNetCoreWithAngular.Interfaces;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AspNetCoreWithAngular.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IRoleService _roleService;
        private readonly IUserService _userService;
        private readonly IImageResizer _imageResizer;
        private readonly IHostingEnvironment _env;


        public UsersController(IUserService userService, IRoleService roleService,IImageResizer imageResizer, IHostingEnvironment env)
        {
            _imageResizer = imageResizer; 
            _userService = userService;
            _roleService = roleService;
            _env = env;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<IActionResult> GetUsers(int page = 1, int pageSize = 5, string searchString = "")
        {
            searchString = searchString ?? string.Empty;

            var list = await _userService.GetBySearch(page, pageSize, searchString);

            int totalCount = list.TotalCount;
            int numPages = (int)Math.Ceiling((float)totalCount / pageSize);


            var getList = (from obj in list.Records
                           select new
                           {
                               profile = obj.Profile,
                               moblie = obj.moblie,
                               userid = obj.UserId,
                               rolename = obj.Role.RoleName,
                               name = obj.Name,
                               isactive = obj.ISActive,
                               email = obj.Email,
                               addedate = obj.AddedDate,
                           });

            return  Ok(new { getList, totalCount, numPages });
        }

        // GET: api/Users/5
        [HttpGet("{id}", Name = "Get")]
        public async Task<IActionResult> GetById(int id)
        {
            var user = await _userService.GetById(id);
            if (user == null)
            {
                return NotFound();
            }

            return Ok(user);
        }

        // POST: api/Users
        [HttpPost]
        public async Task<IActionResult> Post(User user, IFormFile file)
        {
            var fileName = "no-photo.png";
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    var uploads = Path.Combine(_env.WebRootPath, "Upload\\Profile");
                    fileName = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(file.FileName);

                    using (var fileStream = new FileStream(Path.Combine(uploads, fileName), FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                    //---------------------resize Images ----------------------
                    _imageResizer.Resize(Path.Combine(uploads, fileName), Path.Combine(uploads, "thumbnail", fileName));
                }
            }
            user.Profile = fileName;
            //---------------------------
            await _userService.Add(user);

            return CreatedAtAction(nameof(GetUsers),new { id = user.UserId} , user);
        }

        // PUT: api/Users/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, User user)
        {
            if (id != user.UserId)
            {
                return BadRequest();
            }
            await _userService.Edit(user);

            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<User>> Delete(int id)
        {
            var user = await _userService.GetById(id);
            if(user == null)
            {
                return NotFound();
            }

            await _userService.Remove(user);

            return user;
        }
    }
}
