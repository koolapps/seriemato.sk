class AddSolversCountToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :solvers_count, :integer, default: 0
  end
end
