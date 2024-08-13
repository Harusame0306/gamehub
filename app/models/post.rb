class Post < ApplicationRecord

  belongs_to :user
  attachment :game_image

  has_many :post_comments, dependent: :destroy

  after_create :schedule_deletion

  private

  def schedule_deletion
    DeletePostJob.set(wait: 24.hours).perform_later(self.id)
  end

  with_options presence: true do
    validates :body
  end
  
end
