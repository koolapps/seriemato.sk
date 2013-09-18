class IndexPage
  def random_issues
    Issue.randoms
  end

  def categories
    Category.all
  end
end
