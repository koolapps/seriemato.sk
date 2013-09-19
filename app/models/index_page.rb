class IndexPage
  def random_issues
    Issue.randoms
  end

  def categories
    Category.all
  end

  def statistics
    Statistics.new
  end
end
