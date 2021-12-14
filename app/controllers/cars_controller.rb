class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :book]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
    # authorize @warehouse
  end

  def create
    @warehouse = Warehouse.find(params[:warehouse_id])
    @car = Car.new(car_params)
    @car.warehouse = @warehouse
    @car.user = current_user
    # authorize @warehouse
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def destroy
    # authorize @warehouse
    @car.destroy
    redirect_to warehouses_path, notice: 'Delete successfully!'
  end

  def edit
    # authorize @warehouse
  end

  def update
    # authorize @warehouse
    if @car.update(car_params)
      redirect_to cars_path, notice: 'Updated successfully!'
    else
      render :edit
    end
  end

  def book
    if @car.status == 'Book'
      @car.status = 'Free'
      @car.save
      redirect_to cars_path
    elsif @car.status == 'Free'
      @car.status = 'Book'
      @car.save
      redirect_to cars_path
    end
  end

  private

  def car_params
    params.require(:car).permit(:model, :year, :status, :color)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
