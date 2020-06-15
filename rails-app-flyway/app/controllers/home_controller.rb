class HomeController < ApplicationController
  def index
  	@resumes = Resume.all
  end
end
