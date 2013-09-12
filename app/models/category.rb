class Category < ActiveRecord::Base
  has_many :issues

  validates :name, presence: true
end
