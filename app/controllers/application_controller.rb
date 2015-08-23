class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize
  def authorize
  	if session[:id]
  	else
  		redirect_to root_path, notice:"本操作にはユーザ登録、ログインが必要です。実施した上でお願いいたします。"
  	end
  end
end
