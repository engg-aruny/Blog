using Blog.DataAccess.Common;
using Blog.DataAccess.Common.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Blog.DataAccess.Data.Blogging
{
    public class PostRepository : Repository<Post>, IPostRepository
    {
        public PostRepository(Blogging context)
            : base(context) { }

        public override IEnumerable<Post> GetAll()
        {
            return _entities.Set<Post>().AsEnumerable();
        }

        IEnumerable<Post> IPostRepository.GetByKeyWord(string keyword)
        {
            Expression<Func<Post, bool>> predicate = x => x.Content.Contains(keyword);
            return FindBy(predicate);
        }

        public Post AddPost(Post post)
        {
            var _post = base.Add(post);
            base.Save();
            return _post;
        }
    }
}
