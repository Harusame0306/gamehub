class Newgame < ApplicationRecord
  
  belongs_to :user
  attachment :game_image

  with_options presence: true do
    validates :gametitle
  end
  
end
