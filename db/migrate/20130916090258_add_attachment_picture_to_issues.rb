class AddAttachmentPictureToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :issues, :picture
  end
end
