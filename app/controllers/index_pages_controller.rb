class IndexPagesController < ApplicationController
  def index
    @index_page = IndexPage.new
  end
end
