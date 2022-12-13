class SeedsController < ApplicationController
  def new
    @site = Site.find(params[:site_id])
    @seed = Seed.new()
    # @site.seeds ? @all_seeds = @site.seeds : @all_seeds = []
  end

  def create
    @site = Site.find(params[:site_id])
    @seed = Seed.new(seed_params)
    @seed.site_id = @site.id
    if @seed.save
      redirect_to site_path(@site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @site = Site.find(params[:site_id])
    @seeds = Seed.where(site_id: @site.id)
  end

  private
  def seed_params
    params.require(:seed).permit(:name, :description, :image_url, :site_id)
  end

end
