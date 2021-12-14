class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @cars = @warehouse.cars
  end

  def new
    @warehouse = Warehouse.new
    # authorize @warehouse
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    # authorize @warehouse
    if @warehouse.save
      redirect_to warehouses_path
    else
      render :new
    end
  end

  def destroy
    # authorize @warehouse
    @warehouse.destroy
    redirect_to warehouses_path, notice: 'Delete successfully!'
  end

  def edit
    # authorize @warehouse
  end

  def update
    # authorize @warehouse
    if @warehouse.update(warehouse_params)
      redirect_to warehouses_path, notice: 'Updated successfully!'
    else
      render :edit
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:address, :capacity)
  end

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end
end
