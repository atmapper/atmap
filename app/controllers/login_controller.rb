class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:create]
  skip_before_filter :authorize

	def create
		session[:id] = nil
	    session[:name] = nil
		user = User.find_by("email = ? and startflg = '1' and deleteflg = '0'", params[:email])
	    if user && user.authenticate(params[:password])
	      session[:id] = user.id
	      session[:name] = user.name

	      render json: JSON['[{"id":"' + user.id.to_s + '","name":"' + user.name + '"}]'], status: :ok
    	else
	      @loginerr = 'error'
    	  render json: '{}',status: 400
		end
   end
	def destroy
    	session[:id] = nil
    	render json: '{}' , status: :ok
	end
end
