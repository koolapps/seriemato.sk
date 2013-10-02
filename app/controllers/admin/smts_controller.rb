class Admin::SmtsController < AdminController
  def index
    @smts = Smt.all.order('issue_id')
  end
end
