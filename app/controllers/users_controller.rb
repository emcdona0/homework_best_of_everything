class UsersController < ApplicationController
  def index
    @users = User.all
    @favorites = Favorite.all
  end

  def show
    @user = User.find(params[:id])
    @favorite = Favorite.find(params[:id])
    @favorite_venue = Venue.where({:id => @favorite.venue_id})
    @favorite_dish = Dish.where({:id => @favorite.dish_id})
    @favorite_user = User.where({:id => @favorite.user_id})
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:username]

    if @user.save
      redirect_to "/users", :notice => "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.username = params[:username]

    if @user.save
      redirect_to "/users", :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to "/users", :notice => "User deleted."
  end
end
