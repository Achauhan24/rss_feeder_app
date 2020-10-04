class AddClickCountToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :click_count, :integer, default: 0
  end
end
