class Game < ApplicationRecord
  belongs_to :user
  attachment :game_image

  with_options presence: true do
    validates :gametitle
  end

  def game_gamehard_percentage
    gamehard.present? ? gamehard * 20 : 0
  end
end
