class Solver < ActiveRecord::Base
  belongs_to :issue

  validates :email, email: true
  validates :first_name, :last_name, :email, presence: true
  validates :issue, presence: true

  after_save { self.issue.save }

  def issue
    Issue.unscoped { super }
  end
end
