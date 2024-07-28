class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :youtube, :text
    add_column :users, :twitter, :text
    add_column :users, :discode, :text
    add_column :users, :twitch, :text
    add_column :users, :sns, :text
  end
end
