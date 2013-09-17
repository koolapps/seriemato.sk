class SmtsController < ApplicationController
  def create
    @smt = Issue.find(params[:issue_id]).smts.build
    @smt.save
    respond_to do |format|
      format.js
    end
  end
end
