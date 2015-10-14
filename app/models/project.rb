class Project < ActiveRecord::Base
	has_attached_file :thumbnail, :styles => { :large => "1000x1000#", :medium => "600x600#" }
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: :slugged


  def next
  	Project.where("id > ?", id).first
  end

  def prev
  	Project.where("id < ?", id).last
  end
end
