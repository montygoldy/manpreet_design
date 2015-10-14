class Post < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

  def next
  	Post.where("id > ?", id).first
  end

  def prev
  	Post.where("id < ?", id).last
  end
end
