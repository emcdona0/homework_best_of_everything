class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @name_of_cuisine = Cuisine.find_by({:id => @dish.cuisine_id})
    #Question: Why can't I use :cuisine_id instead of :id like we did in the DB example

    #@movie = Movie.find(params[:id])
    #@movie_roles = Role.where({ :movie_id => @movie.id})
  end

  def new_form
  end

  def create_row
    @dish = Dish.new
    @dish.name = params[:name]
    @dish.cuisine_id = params[:cuisine_id]

    @dish.save

    render('show')
  end

  def edit_form
    @dish = Dish.find(params[:id])
  end

  def update_row
    @dish = Dish.find(params[:id])

    @dish.name = params[:name]
    @dish.cuisine_id = params[:cuisine_id]

    @dish.save

    render('show')
  end

  def destroy
    @dish = Dish.find(params[:id])

    @dish.destroy
  end
end
