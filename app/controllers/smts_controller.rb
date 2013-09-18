class SmtsController < ApplicationController
  def create
    @smt = Issue.find(params[:issue_id]).smts.build
    @smt.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @smt = Smt.find(params[:id])
    @smt.update(params.require(:smt).permit([:sex, :year_of_birth, :city, :job]))
    flash[:success] = 'Ďakujeme! Údaje boli uložené.'
    redirect_to issue_path @smt.issue
  end
end
