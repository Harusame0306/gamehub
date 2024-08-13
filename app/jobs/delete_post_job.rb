class DeletePostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    post.destroy # レコードを削除
  end
end
