class UsersController < ApplicationController
	def index
	
		if params[:username]
    		@users = User.where('username LIKE ?', "%#{params[:username]}%")
    
 	    else
		@users = User.where('username != ?', "#{current_user.username}")
	    end
	end
	def show
		@user_names = User.pluck(:username)
		@user = User.find(params[:id])
	end
end
