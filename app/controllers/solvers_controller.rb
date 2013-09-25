class SolversController < ApplicationController
  def new
    @solver = issue.solvers.build
    restore_user_data_from_cookies
  end

  def create
    @solver = issue.solvers.build(solver_params)

    if @solver.save
      flash[:success] = 'Ďakujeme! Boli ste pridaný na zoznam riešiteľov tohto problému.'
      save_user_data_to_cookies
    else
      render 'new'
    end
  end

  private

  def solver_params
    params.require(:solver).permit(:first_name, :last_name, :email)
  end

  def issue
    Issue.find(params[:issue_id])
  end

  def save_user_data_to_cookies
    cookies[:solver_first_name] = { value: solver_params[:first_name], expires: 3.months.from_now }
    cookies[:solver_last_name] = { value: solver_params[:last_name], expires: 3.months.from_now }
    cookies[:solver_email] = { value: solver_params[:email], expires: 3.months.from_now }
  end

  def restore_user_data_from_cookies
    @solver.first_name = cookies[:solver_first_name]
    @solver.last_name = cookies[:solver_last_name]
    @solver.email = cookies[:solver_email]
  end
end
