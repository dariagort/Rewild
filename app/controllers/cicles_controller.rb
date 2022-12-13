class CiclesController < ApplicationController
  def new
    @cicle = Cicle.new()
  end

  def create
    @cicle = Cicle.new(cicle_params)
    @cicle.user = current_user
    if @cicle.save
      redirect_to cicles_path(@cicles)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @cicles = current_user.cicles
    # THE FOLLOWING LINE IN NECESDARY BECAUSE I AM RENDERING THE FORM IN THE INDEX. IS THERE A BETTER WAY TO DO THIS IF I WANT TO DISPLAY THE FORM IN AN INDEX OR SHOW PAGE?
    @cicle = Cicle.new()
  end

  def edit
    @cicle = Cicle.find(params[:id])
  end

  def update
    @cicle = Cicle.find(params[:id])
    if @cicle.update(cicle_params)
      redirect_to cicles_path(@cicles)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def cicle_params
    params.require(:cicle).permit(:start_date, :end_date)
  end
end
