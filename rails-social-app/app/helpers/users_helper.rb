module UsersHelper
	def hello
		 @array = Array.new
                        @user.follower_ids.each do |f|
                        @array.push(@user.followers.find(f).username)
                        return @array
                    end
	end
end
