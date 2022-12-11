class MoodsController < ApplicationController
  def new
    @site = Site.find(params[:site_id])
    @mood = Mood.new
    # THIS IS NECESARY BECAUSE I SHOW THE TAGS WHEN FILLING THE FORM
    @site.moods ? @all_moods = @site.moods : @all_moods = []
  end

  def create
    @site = Site.find(params[:site_id])
    @mood = Mood.new(mood_params)
    @mood.site_id = @site.id
    if @mood.save
      redirect_to site_path(@site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @site = Site.find(params[:site_id])
    @mood = Mood.find(params[:id])
  end

  def update
    @site = Site.find(params[:site_id])
    @mood = Mood.find(params[:id])
    if @mood.update(mood_params)
      redirect_to new_site_mood_path(@site)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:name, :description, :site_id, :color)
  end
end
