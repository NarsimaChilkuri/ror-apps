class ResumesController < ApplicationController
  before_action :check_post, only: [:new, :create]

  def index
    @resumes = Resume.all
  end

  def new
    @resume = @post.resumes.new
  end

  def create
    @resume = @post.resumes.new(resume_params)	
    if @resume.save
      redirect_to posts_path, notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to post_resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

  private

  def check_post
    @post = Post.find(params[:post_id])
  end

  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end