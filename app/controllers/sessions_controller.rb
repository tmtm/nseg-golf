class SessionsController < ApplicationController
  skip_before_filter :priv

  def index
    render 'new'
  end

  def create
    user = User.find_by_name params[:name]
    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to :posts
    else
      flash[:error] = 'Login failure'
      redirect_to :sessions
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to :sessions
  end
end
