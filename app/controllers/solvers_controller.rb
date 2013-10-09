class SolversController < ApplicationController
  include Restorable

  helper_method :show_long_text?

  def new
    @solver = issue.solvers.build
    restore_user_data
  end

  def create
    @solver = issue.solvers.build(solver_params)

    if @solver.save
      flash[:success] = 'Ďakujeme! Boli ste pridaný na zoznam riešiteľov tohto problému.'
      save_user_data
      cookies[:solver_saw_long_text?] = { value: true, expires: 3.months.from_now }
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

  def resource
    @solver
  end

  def attributes_to_save
    [:first_name, :last_name, :email]
  end

  def show_long_text?
    !cookies[:solver_saw_long_text?]
  end
end
