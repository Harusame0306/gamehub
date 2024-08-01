class AddStarTogames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :star, :string
  end
end
