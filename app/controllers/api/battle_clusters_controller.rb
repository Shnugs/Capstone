class Api::BattleClustersController < ApplicationController
  def index
    @battle_clusters = BattleCluster.all 
    render 'index.json.jbuilder'
  end

  def create
    @battle_cluster = BattleCluster.new(
      first_name: params[:first_name],
    )
    
    if @battle_cluster.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @battle_cluster.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def get
    @battle_clusters = BattleCluster.where(simulation_id: params[:id])
    render 'index.json.jbuilder'
  end

  def show
    @battle_cluster = BattleCluster.find(params[:id])
    render 'show.json.jbuilder'
  end

  def destroy
    battle_cluster = BattleCluster.find(params[:id])
    battle_cluster.destroy
    render json: {message: "Successfully removed Battle Cluster."}
  end
end
