class IndexPagesController < ApplicationController
  def index
    @random_issues = Issue.randoms
  end
end
