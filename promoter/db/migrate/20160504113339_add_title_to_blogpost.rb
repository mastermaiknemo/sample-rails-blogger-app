class AddTitleToBlogpost < ActiveRecord::Migration
  def change
    add_column :blogposts, :title, :string
  end
end
