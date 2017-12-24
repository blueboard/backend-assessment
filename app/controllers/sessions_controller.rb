class SessionsController < ApplicationController
  skip_before_action :authorize!, only: [:new, :create]

  def new
  end

  def create
    account = Account.find_by(email: params[:email])&.authenticate(params[:password])
    account ? set_up_session(account) : failed_authentication
  end

  def destroy
    Session.find_by(token: session_token).destroy
    session.delete('token')
    respond_to do |format|
      format.json { head :ok }
      format.html { redirect_to new_session_path }
    end
  end

  def set_up_session(account)
    account_session = account.sessions.create
    respond_to do |format|
      format.json do
        response.headers['Authorization'] = "Base #{account_session.token}"
        head :ok
      end

      format.html do
        session[:token] = account_session.token
        redirect_to root_path
      end
    end
  end

  def failed_authentication
    respond_to do |format|
      format.json { render status: :unprocessable_entity, json: { errors: ['Email or password is wrong'] } }
      format.html { redirect_to new_session_path, alert: 'Email or password is wrong' }
    end
  end
end
