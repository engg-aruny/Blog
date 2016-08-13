using Blog.DataAccess.Common.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Data.Blogging
{
    public interface IPostRepository
    {
         IEnumerable<Post> GetByKeyWord(string keyword);
         Post AddPost(Post post);
    }
}
