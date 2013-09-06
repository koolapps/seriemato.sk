class RenameSmtLimit < ActiveRecord::Migration
  def change
    rename_column :issues, :SMT_limit, :smt_limit
  end
end
