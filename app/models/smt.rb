class Smt < ActiveRecord::Base
  attr_writer :validate

  belongs_to :issue

  after_save { self.issue.save }

  validates :sex, :job, :year_of_birth, :city, presence: true, if: :validate?

  def validate?
    @validate
  end
end
