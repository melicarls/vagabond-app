class DropCityPostsTable < ActiveRecord::Migration
  def change
    drop_table :city_posts
  end
end
