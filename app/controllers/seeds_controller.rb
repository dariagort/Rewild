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
    # I HAVE TO INCLUDE THIS METHOD "NEW" HERE BECAUSE I HAVE THE FORM IN THE SAME PAGE AAS THE INDEX. IS THERE A BETTER WAY TO DO THIS?
    @seed = Seed.new()
  end

  def edit
    @site = Site.find(params[:site_id])
    @seed = Seed.find(params[:id])
  end

  def update
    @site = Site.find(params[:site_id])
    @seed = Seed.find(params[:id])
    if @seed.update(seed_params)
      redirect_to site_seeds_path(@site)
    else
      render :new, status: :unprocessable_entity
    end

  end
  private
  def seed_params
    params.require(:seed).permit(:name, :description, :image_url, :site_id)
  end

end
