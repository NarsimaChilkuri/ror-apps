class TweetsController < ApplicationController
	before_action :authenticate_user!
	def index
		@tweet = Tweet.new
		@user_names = User.pluck(:username)
		if params[:body]
    		@tweets = current_user.feed.where('body LIKE ?', "%#{params[:body]}%")
    
 	    else
		@tweets = current_user.feed.order("created_at DESC")
	   end
	end

	def create
		@tweet = current_user.tweets.new(tweet_params)
		@array_for_tag = @tweet.body.scan(/#\w+\b/)
		@tweet.body = @tweet.body.gsub(Regexp.union(@array_for_tag), '')
		@tweet.save
	    

	    unless @array_for_tag == []
	    	@array_for_tag.each do |tag|
	    		@tag = Tag.find_or_initialize_by(name: tag)
	    		@tag.save
	    		@tweet.tags << @tag
	        end
	    end


	    redirect_to tweets_path
	    flash[:notice] = "Thanks for posting!"
	end

	def destroy
		Tweet.destroy(params[:id])
		redirect_to tweets_path
	end

	private
		def tweet_params
			params.require(:tweet).permit(:body, :attachment)
		end
end
