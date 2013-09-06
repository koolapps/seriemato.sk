class Admin::IssuesController < ApplicationController
  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      flash[:notice] = 'Issue has been created.'
      redirect_to edit_admin_issue_url @issue
    else
      render :new
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  private

  def issue_params
    params.
      require(:issue).
      permit(:name,
             :short_description,
             :long_description,
             :SMT_limit,
             :solvers_limit)
  end
end
