class IndexPagesController < ApplicationController
  include ApplicationHelper

  def show
    @index_page = IndexPage.new
  end
end
