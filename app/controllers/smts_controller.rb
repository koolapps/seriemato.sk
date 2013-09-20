class SmtsController < ApplicationController
  SAVE_DATA_AND_VOTE = 'Uložiť údaje a hlasovať'

  def new
    @smt = issue.smts.build
  end

  def create
    @smt = issue.smts.build(smt_params)
    if params[:commit] == SAVE_DATA_AND_VOTE
      @smt.validate = true
    end
    if @smt.save
      flash[:success] = 'Ďakujeme! Váš hlas bol započítaný.'
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
      permit(:sex, :year_of_birth, :city, :job)
  end
end
