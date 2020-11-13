class DosesController < ApplicationController
  before_action :find_cocktail, only: [:show, :create, :edit, :update]
  before_action :find_dose, only: [:show, :update, :edit, :destroy]

  def show

  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @dose.update(dose_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
