class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :priv

  private

  def priv
    @uid = session[:user_id]
    if @uid
      @user = User.find(@uid)
      @admin = @user.role == 'admin'
    else
      redirect_to new_session_path
    end
  end

  def only_admin
    unless @user.role == 'admin'
      redirect_to :root
    end
  end

end
