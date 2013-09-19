class Issue < ActiveRecord::Base
  belongs_to :category
  has_many :smts, dependent: :destroy

  has_attached_file :picture,
                    styles: {
                      small: '144x54#',
                      large: '640x240#'
                    },
                    default_url: '/images/missing.png'

  validates :name, :short_description, :long_description, :smt_limit, :solvers_limit, presence: true
  validates :smt_limit, :solvers_limit, numericality: { only_integer: true }

  scope :randoms, -> { order('random()').limit(8) }

  after_save :update_smts_count

  def related_issues
    Issue.where("category_id = ? AND id != ?", self.category_id, self.id)
  end

  def smt_count
    if fake_smts
      smts.count + fake_smts
    else
      smts.count
    end
  end

  private

  def update_smts_count
    self.update_column :smts_count, fake_smts + self.smts.count
  end
end
