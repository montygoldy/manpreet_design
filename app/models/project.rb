class Project < ActiveRecord::Base
	has_attached_file :thumbnail, :styles => { :large => "1000x1000#", :medium => "600x600#" }
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
end
