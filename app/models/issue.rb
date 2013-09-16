class Issue < ActiveRecord::Base
  belongs_to :category

  has_attached_file :picture

  validates :name, :short_description, :long_description, :smt_limit, :solvers_limit, presence: true
  validates :smt_limit, :solvers_limit, numericality: { only_integer: true }

  scope :randoms, -> { order('random()').limit(8) }

  def related_issues
    Issue.where("category_id = ? AND id != ?", self.category_id, self.id)
  end
end
