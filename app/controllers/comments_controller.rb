class CommentsController < ApplicationController


  def index

  end
  def new	

   @comment = Commment.new

  end

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.build(comment_params)
   @comment.user = current_user
   @comment.save
   redirect_to root_path
  end

  def edit
  end

  def show
    @post = Post.find(params[:post_id])
    @comments = Post.comment.all 
  end

  def destroy
  end

private
def comment_params
  params.require(:comment).permit(:comment, :content, :post_id, :user_id, :create_at)
end

end
