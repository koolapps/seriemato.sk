class SmtsController < ApplicationController
  include Restorable

  SAVE_DATA_AND_VOTE = 'Uložiť údaje a hlasovať'

  def new
    @smt = issue.smts.build
    restore_user_data
  end

  def create
    @smt = issue.smts.build(smt_params)

    if params[:commit] == SAVE_DATA_AND_VOTE
      @smt.validate = true if params[:commit] == SAVE_DATA_AND_VOTE
    end

    if @smt.save
      flash[:success] = 'Ďakujeme! Váš hlas bol započítaný.'
      save_user_data
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

  def resource
    @smt
  end

  def attributes_to_save
    [:sex, :year_of_birth, :job, :city, :email]
  end
end
