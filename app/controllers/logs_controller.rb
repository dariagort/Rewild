class LogsController < ApplicationController
  def new
    @log = Log.new
    @site = Site.find(params[:site_id])
  end

  def create
    @log = Log.new(log_params)
    @site = Site.find(params[:site_id])
    @log.site = @site
    unless @log.save
      render :new, status: :unprocessable_entity
    end
  end

  private

  def log_params
    params.require(:log).permit("date(1i)", "date(2i)", "date(3i)", :title, :description, :site_plant_id, photos: [])
  end
end
