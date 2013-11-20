class AddTimestampsToSolvers < ActiveRecord::Migration
  def change
    add_column :solvers, :created_at, :datetime
    add_column :solvers, :updated_at, :datetime
  end
end
