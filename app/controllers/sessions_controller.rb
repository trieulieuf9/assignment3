class SessionsController < ApplicationController
	def new
		
	end

	def create
		if @user = User.find_by(email: params[:email])
			if @user.authenticate(params[:password])
				session[:user_id] = @user.id
				redirect_to root_path
			else
				flash.now[:error] = "Wrong password"
				render "new"
			end
		else
			flash.now[:error] = "Wrong email"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Logged Out"
		redirect_to root_path
	end
end
