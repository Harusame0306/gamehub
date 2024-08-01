class Game < ApplicationRecord
  belongs_to :user
  attachment :game_image

  with_options presence: true do
    validates :gametitle
    validates :gamebody
    validates :game_image
  end

  def game_gamehard_percentage
    gamehard*20
  end
end
