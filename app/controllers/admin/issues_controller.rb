class Admin::IssuesController < AdminController
  def index
    @issues = Issue.all.unscoped
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      flash[:success] = 'Issue has been created.'
      redirect_to_edit_page
    else
      reset_picture
      render :new
    end
  end

  def edit
    set_issue
  end

  def update
    set_issue
    if @issue.update(issue_params)
      flash[:success] = 'Issue has been updated.'
      redirect_to_edit_page
    else
      reset_picture
      render :edit
    end
  end

  private

  def set_issue
    @issue = Issue.unscoped.find(params[:id])
  end

  def redirect_to_edit_page
    redirect_to edit_admin_issue_url @issue
  end

  def reset_picture
    @issue.picture = nil
  end

  def issue_params
    params.
      require(:issue).
      permit(:name,
             :short_description,
             :long_description,
             :smt_limit,
             :solvers_limit,
             :fake_smts,
             :fake_solvers,
             :category_id,
             :picture,
             :published
            )
  end
end
