class SuppliesController < ApplicationController
  def index
    @supplys = Supply.all
  end

  def new
    @supply = Supply.new
  end

  def create
    @supply = Supply.new(supply_params)
    if @supply.save
      redirect_to supplys_path
    else
      render 'new'
    end
  end

  def show

  end

  def edit
    @supply = Supply.find(params[:id])
  end

  def update
    @supply = Supply.find(params[:id])
    if @supply.update_attributes(supply_params)
      redirect_to supplys_path
    else
      render 'edit'
    end
  end

  def destroy
    @supply = Supply.find(params[:id])
    @supply.destroy
    redirect_to supplys_path
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_params
      params.require(:supply).permit(:suppliesid, :supplyname)
    end
end
