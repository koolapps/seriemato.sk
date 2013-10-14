class Issue < ActiveRecord::Base
  belongs_to :category
  has_many :smts, dependent: :destroy
  has_many :solvers, dependent: :destroy

  has_attached_file :picture,
                    styles: {
                      small: '180x60#',
                      large: '750x250#'
                    },
                    default_url: '/images/missing.png'

  validates :name, :short_description, :long_description, :smt_limit, :solvers_limit, :category, presence: true
  validates :smt_limit, :solvers_limit, numericality: { only_integer: true }

  after_save :update_smts_count
  after_save :update_solvers_count

  def self.default_scope
    where('published IS true')
  end

  def related_issues
    Issue.where("category_id = ? AND id != ?", self.category_id, self.id)
  end

  def smt_progress_in_percent
    percentage(smts_count, smt_limit)
  end

  def solvers_progress_in_percent
    percentage(solvers_count, solvers_limit)
  end

  def self.randoms
    order('random()').limit(8)
  end

  private

  def add_fake_value(value, fake_value)
    if fake_value
      value + fake_value
    else
      value
    end
  end

  def percentage(count, limit)
    ((count.to_f / limit.to_f) * 100).to_i
  end

  def update_smts_count
    self.update_column :smts_count, smts_count_with_fake_value
  end

  def smts_count_with_fake_value
    add_fake_value(smts.count, fake_smts)
  end

  def update_solvers_count
    self.update_column :solvers_count, solvers_count_with_fake_value
  end

  def solvers_count_with_fake_value
    add_fake_value(solvers.count, fake_solvers)
  end

end
