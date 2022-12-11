class SitesController < ApplicationController

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.user = current_user
    if @site.save
      redirect_to sites_path(@site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @site = Site.find(params[:id])
    @logs = "no logs"
    Log.where(site_id: @site.id) ? @logs = Log.where(site_id: @site.id) :  @logs = []
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_path
  end

  def index
    @sites = current_user.sites
    @all_sites = Site.all
    # @markers = @all_sites.geocoded.map do |site|
    #   {
    #     lat: site.latitude,
    #     lng: site.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: {site: site}),
    #     # image_url: helpers.asset_url('logo.png')
    #   }
    # end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to sites_path(@sites)
    else
      render :edit, status: :unprocessable_entity
    end
  end



  private

  def site_params
    params.require(:site).permit(:name, :description, :address, :project_type, :project_area)
  end
end
