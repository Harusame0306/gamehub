class AddGameurlToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :gameurl, :string
  end
end
