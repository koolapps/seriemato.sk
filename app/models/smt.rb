class Smt < ActiveRecord::Base
  belongs_to :issue

  after_save { self.issue.save }
end
