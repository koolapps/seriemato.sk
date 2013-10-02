class Solver < ActiveRecord::Base
  belongs_to :issue
  validates :email, email: true
  validates :first_name, :last_name, :email, presence: true

  def issue
    Issue.unscoped { super }
  end
end
