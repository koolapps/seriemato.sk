class AddSmtsCountToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :smts_count, :integer, default: 0
  end
end
