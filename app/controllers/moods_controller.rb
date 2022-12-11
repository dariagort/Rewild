class MoodsController < ApplicationController
  def new
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    @site.user = current_user
    if @site.save
      redirect_to site_path(@site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def mood_params
    params.require(:site).permit(:name, :description)
  end
end
