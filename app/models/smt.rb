class Smt < ActiveRecord::Base
  attr_writer :validate

  belongs_to :issue

  after_save { self.issue.save }

  validates :sex, :job, :year_of_birth, :city, presence: true, if: :validate?
  validates :issue, presence: true

  def validate?
    @validate
  end

  def issue
    Issue.unscoped { super }
  end
end
