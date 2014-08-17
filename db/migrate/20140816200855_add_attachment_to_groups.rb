class AddAttachmentToGroups < ActiveRecord::Migration
  def change
  	add_attachment :groups, :group_picture
  end
end
