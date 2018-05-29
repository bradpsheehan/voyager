class SessionsController < ApplicationController

  def new; end

  def create
    account = Account.find_by(email: params[:email])

    if account && account.authenticate(params[:password])
      session[:user_id] = account&.user_id
      redirect_to chatrooms_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
