class CarsController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :car_not_found

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def car_not_found
    render :show, status: 404
  end
end