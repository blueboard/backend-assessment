class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authorize!

  helper_method :current_account

  private

  def authorize!
    return true if current_account
    respond_to do |format|
      format.json { head :unauthorized }
      format.html { redirect_to new_session_path }
    end
  end

  def current_account
    @account ||= Session.find_by(token: session_token)&.account
  end

  def session_token
    session[:token] || request.headers['Authorization']&.split(' ')&.last
  end
end
