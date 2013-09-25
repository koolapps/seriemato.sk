class SmtsController < ApplicationController
  SAVE_DATA_AND_VOTE = 'Uložiť údaje a hlasovať'

  def new
    @smt = issue.smts.build
    restore_user_data_from_cookies
  end

  def create
    @smt = issue.smts.build(smt_params)

    if params[:commit] == SAVE_DATA_AND_VOTE
      @smt.validate = true if params[:commit] == SAVE_DATA_AND_VOTE
    end

    if @smt.save
      flash[:success] = 'Ďakujeme! Váš hlas bol započítaný.'
      save_user_data_to_cookies
    else
      render 'new'
    end
  end

  private

  def issue
    Issue.find(params[:issue_id])
  end

  def smt_params
    params.
      require(:smt).
      permit(:sex, :year_of_birth, :city, :job, :email)
  end

  def save_user_data_to_cookies
    cookies[:smt_sex] = { value: smt_params[:sex], expires: 3.months.from_now }
    cookies[:smt_year_of_birth] = { value: smt_params[:year_of_birth], expires: 3.months.from_now }
    cookies[:smt_job] = { value: smt_params[:job], expires: 3.months.from_now }
    cookies[:smt_city] = { value: smt_params[:city], expires: 3.months.from_now }
    cookies[:smt_email] = { value: smt_params[:email], expires: 3.months.from_now }
  end

  def restore_user_data_from_cookies
    @smt.sex = cookies[:smt_sex]
    @smt.year_of_birth = cookies[:smt_year_of_birth]
    @smt.job = cookies[:smt_job]
    @smt.city = cookies[:smt_city]
    @smt.email = cookies[:smt_email]
  end
end
