class UploadController < ApplicationController

def index
  @uploads = Upload.all
end

def new
  @uploads = Upload.new
end

def create
  @uploads = Upload.new(upload_params)
  if @uploads.save
    redirect_to uploads_path, notice: "The upload #{@uploads.name} has been uploaded"
  else
    render "new"
  end
end

def destroy
  @uploads = Upload.find(params[:id])
  @uploads.destroy
  redirect_to uploads_path, notice: "The upload #{@uploads.name} has been deleted."
end

private

def upload_params
  params.require(:uploads).permit(:name, :attachment)
end
end
