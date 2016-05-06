class Comment < ActiveRecord::Base
	belongs_to :blogpost
end
