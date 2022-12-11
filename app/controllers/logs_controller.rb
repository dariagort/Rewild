class LogsController < ApplicationController
  def new
    @log = Log.new
    @site = Site.find(params[:site_id])
  end

  def create
    @log = Log.new(log_params)
    @site = Site.find(params[:site_id])
    @log.site = @site
    if @log.save
      redirect_to site_path(@site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @log = Log.where(site_id: @site.id, id: log.id)
  end

  def update
    @log = Log.find(params[:id])
    if @log.update(log_params)
      redirect_to site_path(@site)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @site = Site.find(params[:id])
    @log = Log.where(site_id: @site.id, id: log.id)
    @log.destroy
    redirect_to site_path
  end

  private

  def log_params
    params.require(:log).permit("date(1i)", "date(2i)", "date(3i)", :title, :description, :site_id, photos: [])
  end
end
