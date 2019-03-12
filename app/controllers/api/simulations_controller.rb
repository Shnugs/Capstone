class Api::SimulationsController < ApplicationController
  def index
    @simulations = Simulation.all 
    render 'index.json.jbuilder'
  end

  def create
    @simulation = Simulation.new(
      character_id: params[:character_id]
    )
    
    if @simulation.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @simulation.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @simulation = Simulation.find(params[:id])
    render 'show.json.jbuilder'
  end

  def destroy
    simulation = Simulation.find(params[:id])
    simulation.destroy
    render json: {message: "Successfully removed simulation."}
  end
end
