class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new user_params
  	if @user.save
  		session[:user_id] = @user.id
  		flash[:success] = "Sign Up Successfully"
  		redirect_to root_path
  	else
  		flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
  		render 'new'
  	end
  end


  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end


end
