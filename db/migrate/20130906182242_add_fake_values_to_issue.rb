class AddFakeValuesToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :fake_smts, :string
    add_column :issues, :fake_solvers, :string
  end
end
