class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :description
      t.string :link
      t.datetime :published_date

      t.references :agency_category

      t.timestamps
    end
  end
end
