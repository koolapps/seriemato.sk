class IndexPagesController < ApplicationController
  include ApplicationHelper

  def index
    @index_page = IndexPage.new
  end
end
