using Blog.DataAccess.Common;
using Blog.DataAccess.Common.Interfaces;
using Blog.DataAccess.Data.Blogging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Service.Blogging
{
    public class PostService : IPostService
    {
        private readonly IPostRepository _postRepository;

        public PostService(IPostRepository postRepository)
        {
            _postRepository = postRepository;
        }

        public IEnumerable<Post> GetByKeyWord(string keyword)
        {
            return _postRepository.GetByKeyWord(keyword);
        }

        public Post AddPost(Post post)
        {
            return _postRepository.AddPost(post);
        }
    }
}
