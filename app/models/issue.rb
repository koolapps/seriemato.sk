class Issue < ActiveRecord::Base
  validates :name, :short_description, :long_description, :SMT_limit, :solvers_limit, presence: true
  validates :SMT_limit, :solvers_limit, numericality: { only_integer: true }
end
