class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.comments.create(params[:comment])

    redirect_to post
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to comment.post
  end
end
