using Blog.DataAccess.Common.Interfaces;
using Blog.DataAccess.Data.Blogging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Service.Blogging
{
    public interface IPostService
    {
        IEnumerable<Post> GetByKeyWord(string keyword);
        Post AddPost(Post post);
    }
}
