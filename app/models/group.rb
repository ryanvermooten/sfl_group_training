class Group < ActiveRecord::Base
	belongs_to :user
	has_attached_file :group_picture,
	:storage => :dropbox,
	:dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
	:styles => { :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png",
  	:dropbox_options => {       
	:path => proc { |style| "#{style}/#{id}_#{group_picture.original_filename}"},       
	:unique_filename => true   
}
validates_attachment_content_type :group_picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
  	#validates_attachment_content_type :group_picture, :content_type => /\Aimage\/.*\Z/
