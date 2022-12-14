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

  # WHEN I SELECT ONE OF MY SITES I SEE THE ROUTE SITE_PATH (SHOW) WHERE I CAN ALSO SEE ALL THE LOGS OF THE SITE AS WELL
  def show
    @site = Site.find(params[:id])
    @logs = "no logs"
    Log.where(site_id: @site.id) ? @logs = Log.where(site_id: @site.id) :  @logs = []
    Mood.where(site_id: @site.id) ? @moods = Mood.where(site_id: @site.id) : @moods = []
    Seed.where(site_id: @site.id) ? @seeds = Seed.where(site_id: @site.id) : @seeds = []
  end

  def destroy
    @site = Site.find(params[:id])
    @user = User.where(id: @site.user_id)
    @site.destroy
    redirect_to sites_path
  end

  def index
    @sites = current_user.sites
    @all_sites = Site.all
    @all_users = User.all
    @logs = @sites.last.logs
    @moods = @sites.last.moods

    # THIS CODE IS AN EXAMPLE OF WHAT WE USED IN RYB TO PLOT IN MAP. NOT SURE IF WE WILL USE IT >>>
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
