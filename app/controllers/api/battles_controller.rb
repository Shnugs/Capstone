class Api::BattlesController < ApplicationController
  def index
    @battles = Battle.all 
    render 'index.json.jbuilder'
  end

  def create
    @battle = Battle.new(
      win: params[:win],
      win_initiative: params[:win_initiative],
      dmg_taken: params[:dmg_taken],
      dmg_dealt: params[:dmg_dealt],
      turns: params[:turns],
      hits: params[:hits],
      misses: params[:misses],
      crits: params[:crits],
      atk_1_rate: params[:atk_1_rate],
      atk_2_rate: params[:atk_2_rate],
      atk_3_rate: params[:atk_3_rate],
      cluster_id: params[:cluster_id]
    )
    
    if @battle.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @battle.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @battle = Battle.find(params[:id])
    render 'show.json.jbuilder'
  end

  def destroy
    battle = Battle.find(params[:id])
    battle.destroy
    render json: {message: "Successfully removed battle."}
  end
end
