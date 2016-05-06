class Blogpost < ActiveRecord::Base
	has_many :comments
	belongs_to :blogger
end
