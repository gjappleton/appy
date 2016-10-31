class RestaurantsController < ApplicationController
  before_action :authenticate_owner!, except: [:index, :show]

  def index
    @restaurants = restaurant.all
  end

  def new
    @restaurant = restaurant.new
  end

  def edit
    @restaurant =restaurant.find(params[:id])
  end

  def create
    @restaurant = current_owner.restaurants.new(restaurant_params)

    if @restaurant.save
    redirect_to @restaurant
    else
    render 'new'
    end
  end

  def show
    @restaurant = restaurant.find(params[:id])
  end

  def update
    @restaurant = restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

private

  def restaurant_params
    params.require(:restaurant).permit(:title, :text)
  end

end
