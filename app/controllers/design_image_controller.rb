class DesignImageController < ApplicationController
  def new
    @design_image = DesignImage.new
  end

  def create
    @design_image = DesignImage.new
    @design_image.design_image = params[:design_image]
    @design_image.user = current_user

    if @design_image.save
      flash[:notice] = "Design image is uploded"
    else
      flash[:notice] = "Fail to uplode"
    end
    redirect_to user_path
  end

  def show
    user = User.find(params[:id])
    @design_image = user.design_image
    send_data(@design_image.data, filename: @design_image.name, type: @design_image.content_type, disposition: "inline")
  end

end