class TagsController < ApplicationController
	def index
		    if params[:name]
    		@tags = Tag.where('name LIKE ?', "%#{params[:name]}%")
    
 	   	    else
				@tags = Tag.where("created_at >= ?", Time.zone.now.beginning_of_day)
	   		end
	end

	def show
		@tag = Tag.find(params[:id])
		@tweets = @tag.tweets.all
		@count = @tweets.length
		@user_names = User.pluck(:username)
	end


end
