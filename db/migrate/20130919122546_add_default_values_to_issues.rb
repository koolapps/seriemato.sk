class AddDefaultValuesToIssues < ActiveRecord::Migration
  def up
    change_column :issues, :smt_limit, :integer, default: 0
    change_column :issues, :solvers_limit, :integer, default: 0
    change_column :issues, :fake_smts, :integer, default: 0
    change_column :issues, :fake_solvers, :integer, default: 0
  end

  def down
    change_column :issues, :smt_limit, :integer, default: nil
    change_column :issues, :solvers_limit, :integer, default: nil
    change_column :issues, :fake_smts, :integer, default: nil
    change_column :issues, :fake_solvers, :integer, default: nil
  end
end
