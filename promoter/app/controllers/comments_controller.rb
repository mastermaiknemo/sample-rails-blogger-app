class CommentsController < ApplicationController
	before_action :authenticate_blogger!


	  def create
      bid =params[:blogpost_id]
    @comment = Comment.new(comment_params)
    @comment.blogpost_id = bid
    @comment.save
    blogp = Blogpost.find(bid)

    respond_to do |format|
        format.json {render json: blogp.comments.last(5)}
        format.html {redirect_to request.referrer}
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content, :blogpost)
  end
end