class Post < ApplicationRecord
  belongs_to :user
  attachment :game_image

  with_options presence: true do
    validates :body
  end
end
