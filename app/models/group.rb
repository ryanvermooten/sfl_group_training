class Group < ActiveRecord::Base
	belongs_to :user
	  has_many :gardeners
		accepts_nested_attributes_for :gardeners
  has_many :attendance_registers
	has_attached_file :group_picture,
	:dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
	:styles => { :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png",
  	:dropbox_options => {       
	:path => proc { |style| "#{style}/#{id}_#{group_picture.original_filename}"},       
	:unique_filename => true   
}
validates_attachment_content_type :group_picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
process_in_background :group_picture
end
  	#validates_attachment_content_type :group_picture, :content_type => /\Aimage\/.*\Z/
