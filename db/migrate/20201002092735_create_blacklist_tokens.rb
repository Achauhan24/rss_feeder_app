class CreateBlacklistTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklist_tokens do |t|
      t.string :token
      t.references :user
      
      t.timestamps
    end
  end
end
