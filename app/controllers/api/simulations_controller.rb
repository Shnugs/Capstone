class Api::SimulationsController < ApplicationController
  def index
    @cats = Cat.all 
    render 'index.json.jbuilder'
  end

  def create
    @cat = Cat.new(
                  first_name: params[:first_name],
                  )
    
    if @cat.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @cat.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @cat = Cat.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @cat = Cat.find(params[:id])

    @cat.first_name = params[:first_name] || @cat.first_name

    if @cat.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @cat.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    render json: {message: "Successfully removed cat."}
  end
end
