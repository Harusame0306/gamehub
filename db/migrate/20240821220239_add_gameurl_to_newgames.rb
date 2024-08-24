class AddGameurlToNewgames < ActiveRecord::Migration[7.1]
  def change
    add_column :newgames, :gameurl, :string
  end
end
