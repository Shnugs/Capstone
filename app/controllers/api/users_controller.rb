class Api::UsersController < ApplicationController
  def create
    @user = User.new(
                  email: params[:email],
                  password: params[:password]
                  )
    
    if @user.save
      render json: {message: "Successfully created user"}
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "Successfully destroyed user."}
  end
end
