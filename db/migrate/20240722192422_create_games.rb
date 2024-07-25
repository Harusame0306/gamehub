class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :gametitle
      t.text :gamebody
      t.float :gamehard
      t.string :gametime
      t.text :gameclear
      t.string :game_image_id

      t.timestamps
    end
  end
end
