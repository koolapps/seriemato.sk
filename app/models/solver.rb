class Solver < ActiveRecord::Base
  belongs_to :issue
  validates :first_name, :last_name, :email, presence: true
  validates :email, email: true
end
