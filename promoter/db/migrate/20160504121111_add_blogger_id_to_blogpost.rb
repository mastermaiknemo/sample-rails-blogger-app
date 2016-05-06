class AddBloggerIdToBlogpost < ActiveRecord::Migration
  def change
    add_column :blogposts, :blogger_id, :integer
  end
end
