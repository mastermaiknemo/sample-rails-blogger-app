class BlogpostsController < ApplicationController
before_action :authenticate_blogger!
helper_method :sort_column, :sort_direction


	def index
		@blogposts = Blogpost.order(sort_column + " " + sort_direction)
	end

	def single
    @blogpost = Blogpost.find(params[:id])
    @comments = @blogpost.comments.last(5)
  end



  	def new
  		if params[:blogpost] != nil
  		 @post =  Blogpost.new(:content => blogpost_params["content"], :title => blogpost_params["title"], :author => blogpost_params["author"], :blogger_id => blogpost_params["blogger_id"].to_i)
  	     if @post.save
           render action: "index"
       end
    end
    end


  private

  def blogpost_params
    params[:blogpost]
  end



  def sort_column
    Blogpost.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end