class AddUniqueIndexTitleFeeds < ActiveRecord::Migration[6.0]
  def change
    add_index :feeds, :title, unique: true
  end
end
