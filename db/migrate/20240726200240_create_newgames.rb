class CreateNewgames < ActiveRecord::Migration[7.1]
  def change
    create_table :newgames do |t|

      t.integer :user_id
      t.string :gametitle
      t.float :gamehard
      t.text :gamebody
      t.string :gametime
      t.text :gameclear
      t.string :game_image_id

      t.timestamps
    end
  end
end
