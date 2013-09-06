class Admin::IssuesController < ApplicationController
  def index
    @issues = Issue.all
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
      render :new
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      flash[:success] = 'Issue has been updated.'
      redirect_to_edit_page
    else
      render :edit
    end
  end

  private

  def redirect_to_edit_page
    redirect_to edit_admin_issue_url @issue
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
             :fake_solvers)
  end
end
