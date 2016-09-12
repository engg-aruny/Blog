blogModel.factory('homeModel', function () {
    return {
        postId: 0,
        title: '',
        content: '',
        tag: '',
        avtarImg: '',
        postedDate: new Date(),
        userId: 0
    };
});