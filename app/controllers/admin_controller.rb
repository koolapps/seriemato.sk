class AdminController < ApplicationController
  layout 'admin'

  before_filter :authenticate if Rails.env.production?

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['login'] && password == ENV['password']
    end
  end
end
