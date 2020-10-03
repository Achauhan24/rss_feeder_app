class CreateAgencyCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :agency_categories do |t|
      t.string :url
      t.references :agency
      t.references :category
      t.references :user
      
      t.timestamps
    end
  end
end
