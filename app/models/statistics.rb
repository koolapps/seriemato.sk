class Statistics
  def total_issues
    Issue.count
  end

  def total_smts
    Issue.sum(:smts_count)
  end

  def latest_issue
    Issue.last
  end

  def last_week_issues_count
    Issue.where('created_at > ?', 7.days.ago).count
  end

  def top_issue_by_smts
    issues_by_smts.limit(1).first
  end

  def last_week_top_issue_by_smts
    Issue.joins(:smts).select('issues.*, count(smts.id) as count').where('smts.created_at > ?', 7.days.ago).group('issues.id').limit(1).first
  end


  def lowest_issue_by_smts
    issues_by_smts.order('smts_count ASC, issues.created_at ASC').limit(1).first
  end

  def top_category
    Category.joins(:issues).select('categories.*, count(issues.id) as issues_count').order('issues_count DESC').group('categories.id').limit(1).first
  end

  private

  def issues_by_smts
    Issue.order('smts_count DESC')
  end
end
