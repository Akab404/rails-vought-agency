class SuperherosController < ApplicationController
  before_action :set_superhero, only: [:show, :edit, :update, :destroy]

  def index
    @superheros = Superhero.all
  end

  def new
    @superhero = Superhero.new
  end

  def show
  end

  def create
    @superhero = Superhero.new(superhero_params)
    @superhero.user = current_user
    if @superhero.save!
      redirect_to superhero_path(@superhero)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @superhero.update(superhero_params)
    redirect_to superhero_path(superhero_params)
  end

  def destroy
    @superhero.destroy
    redirect_to superhero_path(@superhero), status: :see_other
  end

  private

  def set_superhero
    @superhero = Superhero.find(params[:id])
  end

  def superhero_params
    params.require(:superhero).permit(:name, :team, :image_url, :address)
  end
end
