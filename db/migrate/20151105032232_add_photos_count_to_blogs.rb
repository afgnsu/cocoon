class AddPhotosCountToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :photos_count, :integer
  end
end
