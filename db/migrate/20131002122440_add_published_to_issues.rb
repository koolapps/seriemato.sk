class AddPublishedToIssues < ActiveRecord::Migration
  def up
    add_column :issues, :published, :boolean, default: false
    connection.execute 'UPDATE issues SET published=TRUE'
  end

  def down
    remove_column :issues, :published
  end
end
